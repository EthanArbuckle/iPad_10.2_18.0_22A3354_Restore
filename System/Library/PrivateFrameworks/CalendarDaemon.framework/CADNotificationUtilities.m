@implementation CADNotificationUtilities

void __56__CADNotificationUtilities__objectIDsFromNotifications___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "objectID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __62__CADNotificationUtilities__occurrenceDatesFromNotifications___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "occurrenceDate");
  objc_msgSend(v3, "numberWithDouble:");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v4);

}

+ (int)CADDatabaseGetEventNotificationItemsWithConnection:(id)a3 afterDate:(id)a4 forSourceWithExternalIdentifier:(id)a5 excludingDelegateSources:(BOOL)a6 excludingUncheckedCalendars:(BOOL)a7 filteredByShowsNotificationsFlag:(BOOL)a8 expanded:(BOOL)a9 earliestExpirationDate:(id *)a10 notificationTypes:(id *)a11 objectIDs:(id *)a12 occurrenceDates:(id *)a13 attendeeObjectIDs:(id *)a14
{
  _BOOL8 v14;
  _BOOL8 v15;
  _BOOL8 v16;
  id v20;
  id v21;
  id v22;
  CADNotificationGatheringContext *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v34;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  LOBYTE(v34) = a9;
  v23 = -[CADNotificationGatheringContext initWithConnection:afterDate:forSourceWithExternalIdentifier:excludingDelegateSources:excludingUncheckedCalendars:filteredByShowsNotificationsFlag:expanded:]([CADNotificationGatheringContext alloc], "initWithConnection:afterDate:forSourceWithExternalIdentifier:excludingDelegateSources:excludingUncheckedCalendars:filteredByShowsNotificationsFlag:expanded:", v22, v21, v20, v16, v15, v14, v34);

  v24 = objc_msgSend(a1, "_gatherEventInvitationsAndRepliesWithContext:", v23);
  if (!v24)
  {
    v24 = objc_msgSend(a1, "_gatherSharedCalendarInvitationsWithContext:", v23);
    if (!v24)
      v24 = objc_msgSend(a1, "_gatherSharedCalendarResponsesAndResourceChangesWithContext:", v23);
  }
  v25 = (void *)objc_opt_class();
  -[CADNotificationGatheringContext notifications](v23, "notifications");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "_logNotificationCountsForNotifications:", v26);

  if (a10)
  {
    -[CADNotificationGatheringContext earliestExpiringNotification](v23, "earliestExpiringNotification");
    *a10 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[CADNotificationGatheringContext notifications](v23, "notifications");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "flattenedNotificationsFromNotifications:expanded:", v27, a9);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_notificationTypesFromNotifications:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_objectIDsFromNotifications:", v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_occurrenceDatesFromNotifications:", v28);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_attendeeObjectIDsFromNotifications:", v28);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (a11)
    *a11 = objc_retainAutorelease(v29);
  if (a12)
    *a12 = objc_retainAutorelease(v30);
  if (a13)
    *a13 = objc_retainAutorelease(v31);
  if (a14)
    *a14 = objc_retainAutorelease(v32);

  return v24;
}

+ (id)_attendeeObjectIDsFromNotifications:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  if (!a3)
    return 0;
  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__CADNotificationUtilities__attendeeObjectIDsFromNotifications___block_invoke;
  v8[3] = &unk_1E6A37B98;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

  return v6;
}

+ (id)flattenedNotificationsFromNotifications:(id)a3 expanded:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v8 = v6;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v19;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v19 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
            objc_msgSend(v13, "expandedNotifications", (_QWORD)v18);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "count");

            if (v15)
            {
              objc_msgSend(v13, "expandedNotifications");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "addObjectsFromArray:", v16);

            }
            else
            {
              objc_msgSend(v7, "addObject:", v13);
            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v10);
      }

    }
    else
    {
      v7 = v5;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)_occurrenceDatesFromNotifications:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  if (!a3)
    return 0;
  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__CADNotificationUtilities__occurrenceDatesFromNotifications___block_invoke;
  v8[3] = &unk_1E6A37B98;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

  return v6;
}

+ (id)_objectIDsFromNotifications:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  if (!a3)
    return 0;
  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__CADNotificationUtilities__objectIDsFromNotifications___block_invoke;
  v8[3] = &unk_1E6A37B98;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

  return v6;
}

+ (id)_notificationTypesFromNotifications:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  if (!a3)
    return 0;
  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__CADNotificationUtilities__notificationTypesFromNotifications___block_invoke;
  v8[3] = &unk_1E6A37B98;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

  return v6;
}

+ (int)_gatherSharedCalendarResponsesAndResourceChangesWithContext:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  id v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  int v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  objc_msgSend(v4, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __88__CADNotificationUtilities__gatherSharedCalendarResponsesAndResourceChangesWithContext___block_invoke;
  v8[3] = &unk_1E6A37BE8;
  v10 = &v12;
  v11 = a1;
  v6 = v4;
  v9 = v6;
  objc_msgSend(v5, "withAllDatabasesPerform:", v8);

  LODWORD(v5) = *((_DWORD *)v13 + 6);
  _Block_object_dispose(&v12, 8);

  return (int)v5;
}

+ (int)_gatherSharedCalendarInvitationsWithContext:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  objc_msgSend(v3, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__CADNotificationUtilities__gatherSharedCalendarInvitationsWithContext___block_invoke;
  v7[3] = &unk_1E6A36A70;
  v8 = v3;
  v5 = v3;
  objc_msgSend(v4, "withAllDatabasesPerform:", v7);

  return 0;
}

+ (int)_gatherEventInvitationsAndRepliesWithContext:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  objc_msgSend(v3, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__CADNotificationUtilities__gatherEventInvitationsAndRepliesWithContext___block_invoke;
  v7[3] = &unk_1E6A36A70;
  v8 = v3;
  v5 = v3;
  objc_msgSend(v4, "withAllDatabasesPerform:", v7);

  return 0;
}

