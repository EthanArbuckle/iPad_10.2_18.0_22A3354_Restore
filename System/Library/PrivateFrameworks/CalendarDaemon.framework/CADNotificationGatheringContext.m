@implementation CADNotificationGatheringContext

- (NSArray)notifications
{
  return &self->_notifications->super;
}

- (CADNotificationGatheringContext)initWithConnection:(id)a3 afterDate:(id)a4 forSourceWithExternalIdentifier:(id)a5 excludingDelegateSources:(BOOL)a6 excludingUncheckedCalendars:(BOOL)a7 filteredByShowsNotificationsFlag:(BOOL)a8 expanded:(BOOL)a9
{
  _BOOL4 v10;
  id v16;
  id v17;
  id v18;
  CADNotificationGatheringContext *v19;
  CADNotificationGatheringContext *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSSet *uncheckedCalendarIdentifiers;
  uint64_t v27;
  NSMutableArray *notifications;
  double v29;
  objc_super v31;
  _QWORD v32[5];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;

  v10 = a7;
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v31.receiver = self;
  v31.super_class = (Class)CADNotificationGatheringContext;
  v19 = -[CADNotificationGatheringContext init](&v31, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_connection, a3);
    objc_storeStrong((id *)&v20->_sourceExternalIdentifier, a5);
    v20->_excludingDelegateSources = a6;
    v20->_filteredByShowsNotificationsFlag = a8;
    v20->_expanded = a9;
    if (v10)
    {
      v33 = 0;
      v34 = &v33;
      v35 = 0x2050000000;
      v21 = (void *)getEKCalendarVisibilityManagerClass_softClass;
      v36 = getEKCalendarVisibilityManagerClass_softClass;
      if (!getEKCalendarVisibilityManagerClass_softClass)
      {
        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __getEKCalendarVisibilityManagerClass_block_invoke;
        v32[3] = &unk_1E6A37C10;
        v32[4] = &v33;
        __getEKCalendarVisibilityManagerClass_block_invoke((uint64_t)v32);
        v21 = (void *)v34[3];
      }
      v22 = objc_retainAutorelease(v21);
      _Block_object_dispose(&v33, 8);
      v23 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v22, "unselectedCalendarIdentifiersForFocusMode");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setWithArray:", v24);
      v25 = objc_claimAutoreleasedReturnValue();
      uncheckedCalendarIdentifiers = v20->_uncheckedCalendarIdentifiers;
      v20->_uncheckedCalendarIdentifiers = (NSSet *)v25;

    }
    v27 = objc_opt_new();
    notifications = v20->_notifications;
    v20->_notifications = (NSMutableArray *)v27;

    if (!v17)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "CalSimulatedDateForNow");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v20->_deleteOldNotifications = 1;
    }
    objc_msgSend(v17, "timeIntervalSinceReferenceDate");
    v20->_now = v29;
    v20->_earliestExpirationDate = *(double *)MEMORY[0x1E0D0C480];
  }

  return v20;
}

- (NSDate)earliestExpiringNotification
{
  return (NSDate *)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", self->_earliestExpirationDate);
}

- (ClientConnection)connection
{
  return self->_connection;
}

- (BOOL)shouldSkipNotificationForStore:(void *)a3
{
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  _BOOL4 v8;
  void *v10;
  NSObject *v13;
  uint8_t v14[16];
  uint8_t buf[2];
  __int16 v16;
  __int16 v17;

  if (+[CADNotificationUtilities storeIsReadOnlyDelegate:](CADNotificationUtilities, "storeIsReadOnlyDelegate:"))
  {
    v5 = CADNotificationLogHandle;
    if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 0;
      v6 = "Filtering notification because it is in a read-only delegate";
      v7 = (uint8_t *)&v17;
LABEL_19:
      _os_log_impl(&dword_1B6A18000, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
    }
  }
  else
  {
    v8 = +[CADNotificationUtilities _storeIsDelegate:](CADNotificationUtilities, "_storeIsDelegate:", a3);
    if (self->_excludingDelegateSources && v8)
    {
      v5 = CADNotificationLogHandle;
      if (!os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
        return 1;
      v16 = 0;
      v6 = "Filtering notification because it's in a delegate source and we're excluding delegate sources";
      v7 = (uint8_t *)&v16;
      goto LABEL_19;
    }
    if (!self->_filteredByShowsNotificationsFlag || ((CalStoreShowsNotifications() | !v8) & 1) != 0)
    {
      if (self->_sourceExternalIdentifier)
      {
        v10 = (void *)CalStoreCopyExternalID();
        if (!-[NSString isEqualToString:](self->_sourceExternalIdentifier, "isEqualToString:", v10))
        {
          v13 = CADNotificationLogHandle;
          if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v14 = 0;
            _os_log_impl(&dword_1B6A18000, v13, OS_LOG_TYPE_DEFAULT, "Filtering notification because it's not in the source we're interested in", v14, 2u);
          }

          return 1;
        }

      }
      return 0;
    }
    v5 = CADNotificationLogHandle;
    if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v6 = "Filtering notification because we're filtering by showNotificationsFlag and it's not set";
      v7 = buf;
      goto LABEL_19;
    }
  }
  return 1;
}

- (BOOL)shouldSkipNotificationForCalendar:(void *)a3
{
  void *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint8_t v8[16];

  if (self->_uncheckedCalendarIdentifiers)
  {
    v4 = (void *)CalCalendarCopyUUID();
    v5 = -[NSSet containsObject:](self->_uncheckedCalendarIdentifiers, "containsObject:", v4);
    if (v5)
    {
      v6 = CADNotificationLogHandle;
      if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_1B6A18000, v6, OS_LOG_TYPE_DEFAULT, "Filtering notification because its calendar is unchecked in the calendar app", v8, 2u);
      }
    }

  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (double)now
{
  return self->_now;
}

- (double)expirationTimestampForEvent:(void *)a3 withInitialOccurrenceDate:(double)a4 database:(CalDatabase *)a5
{
  void *v9;
  double v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v9 = (void *)CalCalendarItemCopyRecurrences();
  if (objc_msgSend(v9, "count"))
  {
    v10 = *MEMORY[0x1E0D0C488];
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v19;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(v11);
          -[CADNotificationGatheringContext expirationTimestampForRecurrence:event:database:](self, "expirationTimestampForRecurrence:event:database:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v15), a3, a5, (_QWORD)v18);
          if (v10 < v16)
            v10 = v16;
          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v13);
    }

  }
  else
  {
    v10 = (double)CalEventGetDuration() + a4;
  }

  return v10;
}

- (double)expirationTimestampForRecurrence:(void *)a3 event:(void *)a4 database:(CalDatabase *)a5
{
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  double v26;
  id v28;

  CalRecurrenceGetEffectiveEndDate();
  v9 = v8;
  if (vabdd_f64(v8, *MEMORY[0x1E0D0C490]) < 2.22044605e-16)
    return *MEMORY[0x1E0D0C480];
  v28 = 0;
  -[CADNotificationGatheringContext endDateOfLastOccurrenceInCacheForEvent:database:cacheRange:](self, "endDateOfLastOccurrenceInCacheForEvent:database:cacheRange:", a4, a5, &v28);
  v10 = v11;
  v12 = v28;
  v13 = v12;
  if (v10 <= self->_now)
  {
    objc_msgSend(v12, "endDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceReferenceDate");
    v16 = v15;

    if (v9 < v16)
      goto LABEL_7;
    objc_msgSend(v13, "endDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "timeIntervalSinceReferenceDate");
    v19 = v18;
    objc_msgSend(v13, "timeZone");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x1BCC9B74C](v19);

    v21 = *MEMORY[0x1E0D0C480];
    objc_msgSend(v13, "timeZone");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x1BCC9B74C](v21);

    objc_msgSend(v13, "timeZone");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = CalEventOccurrencesExistForEventInDateRange();

    if (v24)
    {
      objc_msgSend(v13, "endDate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "timeIntervalSinceReferenceDate");
      v10 = v26;

    }
    else
    {
LABEL_7:
      v10 = *MEMORY[0x1E0D0C488];
    }
  }

  return v10;
}