void __88__CADNotificationUtilities__gatherSharedCalendarResponsesAndResourceChangesWithContext___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int EntityType;
  int v14;
  int v15;
  void *v16;
  NSObject *v17;
  int UID;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  int v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = (id)CalDatabaseCopyOfAllNotifications();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v11);
        EntityType = CalNotificationGetEntityType();
        if (EntityType == 19)
        {
          v15 = objc_msgSend(*(id *)(a1 + 48), "_gatherSuggestionResourceChangeNotification:withContext:database:databaseID:", v12, *(_QWORD *)(a1 + 32), a3, a2);
          goto LABEL_12;
        }
        v14 = EntityType;
        if (EntityType == 17)
        {
          v15 = objc_msgSend(*(id *)(a1 + 48), "_gatherSharedCalendarResourceChangeNotification:withContext:database:databaseID:", v12, *(_QWORD *)(a1 + 32), a3, a2);
          goto LABEL_12;
        }
        if (EntityType == 16)
        {
          v15 = objc_msgSend(*(id *)(a1 + 48), "_gatherSharedCalendarInviteReplyNotification:withContext:database:databaseID:", v12, *(_QWORD *)(a1 + 32), a3, a2);
LABEL_12:
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v15;
          goto LABEL_13;
        }
        v16 = (void *)CADNotificationLogHandle;
        if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
        {
          v17 = v16;
          UID = CalNotificationGetUID();
          *(_DWORD *)buf = 67109376;
          v26 = UID;
          v27 = 1024;
          v28 = v14;
          _os_log_impl(&dword_1B6A18000, v17, OS_LOG_TYPE_DEFAULT, "Skipping notification %d because it's of an unexpected type %d", buf, 0xEu);

        }
LABEL_13:
        if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
        {
          *a4 = 1;
          goto LABEL_21;
        }
        ++v11;
      }
      while (v9 != v11);
      v19 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      v9 = v19;
    }
    while (v19);
  }
LABEL_21:

}

void __73__CADNotificationUtilities__gatherEventInvitationsAndRepliesWithContext___block_invoke(uint64_t a1, unsigned int a2, uint64_t a3)
{
  double v4;
  double v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (**v15)(_QWORD);
  NSObject *v16;
  int RowID;
  NSObject *v18;
  const char *v19;
  int v20;
  int v21;
  const void *v22;
  const void *v23;
  NSObject *v24;
  int v25;
  NSObject *v26;
  const char *v27;
  int v28;
  int v29;
  unsigned int InvitationChangedProperties;
  unsigned int v31;
  NSObject *v32;
  int v33;
  double v34;
  const __CFArray *v35;
  int v36;
  double v37;
  double v38;
  double v39;
  double v40;
  uint64_t Count;
  CFMutableArrayRef Mutable;
  CFIndex v43;
  double v44;
  void *ValueAtIndex;
  void *v46;
  _BOOL4 v47;
  _BOOL4 v48;
  BOOL v49;
  unsigned int v50;
  double v51;
  double v52;
  int v53;
  int v54;
  NSObject *v55;
  _BOOL4 v56;
  unsigned int v57;
  const void *v58;
  double v59;
  double v60;
  double v61;
  NSObject *v62;
  _BOOL4 v63;
  int v64;
  void *v65;
  const __CFArray *v66;
  CFIndex v67;
  int v68;
  int v69;
  int v70;
  CADNotification *v71;
  CFIndex v72;
  void *v73;
  CADExpandedNotification *v74;
  int v75;
  uint64_t v76;
  __int128 v77;
  uint64_t v78;
  char v79;
  uint64_t v80;
  const __CFArray *theArray;
  unsigned int v83;
  id obj;
  _QWORD v86[7];
  uint64_t v87;
  uint64_t *v88;
  uint64_t v89;
  uint64_t v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  uint8_t buf[4];
  int v96;
  __int16 v97;
  unsigned int v98;
  __int16 v99;
  unsigned int v100;
  __int16 v101;
  double v102;
  _BYTE v103[128];
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "now");
  v5 = v4;
  v78 = a3;
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  obj = (id)CalDatabaseCopyOfAllNotifiableEventsInStore();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v103, 16);
  if (!v6)
  {

    goto LABEL_104;
  }
  v79 = 0;
  v8 = *(_QWORD *)v92;
  v9 = *MEMORY[0x1E0D0C488];
  v10 = *MEMORY[0x1E0D0C490];
  *(_QWORD *)&v7 = 67109632;
  v77 = v7;
  do
  {
    v11 = 0;
    do
    {
      if (*(_QWORD *)v92 != v8)
        objc_enumerationMutation(obj);
      v12 = *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * v11);
      v13 = CalEventCopyStore();
      v14 = CalCalendarItemCopyCalendar();
      v87 = 0;
      v88 = &v87;
      v89 = 0x2020000000;
      v90 = 0;
      v86[0] = MEMORY[0x1E0C809B0];
      v86[1] = 3221225472;
      v86[2] = __73__CADNotificationUtilities__gatherEventInvitationsAndRepliesWithContext___block_invoke_2;
      v86[3] = &unk_1E6A37BC0;
      v86[4] = &v87;
      v86[5] = v13;
      v86[6] = v14;
      v15 = (void (**)(_QWORD))MEMORY[0x1BCC9D8DC](v86);
      if (CalStoreIsFacebook())
      {
        v16 = (id)CADNotificationLogHandle;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          RowID = CalCalendarItemGetRowID();
          *(_DWORD *)buf = 67109120;
          v96 = RowID;
          v18 = v16;
          v19 = "Skipping notifiable event %d because it's in a facebook store";
          goto LABEL_15;
        }
LABEL_16:

        v15[2](v15);
        goto LABEL_17;
      }
      if ((CalStoreGetSupportsIncomingInvitations() & 1) == 0)
      {
        v16 = (id)CADNotificationLogHandle;
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          goto LABEL_16;
        v21 = CalCalendarItemGetRowID();
        *(_DWORD *)buf = 67109120;
        v96 = v21;
        v18 = v16;
        v19 = "Skipping notifiable event %d because it's in a store that doesn't support incoming invitations";
        goto LABEL_15;
      }
      if (CalEventGetJunkStatus() == 1)
      {
        v16 = (id)CADNotificationLogHandle;
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          goto LABEL_16;
        v20 = CalCalendarItemGetRowID();
        *(_DWORD *)buf = 67109120;
        v96 = v20;
        v18 = v16;
        v19 = "Skipping notifiable event %d because it's marked as junk";
LABEL_15:
        _os_log_impl(&dword_1B6A18000, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 8u);
        goto LABEL_16;
      }
      v22 = (const void *)CalStoreCopyUUID();
      if (!v22)
      {
        v16 = (id)CADNotificationLogHandle;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v28 = CalCalendarItemGetRowID();
          *(_DWORD *)buf = 67109120;
          v96 = v28;
          _os_log_impl(&dword_1B6A18000, v16, OS_LOG_TYPE_DEFAULT, "Skipping notifiable event %d because we failed to get the store identifier", buf, 8u);
        }
        goto LABEL_16;
      }
      CFRelease(v22);
      v23 = (const void *)CalEventCopyUniqueIdentifier();
      if (!v23)
      {
        v24 = (id)CADNotificationLogHandle;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          v29 = CalCalendarItemGetRowID();
          *(_DWORD *)buf = 67109120;
          v96 = v29;
          v26 = v24;
          v27 = "Skipping notifiable event %d because we failed to get the event unique identifier";
LABEL_32:
          _os_log_impl(&dword_1B6A18000, v26, OS_LOG_TYPE_DEFAULT, v27, buf, 8u);
        }
LABEL_33:

LABEL_34:
        v15[2](v15);
        goto LABEL_17;
      }
      CFRelease(v23);
      if ((objc_msgSend(*(id *)(a1 + 32), "shouldSkipNotificationForStore:", v13) & 1) != 0
        || objc_msgSend(*(id *)(a1 + 32), "shouldSkipNotificationForCalendar:", v14)
        && !objc_msgSend(*(id *)(a1 + 32), "isEventTimeSensitiveForFocus:", v12))
      {
        goto LABEL_34;
      }
      if (CalEventGetParticipationStatus() == 2)
      {
        v24 = (id)CADNotificationLogHandle;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          v25 = CalCalendarItemGetRowID();
          *(_DWORD *)buf = 67109120;
          v96 = v25;
          v26 = v24;
          v27 = "Skipping notifiable event %d because it's been declined";
          goto LABEL_32;
        }
        goto LABEL_33;
      }
      InvitationChangedProperties = CalEventGetInvitationChangedProperties();
      v31 = InvitationChangedProperties;
      if ((InvitationChangedProperties & 0xF0) != 0)
      {
        if (InvitationChangedProperties == 32 && !CalAlertInviteeDeclines())
        {
          v16 = (id)CADNotificationLogHandle;
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            v54 = CalCalendarItemGetRowID();
            *(_DWORD *)buf = 67109120;
            v96 = v54;
            _os_log_impl(&dword_1B6A18000, v16, OS_LOG_TYPE_DEFAULT, "Skipping notifiable event %d because it's an attendee status change, and the user has disabled those alerts", buf, 8u);
          }
          goto LABEL_16;
        }
        if (CalCalendarItemGetStatus() == 3)
        {
          v32 = (id)CADNotificationLogHandle;
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            v33 = CalCalendarItemGetRowID();
            *(_DWORD *)buf = 67109120;
            v96 = v33;
            _os_log_impl(&dword_1B6A18000, v32, OS_LOG_TYPE_DEFAULT, "Skipping notifiable event %d because it's cancelled", buf, 8u);
          }

          CalEventSetNeedsNotification();
          v15[2](v15);
LABEL_42:
          v79 = 1;
          goto LABEL_17;
        }
        v35 = (const __CFArray *)CalCalendarItemCopyAttendees();
        v36 = v31 & 0x11F;
        if (v35)
        {
          CalEventGetStartDate();
          v38 = v37;
          CalEventGetEndDate();
          v40 = v39;
          Count = CFArrayGetCount(v35);
          Mutable = CFArrayCreateMutable(0, Count, 0);
          theArray = v35;
          v88[3] = (uint64_t)Mutable;
          if (Count < 1)
          {
            v83 = 1;
            v34 = v9;
          }
          else
          {
            v80 = Count;
            v43 = 0;
            v44 = v40 - v38;
            v83 = 1;
            v34 = v9;
            do
            {
              ValueAtIndex = (void *)CFArrayGetValueAtIndex(theArray, v43);
              if ((v31 & 0x20) != 0
                && CalParticipantGetStatusChanged()
                && CalAttendeeGetStatus() == 2)
              {
                v36 |= 0x20u;
              }
              v46 = (void *)CalCalendarItemCopySelfAttendee();
              if ((v31 & 0x80) != 0)
              {
                v47 = CalAttendeeGetProposedStartDateStatus() == 3;
                v48 = v46 == ValueAtIndex;
                v49 = !v47 || !v48;
                if (v47 && v48)
                  v36 |= 0x80u;
                v50 = v83;
                if (!v49)
                  v50 = 0;
                v83 = v50;
              }
              if ((v31 & 0x40) != 0 && CalParticipantGetProposedStartDateChanged())
              {
                CalAttendeeGetProposedStartDate();
                v52 = v51;
                if (v51 == v10)
                {
                  CalParticipantSetProposedStartDateChanged();
                  v79 = 1;
                }
                else
                {
                  v53 = MEMORY[0x1BCC9B8FC](ValueAtIndex);
                  if (v44 + v52 >= v34)
                    v34 = v44 + v52;
                  CFArrayAppendValue((CFMutableArrayRef)v88[3], (const void *)v53);
                  v36 |= 0x40u;
                }
              }

              ++v43;
            }
            while (v80 != v43);
          }
          CFRelease(theArray);
        }
        else
        {
          v83 = 1;
          v34 = v9;
        }
        if (v36 != v31)
        {
          CalEventSetInvitationChangedProperties();
          v55 = (id)CADNotificationLogHandle;
          v56 = os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT);
          if (!v36)
          {
            if (v56)
            {
              v75 = CalCalendarItemGetRowID();
              *(_DWORD *)buf = 67109120;
              v96 = v75;
              _os_log_impl(&dword_1B6A18000, v55, OS_LOG_TYPE_DEFAULT, "Skipping notifiable event %d because it was marked as having invitation changes, but they were all false positives", buf, 8u);
            }

            CalEventSetNeedsNotification();
            v15[2](v15);
            goto LABEL_42;
          }
          if (v56)
          {
            v57 = CalCalendarItemGetRowID();
            *(_DWORD *)buf = v77;
            v96 = v36;
            v97 = 1024;
            v98 = v31;
            v99 = 1024;
            v100 = v57;
            _os_log_impl(&dword_1B6A18000, v55, OS_LOG_TYPE_DEFAULT, "actualInvitationChangedProperties 0x%x didn't match invitationChangedProperties 0x%x; updating event %d",
              buf,
              0x14u);
          }

          v79 = 1;
        }
      }
      else
      {
        v83 = 0;
        v34 = v9;
      }
      v58 = (const void *)CalEventOccurrenceCreateForInitialOccurrence();
      CalEventOccurrenceGetDate();
      v60 = v59;
      CFRelease(v58);
      objc_msgSend(*(id *)(a1 + 32), "expirationTimestampForEvent:withInitialOccurrenceDate:database:", v12, v78, v60);
      if (v61 >= v34)
        v34 = v61;
      v62 = (id)CADNotificationLogHandle;
      v63 = os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT);
      if (v34 <= v5)
      {
        if (v63)
        {
          v68 = CalCalendarItemGetRowID();
          *(_DWORD *)buf = 67109120;
          v96 = v68;
          _os_log_impl(&dword_1B6A18000, v62, OS_LOG_TYPE_DEFAULT, "Skipping notifiable event %d because it takes place in the past", buf, 8u);
        }

        v15[2](v15);
      }
      else
      {
        if (v63)
        {
          v64 = CalCalendarItemGetRowID();
          *(_DWORD *)buf = 67109888;
          v96 = v64;
          v97 = 1024;
          v98 = v83;
          v99 = 1024;
          v100 = v31;
          v101 = 2048;
          v102 = v34;
          _os_log_impl(&dword_1B6A18000, v62, OS_LOG_TYPE_DEFAULT, "Including notifiable event %d with type %d, invitationChangedProperties 0x%x and expiration date %f", buf, 0x1Eu);
        }

        v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0BAF8]), "initWithEntityType:entityID:databaseID:", 2, CalCalendarItemGetRowID(), a2);
        v66 = (const __CFArray *)v88[3];
        if (v66)
          v67 = CFArrayGetCount(v66);
        else
          v67 = 0;
        v69 = objc_msgSend(*(id *)(a1 + 32), "expanded", v77);
        if (v67 > 0)
          v70 = v69;
        else
          v70 = 0;
        if (v70 == 1)
        {
          v71 = -[CADNotification initWithType:objectID:occurrenceDate:expirationDate:]([CADNotification alloc], "initWithType:objectID:occurrenceDate:expirationDate:", v83, v65, v60, v34);
          v72 = 0;
          do
          {
            v73 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0BAF8]), "initWithEntityType:entityID:databaseID:", 7, CFArrayGetValueAtIndex((CFArrayRef)v88[3], v72), a2);
            v74 = -[CADExpandedNotification initWithType:objectID:occurrenceDate:expirationDate:attendeeObjectID:]([CADExpandedNotification alloc], "initWithType:objectID:occurrenceDate:expirationDate:attendeeObjectID:", v83, v65, v73, v60, v34);
            -[CADNotification addExpandedNotification:](v71, "addExpandedNotification:", v74);

            ++v72;
          }
          while (v67 != v72);
          objc_msgSend(*(id *)(a1 + 32), "addNotification:", v71);
        }
        else
        {
          v71 = -[CADNotification initWithType:objectID:occurrenceDate:expirationDate:]([CADNotification alloc], "initWithType:objectID:occurrenceDate:expirationDate:", v83, v65, v60, v34);
          objc_msgSend(*(id *)(a1 + 32), "addNotification:", v71);
        }

        v15[2](v15);
      }