- (BOOL)expanded
{
  return self->_expanded;
}

- (void)addNotification:(id)a3
{
  double v4;
  double v5;
  id v6;

  v6 = a3;
  -[NSMutableArray addObject:](self->_notifications, "addObject:", v6);
  objc_msgSend(v6, "expirationDate");
  if (v4 < self->_earliestExpirationDate)
  {
    objc_msgSend(v6, "expirationDate");
    self->_earliestExpirationDate = v5;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_notifications, 0);
  objc_storeStrong((id *)&self->_uncheckedCalendarIdentifiers, 0);
  objc_storeStrong((id *)&self->_sourceExternalIdentifier, 0);
}

- (BOOL)eventHasNewProposedTime:(void *)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t i;
  double v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = (id)CalCalendarItemCopyAttendees();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        if (CalParticipantGetProposedStartDateChanged())
        {
          CalAttendeeGetProposedStartDate();
          if (v9 != 0.0)
          {
            if (CalEventAttendeeIsSelf() && CalAttendeeGetProposedStartDateStatus() == 3)
              goto LABEL_14;
            v6 = 1;
          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
LABEL_14:
    v6 = 0;
  }

  return v6 & 1;
}

- (id)nearestProposedTimeForEvent:(void *)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  double v10;
  double v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "CalSimulatedDateForNow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = (id)CalCalendarItemCopyAttendees();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v4);
        if (CalParticipantGetProposedStartDateChanged())
        {
          CalAttendeeGetProposedStartDate();
          if (v10 != 0.0)
          {
            v11 = v10;
            if (CalAttendeeGetProposedStartDateStatus() != 3)
            {
              objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v11, v15);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v12, "isAfterDate:", v3)
                && (!v7 || objc_msgSend(v12, "isBeforeDate:", v7)))
              {
                v13 = v12;

                v7 = v13;
              }

            }
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isEventTimeSensitiveForFocus:(void *)a3
{
  BOOL v5;
  int v6;
  _BOOL4 v7;
  _BOOL4 v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  NSObject *v17;
  NSObject *v18;
  double v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v24;
  NSObject *v25;
  int v26;
  int RowID;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (CalEventGetJunkStatus() != 3)
  {
    v6 = CalEventGetInvitationChangedProperties() & 0xF0;
    v7 = -[CADNotificationGatheringContext eventHasNewProposedTime:](self, "eventHasNewProposedTime:", a3);
    v8 = v7;
    if (v6 && !v7)
    {
      v9 = (void *)CADNotificationLogHandle;
      if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_INFO))
      {
        v10 = v9;
        v26 = 67109120;
        RowID = CalCalendarItemGetRowID();
        _os_log_impl(&dword_1B6A18000, v10, OS_LOG_TYPE_INFO, "Notification for event (rowID = %d) is not time-sensitive because it is an attendee reply that is not a proposed time", (uint8_t *)&v26, 8u);

      }
      return 0;
    }
    CalCalendarItemGetStatus();
    objc_msgSend(MEMORY[0x1E0C99D68], "CalSimulatedDateForNow");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)CalCopyDefaultTimeZone();
    CalEventGetStartDateOfEarliestOccurrenceEndingAfterDateWithExclusions();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "timeIntervalSinceDate:", v11);
      v15 = *MEMORY[0x1E0D0C4C0];
      if (v16 <= *MEMORY[0x1E0D0C4C0])
      {
        v24 = (void *)CADNotificationLogHandle;
        v5 = 1;
        if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_INFO))
        {
          v25 = v24;
          v26 = 67109120;
          RowID = CalCalendarItemGetRowID();
          _os_log_impl(&dword_1B6A18000, v25, OS_LOG_TYPE_INFO, "Notification for event (rowID = %d) is time-sensitive because it starts within the time-sensitive window", (uint8_t *)&v26, 8u);

        }
        goto LABEL_19;
      }
      if (!v8)
        goto LABEL_18;
      -[CADNotificationGatheringContext nearestProposedTimeForEvent:](self, "nearestProposedTimeForEvent:", a3);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        -[NSObject timeIntervalSinceDate:](v17, "timeIntervalSinceDate:", v11);
        if (v19 <= v15)
        {
          v20 = (void *)CADNotificationLogHandle;
          if (os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_INFO))
          {
            v21 = v20;
            v26 = 67109120;
            RowID = CalCalendarItemGetRowID();
            _os_log_impl(&dword_1B6A18000, v21, OS_LOG_TYPE_INFO, "Notification for event (rowID = %d) is time-sensitive because it is an attendee proposed time within the time-sensitive window", (uint8_t *)&v26, 8u);

          }
          v5 = 1;
          goto LABEL_19;
        }
      }
    }
    else
    {
      v22 = (void *)CADNotificationLogHandle;
      if (!os_log_type_enabled((os_log_t)CADNotificationLogHandle, OS_LOG_TYPE_INFO))
      {
LABEL_18:
        v5 = 0;
LABEL_19:

        return v5;
      }
      v18 = v22;
      v26 = 67109120;
      RowID = CalCalendarItemGetRowID();
      _os_log_impl(&dword_1B6A18000, v18, OS_LOG_TYPE_INFO, "Notification for event (rowID = %d) is not time-sensitive because there is no occurrence ending after now", (uint8_t *)&v26, 8u);
    }

    goto LABEL_18;
  }
  return 0;
}

- (double)expirationTimestampForEvent:(void *)a3 database:(CalDatabase *)a4
{
  const void *v7;
  double v8;
  double v9;
  double result;

  v7 = (const void *)CalEventOccurrenceCreateForInitialOccurrence();
  CalEventOccurrenceGetDate();
  v9 = v8;
  CFRelease(v7);
  -[CADNotificationGatheringContext expirationTimestampForEvent:withInitialOccurrenceDate:database:](self, "expirationTimestampForEvent:withInitialOccurrenceDate:database:", a3, a4, v9);
  return result;
}

- (double)endDateOfLastOccurrenceInCacheForEvent:(void *)a3 database:(CalDatabase *)a4 cacheRange:(id *)a5
{
  const void *v5;
  int RowID;
  __CFArray *Mutable;
  double Duration;
  const void *v9;
  const __CFArray *v10;
  double v11;
  double v12;

  v5 = (const void *)CalFilterCreateWithDatabaseShowingAll();
  RowID = CalCalendarItemGetRowID();
  Mutable = CFArrayCreateMutable(0, 0, 0);
  CFArrayAppendValue(Mutable, (const void *)RowID);
  Duration = (double)CalEventGetDuration();
  v9 = (const void *)CalDatabaseCopyEventOccurrenceCache();
  v10 = (const __CFArray *)CalEventOccurrenceCacheCopyEventOccurrencesWithIDsAfterDate();
  CFRelease(v9);
  v11 = *MEMORY[0x1E0D0C488];
  if (v10)
  {
    if (CFArrayGetCount(v10))
    {
      CFArrayGetValueAtIndex(v10, 0);
      CalEventOccurrenceGetDate();
      v11 = v12 + Duration;
    }
    CFRelease(v10);
  }
  CFRelease(Mutable);
  CFRelease(v5);
  return v11;
}

- (BOOL)deleteOldNotifications
{
  return self->_deleteOldNotifications;
}

@end