LABEL_17:

      _Block_object_dispose(&v87, 8);
      ++v11;
    }
    while (v11 != v6);
    v76 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v103, 16);
    v6 = v76;
  }
  while (v76);

  if ((v79 & 1) != 0)
    CalDatabaseSave();
LABEL_104:

}

void __73__CADNotificationUtilities__gatherEventInvitationsAndRepliesWithContext___block_invoke_2(_QWORD *a1)
{
  const void *v2;
  const void *v3;
  const void *v4;

  v2 = *(const void **)(*(_QWORD *)(a1[4] + 8) + 24);
  if (v2)
    CFRelease(v2);
  v3 = (const void *)a1[5];
  if (v3)
    CFRelease(v3);
  v4 = (const void *)a1[6];
  if (v4)
    CFRelease(v4);
}

void __72__CADNotificationUtilities__gatherSharedCalendarInvitationsWithContext___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t i;
  uint64_t v10;
  const void *v11;
  char v12;
  const void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  CADNotification *v17;
  void *v18;
  NSObject *v19;
  int UID;
  NSObject *v21;
  const char *v22;
  void *v23;
  int v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  int v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v4 = (id)CalDatabaseCopyOfAllCalendarsInStoreWithOptions();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v26;
    v8 = *MEMORY[0x1E0D0C480];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(v4);
        v10 = CalCalendarCopyStore();
        if (v10)
        {
          v11 = (const void *)v10;
          v12 = objc_msgSend(*(id *)(a1 + 32), "shouldSkipNotificationForStore:", v10);
          CFRelease(v11);
          if ((v12 & 1) != 0)
            continue;
        }
        if ((CalCalendarCanContainEntityType() & 1) == 0)
        {
          v18 = (void *)CADNotificationLogHandle;
          if (!os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
            continue;
          v19 = v18;
          UID = CalCalendarGetUID();
          *(_DWORD *)buf = 67109120;
          v30 = UID;
          v21 = v19;
          v22 = "Skipping shared calendar invitation for calendar %d because it doesn't allow events";
LABEL_17:
          _os_log_impl(&dword_1B6A18000, v21, OS_LOG_TYPE_DEFAULT, v22, buf, 8u);

          continue;
        }
        v13 = (const void *)CalCalendarCopyUUID();
        if (!v13)
        {
          v23 = (void *)CADNotificationLogHandle;
          if (!os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
            continue;
          v19 = v23;
          v24 = CalCalendarGetUID();
          *(_DWORD *)buf = 67109120;
          v30 = v24;
          v21 = v19;
          v22 = "Skipping shared calendar invitation for calendar %d because it lacks a UUID";
          goto LABEL_17;
        }
        CFRelease(v13);
        v14 = CalCalendarGetUID();
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0BAF8]), "initWithEntityType:entityID:databaseID:", 1, v14, a2);
        v16 = CADNotificationLogHandle;
        if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          v30 = v14;
          _os_log_impl(&dword_1B6A18000, v16, OS_LOG_TYPE_DEFAULT, "Including shared calendar invitation %d", buf, 8u);
        }
        v17 = -[CADNotification initWithType:objectID:occurrenceDate:expirationDate:]([CADNotification alloc], "initWithType:objectID:occurrenceDate:expirationDate:", 2, v15, 0.0, v8);
        objc_msgSend(*(id *)(a1 + 32), "addNotification:", v17);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v6);
  }

}

+ (BOOL)storeIsReadOnlyDelegate:(void *)a3
{
  int v3;

  v3 = objc_msgSend(a1, "_storeIsDelegate:");
  if (v3)
    LOBYTE(v3) = CalStoreIsWritable() ^ 1;
  return v3;
}

+ (BOOL)_storeIsDelegate:(void *)a3
{
  const void *v3;
  const void *v4;

  v3 = (const void *)CalStoreCopyDelegatedAccountOwnerStoreID();
  v4 = v3;
  if (v3)
    CFRelease(v3);
  return v4 != 0;
}

void __64__CADNotificationUtilities__notificationTypesFromNotifications___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(a2, "type"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

+ (void)_logNotificationCountsForNotifications:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  int v20;
  void *v21;
  NSObject *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  int v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(v6);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "type");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v12);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    }
    while (v8);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v13 = v5;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
  if (v14)
  {
    v16 = v14;
    v17 = *(_QWORD *)v25;
    *(_QWORD *)&v15 = 67240450;
    v23 = v15;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v25 != v17)
          objc_enumerationMutation(v13);
        v19 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
        v20 = objc_msgSend(v13, "countForObject:", v19, v23, (_QWORD)v24);
        objc_msgSend(a1, "_stringForNotificationType:", objc_msgSend(v19, "intValue"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = CADLogHandle;
        if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v23;
          v33 = v20;
          v34 = 2114;
          v35 = v21;
          _os_log_impl(&dword_1B6A18000, v22, OS_LOG_TYPE_ERROR, "Found %{public}d notifications of type %{public}@", buf, 0x12u);
        }

      }
      v16 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
    }
    while (v16);
  }

}

+ (id)_stringForNotificationType:(int)a3
{
  if (a3 < 6)
    return off_1E6A37C48[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __64__CADNotificationUtilities__attendeeObjectIDsFromNotifications___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "expanded"))
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v6, "attendeeObjectID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v3;
  }
  else
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0BAF8]), "initWithEntityType:entityID:databaseID:", 7, 0xFFFFFFFFLL, 0xFFFFFFFFLL);
    v5 = *(void **)(a1 + 32);
  }
  objc_msgSend(v5, "addObject:", v4);

}

+ (int)_gatherSharedCalendarInviteReplyNotification:(void *)a3 withContext:(id)a4 database:(CalDatabase *)a5 databaseID:(int)a6
{
  uint64_t v6;
  id v7;
  const void *v8;
  const __CFURL *v9;
  uint64_t v10;
  uint64_t v11;
  const void *v12;
  void *v13;
  NSObject *v14;
  char v15;
  void *v16;
  NSObject *v17;
  const __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  __CFString *MutableCopy;
  __CFString *v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  int v33;
  uint64_t UID;
  void *v35;
  NSObject *v36;
  CADNotification *v37;
  CADNotification *v38;
  int v40;
  int v41;
  uint64_t v42;

  v6 = *(_QWORD *)&a6;
  v42 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = (const void *)CalInviteReplyNotificationCopyInviteReplyCalendar();
  if (v8)
    goto LABEL_5;
  v9 = (const __CFURL *)CalInviteReplyNotificationCopyHostURL();
  if (v9)
  {
    v8 = v9;
    CFURLGetString(v9);
    v10 = CalDatabaseCopyCalendarWithExternalIDInStore();
    if (v10
      || (v18 = CFURLGetString((CFURLRef)v8), (v19 = CFStringCreateMutableCopy(0, 0, v18)) != 0)
      && (v20 = v19,
          CFStringAppend(v19, CFSTR("/")),
          v10 = CalDatabaseCopyCalendarWithExternalIDInStore(),
          CFRelease(v20),
          v10))
    {
      CFRelease(v8);
      v8 = (const void *)v10;
    }
    else
    {
      v21 = CFURLCopyPath((CFURLRef)v8);
      if (!v21)
        goto LABEL_21;
      v22 = v21;
      MutableCopy = CFStringCreateMutableCopy(0, 0, v21);
      if (MutableCopy)
      {
        v24 = MutableCopy;
        CFStringAppend(MutableCopy, CFSTR("/"));
        v25 = CalDatabaseCopyCalendarWithExternalIDInStore();
        CFRelease(v24);
      }
      else
      {
        v25 = 0;
      }
      CFRelease(v22);
      CFRelease(v8);
      v8 = (const void *)v25;
      if (!v25)
      {
LABEL_22:
        CalNotificationGetCreationDate();
        v27 = v26 + 2592000.0;
        objc_msgSend(v7, "now");
        if (v27 >= v28)
        {
          UID = CalNotificationGetUID();
          v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0BAF8]), "initWithEntityType:entityID:databaseID:", 16, UID, v6);
          v36 = CADNotificationLogHandle;
          if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
          {
            v40 = 67109120;
            v41 = UID;
            _os_log_impl(&dword_1B6A18000, v36, OS_LOG_TYPE_DEFAULT, "Including invite reply notification %d", (uint8_t *)&v40, 8u);
          }
          v37 = [CADNotification alloc];
          v38 = -[CADNotification initWithType:objectID:occurrenceDate:expirationDate:](v37, "initWithType:objectID:occurrenceDate:expirationDate:", 3, v35, *MEMORY[0x1E0D0C490], v27);
          objc_msgSend(v7, "addNotification:", v38);

        }
        else
        {
          v29 = (void *)CADNotificationLogHandle;
          if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
          {
            v30 = v29;
            v40 = 67109120;
            v41 = CalNotificationGetUID();
            _os_log_impl(&dword_1B6A18000, v30, OS_LOG_TYPE_DEFAULT, "Skipping invite reply notification %d because it is too old", (uint8_t *)&v40, 8u);

          }
          if (objc_msgSend(v7, "deleteOldNotifications"))
          {
            v31 = (void *)CADNotificationLogHandle;
            if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
            {
              v32 = v31;
              v33 = CalNotificationGetUID();
              v40 = 67109120;
              v41 = v33;
              _os_log_impl(&dword_1B6A18000, v32, OS_LOG_TYPE_DEFAULT, "Deleting invite reply notification %d because it is too old", (uint8_t *)&v40, 8u);

            }
            CalRemoveNotification();
          }
        }
        goto LABEL_32;
      }
    }
LABEL_5:
    if (CalEntityGetType() == 1 && (CalCalendarCanContainEntityType() & 1) == 0)
    {
      v13 = (void *)CADNotificationLogHandle;
      if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
      {
        v14 = v13;
        v40 = 67109120;
        v41 = CalNotificationGetUID();
        _os_log_impl(&dword_1B6A18000, v14, OS_LOG_TYPE_DEFAULT, "Skipping invite reply notification %d because it is on a calendar that does not allow events", (uint8_t *)&v40, 8u);

      }
      goto LABEL_13;
    }
    v11 = CalCalendarCopyStore();
    if (v11)
    {
      v12 = (const void *)v11;
      if ((objc_msgSend(v7, "shouldSkipNotificationForStore:", v11) & 1) != 0)
      {
        CFRelease(v12);
LABEL_13:
        CFRelease(v8);
        goto LABEL_32;
      }
      v15 = objc_msgSend(v7, "shouldSkipNotificationForCalendar:", v8);
      CFRelease(v12);
      if ((v15 & 1) != 0)
        goto LABEL_13;
    }
LABEL_21:
    CFRelease(v8);
    goto LABEL_22;
  }
  v16 = (void *)CADNotificationLogHandle;
  if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    v17 = v16;
    v40 = 67109120;
    v41 = CalNotificationGetUID();
    _os_log_impl(&dword_1B6A18000, v17, OS_LOG_TYPE_DEFAULT, "Skipping invite reply notification %d because it lacks an external ID", (uint8_t *)&v40, 8u);

  }
LABEL_32:

  return 0;
}

+ (int)_gatherSharedCalendarResourceChangeNotification:(void *)a3 withContext:(id)a4 database:(CalDatabase *)a5 databaseID:(int)a6
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  const void *v15;
  void *v16;
  NSObject *v17;
  int v18;
  NSObject *v19;
  const char *v20;
  void *v21;
  NSObject *v22;
  int v23;
  NSObject *v24;
  const char *v25;
  void *v26;
  int v27;
  void *v28;
  int v29;
  int v30;
  int v31;
  uint64_t v32;
  const void *v33;
  NSObject *v34;
  uint64_t v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  NSObject *v40;
  int v41;
  void *v42;
  NSObject *v43;
  int v44;
  void *v45;
  int v46;
  void *v47;
  NSObject *v48;
  int v49;
  NSObject *v50;
  const char *v51;
  uint64_t v52;
  const void *v53;
  const void *v54;
  const void *v55;
  uint64_t v56;
  void *v57;
  NSObject *v58;
  CADNotification *v59;
  void *v60;
  int v61;
  void *v62;
  int v63;
  void *v64;
  NSObject *v65;
  int v66;
  void *v67;
  int v68;
  uint64_t v69;
  id obj;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint8_t buf[4];
  int v79;
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  obj = (id)CalResourceChangeNotificationCopyChanges();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v80, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v75;
    v10 = *MEMORY[0x1E0D0C480];
    v11 = *MEMORY[0x1E0D0C490];
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v75 != v9)
          objc_enumerationMutation(obj);
        v13 = CalResourceChangeGetType();
        if (v13 == 5 && CalResourceChangeGetPublicStatus() != 2)
        {
          v26 = (void *)CADNotificationLogHandle;
          if (!os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
            goto LABEL_27;
          v22 = v26;
          v27 = CalResourceChangeGetUID();
          *(_DWORD *)buf = 67109120;
          v79 = v27;
          v24 = v22;
          v25 = "Skipping resource change notification %d because it is not public";
          goto LABEL_17;
        }
        v14 = CalResourceChangeCopyCalendar();
        if (!v14)
        {
          v21 = (void *)CADNotificationLogHandle;
          if (!os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
            goto LABEL_27;
          v22 = v21;
          v23 = CalResourceChangeGetUID();
          *(_DWORD *)buf = 67109120;
          v79 = v23;
          v24 = v22;
          v25 = "Skipping resource change notification %d because it has no calendar";
          goto LABEL_17;
        }
        v15 = (const void *)v14;
        if ((CalCalendarCanContainEntityType() & 1) == 0)
        {
          v28 = (void *)CADNotificationLogHandle;
          if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
          {
            v17 = v28;
            v29 = CalResourceChangeGetUID();
            *(_DWORD *)buf = 67109120;
            v79 = v29;
            v19 = v17;
            v20 = "Skipping resource change notification %d because it is on a calendar that does not allow events";
LABEL_20:
            _os_log_impl(&dword_1B6A18000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 8u);

          }
LABEL_21:
          v30 = 1;
          goto LABEL_23;
        }
        if (CalCalendarIsIgnoringSharedCalendarNotifications())
        {
          v16 = (void *)CADNotificationLogHandle;
          if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
          {
            v17 = v16;
            v18 = CalResourceChangeGetUID();
            *(_DWORD *)buf = 67109120;
            v79 = v18;
            v19 = v17;
            v20 = "Skipping resource change notification %d because it is on a calendar that is ignoring shared calendar notifications";
            goto LABEL_20;
          }
          goto LABEL_21;
        }
        v30 = 0;
LABEL_23:
        v31 = v30 | objc_msgSend(v6, "shouldSkipNotificationForCalendar:", v15);
        v32 = CalCalendarCopyStore();
        if (v32)
        {
          v33 = (const void *)v32;
          v31 |= objc_msgSend(v6, "shouldSkipNotificationForStore:", v32);
          CFRelease(v33);
        }
        if (v31)
          goto LABEL_26;
        if (CalCalendarCanContainEntityType())
        {
          v34 = CADNotificationLogHandle;
          if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B6A18000, v34, OS_LOG_TYPE_INFO, "Calendar has support for both events and reminders", buf, 2u);
          }
        }
        CFRelease(v15);
        v35 = CalResourceChangeCopyCalendarItem();
        if (v35)
        {
          v15 = (const void *)v35;
          if (CalEntityGetType() != 2)
          {
            v47 = (void *)CADNotificationLogHandle;
            if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
            {
              v48 = v47;
              v49 = CalResourceChangeGetUID();
              *(_DWORD *)buf = 67109120;
              v79 = v49;
              v50 = v48;
              v51 = "Skipping resource change notification %d because it is a change for a non-event";
              goto LABEL_47;
            }
            goto LABEL_26;
          }
          objc_msgSend(v6, "expirationTimestampForEvent:database:", v15, a5);
          v37 = v36;
          objc_msgSend(v6, "now");
          if (v37 < v38)
          {
            v39 = (void *)CADNotificationLogHandle;
            if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
            {
              v40 = v39;
              v41 = CalResourceChangeGetUID();
              *(_DWORD *)buf = 67109120;
              v79 = v41;
              _os_log_impl(&dword_1B6A18000, v40, OS_LOG_TYPE_DEFAULT, "Skipping resource change notification %d because it is for an event in the past", buf, 8u);

            }
            if (objc_msgSend(v6, "deleteOldNotifications"))
            {
              v42 = (void *)CADNotificationLogHandle;
              if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
              {
                v43 = v42;
                v44 = CalResourceChangeGetUID();
                *(_DWORD *)buf = 67109120;
                v79 = v44;
                _os_log_impl(&dword_1B6A18000, v43, OS_LOG_TYPE_DEFAULT, "Deleting resource change notification %d because it is for an event in the past", buf, 8u);

              }
              CalRemoveResourceChange();
            }
            goto LABEL_26;
          }
          v52 = CalEventCopyStore();
          if (!v52)
          {
            v62 = (void *)CADNotificationLogHandle;
            if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
            {
              v48 = v62;
              v63 = CalResourceChangeGetUID();
              *(_DWORD *)buf = 67109120;
              v79 = v63;
              v50 = v48;
              v51 = "Skipping resource change notification %d because it is for an event not in a store";
              goto LABEL_47;
            }
LABEL_26:
            CFRelease(v15);
            goto LABEL_27;
          }
          v53 = (const void *)v52;
          v54 = (const void *)CalStoreCopyUUID();
          if (!v54)
          {
            v64 = (void *)CADNotificationLogHandle;
            if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
            {
              v65 = v64;
              v66 = CalResourceChangeGetUID();
              *(_DWORD *)buf = 67109120;
              v79 = v66;
              _os_log_impl(&dword_1B6A18000, v65, OS_LOG_TYPE_DEFAULT, "Skipping resource change notification %d because it is for an event in a store with no persistent id", buf, 8u);

            }
            CFRelease(v53);
            goto LABEL_26;
          }
          CFRelease(v54);
          CFRelease(v53);
          v55 = (const void *)CalEventCopyUniqueIdentifier();
          if (!v55)
          {
            v67 = (void *)CADNotificationLogHandle;
            if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
            {
              v48 = v67;
              v68 = CalResourceChangeGetUID();
              *(_DWORD *)buf = 67109120;
              v79 = v68;
              v50 = v48;
              v51 = "Skipping resource change notification %d because it is for an event with no unique ID";
LABEL_47:
              _os_log_impl(&dword_1B6A18000, v50, OS_LOG_TYPE_DEFAULT, v51, buf, 8u);

            }
            goto LABEL_26;
          }
          CFRelease(v55);
          CFRelease(v15);
LABEL_52:
          v56 = CalResourceChangeGetUID();
          v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0BAF8]), "initWithEntityType:entityID:databaseID:", 18, v56, a6);
          v58 = CADNotificationLogHandle;
          if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            v79 = v56;
            _os_log_impl(&dword_1B6A18000, v58, OS_LOG_TYPE_DEFAULT, "Including resource change notification %d", buf, 8u);
          }
          v59 = -[CADNotification initWithType:objectID:occurrenceDate:expirationDate:]([CADNotification alloc], "initWithType:objectID:occurrenceDate:expirationDate:", 4, v57, v11, v37);
          objc_msgSend(v6, "addNotification:", v59);

          goto LABEL_27;
        }
        if (v13 == 2)
        {
          v60 = (void *)CADNotificationLogHandle;
          if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
          {
            v22 = v60;
            v61 = CalResourceChangeGetUID();
            *(_DWORD *)buf = 67109120;
            v79 = v61;
            v24 = v22;
            v25 = "Skipping resource change notification %d because it is an update without an event";
            goto LABEL_17;
          }
        }
        else
        {
          v37 = v10;
          if (v13 != 1)
            goto LABEL_52;
          v45 = (void *)CADNotificationLogHandle;
          if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
          {
            v22 = v45;
            v46 = CalResourceChangeGetUID();
            *(_DWORD *)buf = 67109120;
            v79 = v46;
            v24 = v22;
            v25 = "Skipping resource change notification %d because it is an add without an event";
LABEL_17:
            _os_log_impl(&dword_1B6A18000, v24, OS_LOG_TYPE_DEFAULT, v25, buf, 8u);

          }
        }
LABEL_27:
        ++v12;
      }
      while (v8 != v12);
      v69 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v80, 16);
      v8 = v69;
    }
    while (v69);
  }

  return 0;
}

+ (int)_gatherSuggestionResourceChangeNotification:(void *)a3 withContext:(id)a4 database:(CalDatabase *)a5 databaseID:(int)a6
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  const void *v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  NSObject *v22;
  int v23;
  void *v24;
  NSObject *v25;
  int v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  int v30;
  NSObject *v31;
  const char *v32;
  void *v33;
  int v34;
  CalDatabase *v35;
  id v36;
  uint64_t v37;
  const void *v38;
  const void *v39;
  const void *v40;
  void *v41;
  int v42;
  void *v43;
  int v44;
  uint64_t v45;
  const void *v46;
  int v47;
  void *v48;
  NSObject *v49;
  int v50;
  NSObject *v51;
  const char *v52;
  void *v53;
  NSObject *v54;
  int v55;
  char v56;
  const void *v57;
  void *v58;
  int v59;
  void *v60;
  NSObject *v61;
  int v62;
  int v63;
  uint64_t v64;
  const void *v65;
  uint64_t v66;
  NSObject *v67;
  CADNotification *v68;
  void *v69;
  int v70;
  NSObject *v71;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  _QWORD block[4];
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint8_t buf[4];
  int v84;
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = (void *)CalResourceChangeNotificationCopyChanges();
  v74 = (void *)objc_opt_new();
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v79, v85, 16);
  if (v10)
  {
    v11 = v10;
    v76 = *(_QWORD *)v80;
    v12 = *MEMORY[0x1E0D0C480];
    v13 = *MEMORY[0x1E0D0C490];
    do
    {
      v14 = 0;
      v75 = v11;
      do
      {
        if (*(_QWORD *)v80 != v76)
          objc_enumerationMutation(v9);
        v15 = CalResourceChangeGetType();
        v16 = CalResourceChangeCopyCalendarItem();
        if (v16)
        {
          v17 = (const void *)v16;
          if (CalEntityGetType() != 2)
          {
            v33 = (void *)CADNotificationLogHandle;
            if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
            {
              v27 = v33;
              v34 = CalResourceChangeGetUID();
              *(_DWORD *)buf = 67109120;
              v84 = v34;
              _os_log_impl(&dword_1B6A18000, v27, OS_LOG_TYPE_DEFAULT, "Skipping suggestion resource change notification %d because it is for a non-event", buf, 8u);
              goto LABEL_22;
            }
LABEL_23:
            CFRelease(v17);
            goto LABEL_59;
          }
          objc_msgSend(v7, "expirationTimestampForEvent:database:", v17, a5);
          v19 = v18;
          objc_msgSend(v7, "now");
          if (v19 < v20)
          {
            v21 = (void *)CADNotificationLogHandle;
            if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
            {
              v22 = v21;
              v23 = CalResourceChangeGetUID();
              *(_DWORD *)buf = 67109120;
              v84 = v23;
              _os_log_impl(&dword_1B6A18000, v22, OS_LOG_TYPE_DEFAULT, "Skipping suggestion resource change notification %d because it is for an event in the past", buf, 8u);

            }
            if (objc_msgSend(v7, "deleteOldNotifications"))
            {
              v24 = (void *)CADNotificationLogHandle;
              if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
              {
                v25 = v24;
                v26 = CalResourceChangeGetUID();
                *(_DWORD *)buf = 67109120;
                v84 = v26;
                _os_log_impl(&dword_1B6A18000, v25, OS_LOG_TYPE_DEFAULT, "Deleting suggestion resource change notification %d because it is for an event in the past", buf, 8u);

              }
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", CPRecordGetID());
              v27 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v74, "addObject:", v27);
LABEL_22:

            }
            goto LABEL_23;
          }
          v35 = a5;
          v36 = v9;
          v37 = CalEventCopyStore();
          if (v37)
          {
            v38 = (const void *)v37;
            v39 = (const void *)CalStoreCopyUUID();
            v40 = v39;
            if (v39)
            {
              CFRelease(v39);
            }
            else
            {
              v53 = (void *)CADNotificationLogHandle;
              if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
              {
                v54 = v53;
                v55 = CalResourceChangeGetUID();
                *(_DWORD *)buf = 67109120;
                v84 = v55;
                _os_log_impl(&dword_1B6A18000, v54, OS_LOG_TYPE_DEFAULT, "Skipping suggestion resource change notification %d because it is for an event in a store with no persistent id", buf, 8u);

              }
            }
            v56 = objc_msgSend(v7, "shouldSkipNotificationForStore:", v38);
            CFRelease(v38);
            if (v40 && (v56 & 1) == 0)
            {
              v57 = (const void *)CalEventCopyUniqueIdentifier();
              if (v57)
              {
                CFRelease(v57);
                CFRelease(v17);
                v9 = v36;
                a5 = v35;
                v11 = v75;
LABEL_51:
                v66 = CalResourceChangeGetUID();
                v29 = objc_msgSend(objc_alloc(MEMORY[0x1E0D0BAF8]), "initWithEntityType:entityID:databaseID:", 18, v66, a6);
                v67 = CADNotificationLogHandle;
                if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109120;
                  v84 = v66;
                  _os_log_impl(&dword_1B6A18000, v67, OS_LOG_TYPE_DEFAULT, "Including suggestion resource change notification %d", buf, 8u);
                }
                v68 = -[CADNotification initWithType:objectID:occurrenceDate:expirationDate:]([CADNotification alloc], "initWithType:objectID:occurrenceDate:expirationDate:", 5, v29, v13, v19);
                objc_msgSend(v7, "addNotification:", v68);

LABEL_54:
                goto LABEL_59;
              }
              v69 = (void *)CADNotificationLogHandle;
              if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
              {
                v49 = v69;
                v70 = CalResourceChangeGetUID();
                *(_DWORD *)buf = 67109120;
                v84 = v70;
                v51 = v49;
                v52 = "Skipping suggestion resource change notification %d because it is for an event with no unique ID";
LABEL_57:
                _os_log_impl(&dword_1B6A18000, v51, OS_LOG_TYPE_DEFAULT, v52, buf, 8u);

              }
            }
          }
          else
          {
            v48 = (void *)CADNotificationLogHandle;
            if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
            {
              v49 = v48;
              v50 = CalResourceChangeGetUID();
              *(_DWORD *)buf = 67109120;
              v84 = v50;
              v51 = v49;
              v52 = "Skipping suggestion resource change notification %d because it is for an event not in a store";
              goto LABEL_57;
            }
          }
          CFRelease(v17);
          v9 = v36;
          a5 = v35;
          v11 = v75;
          goto LABEL_59;
        }
        switch(v15)
        {
          case 3:
            v43 = (void *)CADNotificationLogHandle;
            if (!os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
              goto LABEL_59;
            v29 = v43;
            v44 = CalResourceChangeGetUID();
            *(_DWORD *)buf = 67109120;
            v84 = v44;
            v31 = v29;
            v32 = "Skipping suggestion resource change notification %d because it is a delete (i.e., cancel) without an event";
            goto LABEL_44;
          case 2:
            v41 = (void *)CADNotificationLogHandle;
            if (!os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
              goto LABEL_59;
            v29 = v41;
            v42 = CalResourceChangeGetUID();
            *(_DWORD *)buf = 67109120;
            v84 = v42;
            v31 = v29;
            v32 = "Skipping suggestion resource change notification %d because it is an update without an event";
            goto LABEL_44;
          case 1:
            v28 = (void *)CADNotificationLogHandle;
            if (!os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
              goto LABEL_59;
            v29 = v28;
            v30 = CalResourceChangeGetUID();
            *(_DWORD *)buf = 67109120;
            v84 = v30;
            v31 = v29;
            v32 = "Skipping suggestion resource change notification %d because it is an add without an event";
LABEL_44:
            _os_log_impl(&dword_1B6A18000, v31, OS_LOG_TYPE_DEFAULT, v32, buf, 8u);
            goto LABEL_54;
        }
        v45 = CalResourceChangeCopyCalendar();
        if (!v45)
        {
          v58 = (void *)CADNotificationLogHandle;
          if (!os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
            goto LABEL_59;
          v29 = v58;
          v59 = CalResourceChangeGetUID();
          *(_DWORD *)buf = 67109120;
          v84 = v59;
          v31 = v29;
          v32 = "Skipping suggestion resource change notification %d because it has no calendar";
          goto LABEL_44;
        }
        v46 = (const void *)v45;
        if ((CalCalendarCanContainEntityType() & 1) != 0)
        {
          v47 = 0;
        }
        else
        {
          v60 = (void *)CADNotificationLogHandle;
          if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
          {
            v61 = v60;
            v62 = CalResourceChangeGetUID();
            *(_DWORD *)buf = 67109120;
            v84 = v62;
            _os_log_impl(&dword_1B6A18000, v61, OS_LOG_TYPE_DEFAULT, "Skipping suggestion resource change notification %d because it is on a calendar that does not allow events", buf, 8u);

          }
          v47 = 1;
        }
        v63 = v47 | objc_msgSend(v7, "shouldSkipNotificationForCalendar:", v46);
        v64 = CalCalendarCopyStore();
        if (v64)
        {
          v65 = (const void *)v64;
          v63 |= objc_msgSend(v7, "shouldSkipNotificationForStore:", v64);
          CFRelease(v65);
        }
        CFRelease(v46);
        v19 = v12;
        if (!v63)
          goto LABEL_51;
LABEL_59:
        ++v14;
      }
      while (v11 != v14);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v79, v85, 16);
    }
    while (v11);
  }

  if (objc_msgSend(v74, "count"))
  {
    _resourceChangeDeletionQueue();
    v71 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __104__CADNotificationUtilities__gatherSuggestionResourceChangeNotification_withContext_database_databaseID___block_invoke;
    block[3] = &unk_1E6A373A8;
    v78 = v74;
    dispatch_async(v71, block);

  }
  return 0;
}

void __104__CADNotificationUtilities__gatherSuggestionResourceChangeNotification_withContext_database_databaseID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  const void *v11;
  NSObject *v12;
  uint8_t v13[16];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = CalDatabaseCreateWithOptions();
  if (v2)
  {
    v3 = (const void *)v2;
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v4 = *(id *)(a1 + 32);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "intValue");
          v10 = CalDatabaseCopyResourceChangeWithUID();
          if (v10)
          {
            v11 = (const void *)v10;
            v12 = CADNotificationLogHandle;
            if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v13 = 0;
              _os_log_impl(&dword_1B6A18000, v12, OS_LOG_TYPE_DEFAULT, "Removing a resource change due to a pseudo event expiring", v13, 2u);
            }
            CalRemoveResourceChange();
            v7 = (v7 + 1);
            CFRelease(v11);
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v6);

      if ((_DWORD)v7)
      {
        CalDatabaseSave();
        objc_msgSend(MEMORY[0x1E0D0C428], "trackPseudoEventsExpired:", v7);
      }
    }
    else
    {

    }
    CFRelease(v3);
  }
}

@end
