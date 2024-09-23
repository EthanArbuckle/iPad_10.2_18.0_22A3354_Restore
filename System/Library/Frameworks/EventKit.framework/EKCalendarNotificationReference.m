@implementation EKCalendarNotificationReference

- (EKCalendarNotificationReference)initWithType:(int)a3 objectID:(id)a4 date:(id)a5 eventStore:(id)a6
{
  id v11;
  id v12;
  id v13;
  EKCalendarNotificationReference *v14;
  EKCalendarNotificationReference *v15;
  EKCalendarNotification *notification;
  objc_super v18;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)EKCalendarNotificationReference;
  v14 = -[EKCalendarNotificationReference init](&v18, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_type = a3;
    objc_storeStrong((id *)&v14->_objectID, a4);
    objc_storeStrong((id *)&v15->_date, a5);
    objc_storeStrong((id *)&v15->_eventStore, a6);
    notification = v15->_notification;
    v15->_notification = 0;

    v15->_lock._os_unfair_lock_opaque = 0;
  }

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_eventStore, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong((id *)&self->_notification, 0);
}

- (EKObjectID)objectID
{
  return self->_objectID;
}

- (EKCalendarNotification)notification
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[EKCalendarNotificationReference _notification](self, "_notification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (EKCalendarNotification *)v4;
}

- (id)_notification
{
  EKCalendarNotification *notification;
  id *p_notification;
  uint64_t *p_objectID;
  uint64_t v6;
  void *v7;
  EKEvent *v8;
  EKCalendarEventInvitationNotification *v9;
  id v10;
  NSObject *v11;
  EKCalendarNotification *v12;
  uint64_t v13;
  int64_t v14;
  __objc2_class **v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  EKCalendarSharedCalendarNotification *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  int64_t v45;
  void *v46;
  unint64_t v47;
  CFPropertyListRef v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  NSObject *v72;
  id v73;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;

  p_notification = (id *)&self->_notification;
  notification = self->_notification;
  if (notification)
  {
LABEL_47:
    v12 = notification;
    return v12;
  }
  p_objectID = (uint64_t *)&self->_objectID;
  -[EKEventStore registerFetchedObjectWithID:](self->_eventStore, "registerFetchedObjectWithID:", self->_objectID);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    switch(self->_type)
    {
      case 0:
      case 1:
        v8 = -[EKEvent initWithPersistentObject:occurrenceDate:]([EKEvent alloc], "initWithPersistentObject:occurrenceDate:", v6, self->_date);
        v9 = -[EKCalendarEventInvitationNotification initWithEvent:]([EKCalendarEventInvitationNotification alloc], "initWithEvent:", v8);
        v10 = self->_notification;
        self->_notification = &v9->super;
        goto LABEL_41;
      case 2:
        v8 = -[EKObject initWithPersistentObject:]([EKCalendar alloc], "initWithPersistentObject:", v6);
        v21 = -[EKCalendarSharedCalendarNotification initWithType:]([EKCalendarSharedCalendarNotification alloc], "initWithType:", 8);
        -[EKEvent title](v8, "title");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKCalendarNotification setTitle:](v21, "setTitle:", v22);

        -[EKCalendarNotification setHiddenFromNotificationCenter:](v21, "setHiddenFromNotificationCenter:", -[EKEvent invitationStatus](v8, "invitationStatus") == 1);
        -[EKEvent sharedOwnerName](v8, "sharedOwnerName");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKCalendarNotification setName:](v21, "setName:", v23);

        -[EKEvent sharedOwnerEmail](v8, "sharedOwnerEmail");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKCalendarNotification setEmailAddress:](v21, "setEmailAddress:", v24);

        -[EKEvent sharedOwnerPhoneNumber](v8, "sharedOwnerPhoneNumber");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKCalendarNotification setPhoneNumber:](v21, "setPhoneNumber:", v25);

        -[EKEvent sharedOwnerURL](v8, "sharedOwnerURL");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKCalendarNotification setURL:](v21, "setURL:", v26);

        -[EKCalendarNotification setAlerted:](v21, "setAlerted:", -[EKEvent invitationStatus](v8, "invitationStatus") != 3);
        -[EKCalendarSharedCalendarNotification setSharingInvitationResponse:](v21, "setSharingInvitationResponse:", -[EKEvent sharingInvitationResponse](v8, "sharingInvitationResponse"));
        -[EKCalendarNotification setDotColor:](v21, "setDotColor:", 0);
        -[EKObject objectID](v8, "objectID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKCalendarNotification setObjectID:](v21, "setObjectID:", v27);

        -[EKEvent externalURI](v8, "externalURI");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKCalendarNotification setURL:](v21, "setURL:", v28);

        -[EKCalendarSharedCalendarNotification setAllowedEntityTypes:](v21, "setAllowedEntityTypes:", -[EKEvent allowedEntityTypes](v8, "allowedEntityTypes"));
        -[EKEvent source](v8, "source");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKCalendarNotification setSource:](v21, "setSource:", v29);

        -[EKCalendarNotification setCalendar:](v21, "setCalendar:", v8);
        goto LABEL_21;
      case 3:
        -[EKEventStore publicObjectWithPersistentObject:](self->_eventStore, "publicObjectWithPersistentObject:", v6);
        v8 = (EKEvent *)objc_claimAutoreleasedReturnValue();
        if (-[EKEvent shareeStatus](v8, "shareeStatus") == 3)
          v30 = 10;
        else
          v30 = 9;
        v21 = -[EKCalendarInviteReplyNotification initWithType:]([EKCalendarInviteReplyNotification alloc], "initWithType:", v30);
        -[EKEvent calendarName](v8, "calendarName");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKCalendarNotification setTitle:](v21, "setTitle:", v31);

        -[EKEvent shareeDisplayName](v8, "shareeDisplayName");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKCalendarNotification setName:](v21, "setName:", v32);

        -[EKEvent shareeEmailAddress](v8, "shareeEmailAddress");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKCalendarNotification setEmailAddress:](v21, "setEmailAddress:", v33);

        -[EKEvent shareePhoneNumber](v8, "shareePhoneNumber");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKCalendarNotification setPhoneNumber:](v21, "setPhoneNumber:", v34);

        -[EKEvent shareeURL](v8, "shareeURL");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKCalendarNotification setURL:](v21, "setURL:", v35);

        -[EKCalendarNotification setAlerted:](v21, "setAlerted:", -[EKEvent alerted](v8, "alerted"));
        -[EKCalendarNotification setHiddenFromNotificationCenter:](v21, "setHiddenFromNotificationCenter:", 0);
        -[EKCalendarSharedCalendarNotification setStatus:](v21, "setStatus:", -[EKEvent shareeStatus](v8, "shareeStatus"));
        -[EKEvent inviteReplyCalendar](v8, "inviteReplyCalendar");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKCalendarNotification setDotColor:](v21, "setDotColor:", objc_msgSend(v36, "CGColor"));

        -[EKObject objectID](v8, "objectID");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKCalendarNotification setObjectID:](v21, "setObjectID:", v37);

        -[EKObject objectID](v8, "objectID");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "URIRepresentation");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKCalendarNotification setURL:](v21, "setURL:", v39);

        +[EKInviteReplyNotification sourceForInviteReplyNotification:](EKInviteReplyNotification, "sourceForInviteReplyNotification:", v8);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKCalendarNotification setSource:](v21, "setSource:", v40);

        -[EKEvent inviteReplyCalendar](v8, "inviteReplyCalendar");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKCalendarNotification setCalendar:](v21, "setCalendar:", v41);

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[EKEvent inviteReplyCalendar](v8, "inviteReplyCalendar");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          -[EKCalendarSharedCalendarNotification setAllowedEntityTypes:](v21, "setAllowedEntityTypes:", objc_msgSend(v42, "allowedEntityTypes"));

        }
        else
        {
          -[EKCalendarSharedCalendarNotification setAllowedEntityTypes:](v21, "setAllowedEntityTypes:", 1);
        }
LABEL_21:
        v10 = *p_notification;
        *p_notification = v21;
        goto LABEL_41;
      case 4:
      case 5:
        -[EKEventStore publicObjectWithPersistentObject:](self->_eventStore, "publicObjectWithPersistentObject:", v6);
        v8 = (EKEvent *)objc_claimAutoreleasedReturnValue();
        -[EKEvent calendarItem](v8, "calendarItem");
        v10 = (id)objc_claimAutoreleasedReturnValue();
        -[EKCalendarItem calendar](v8, "calendar");
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = -[EKCalendarNotificationReference _notificationTypeForResourceChange:notificationType:](self, "_notificationTypeForResourceChange:notificationType:", v8, self->_type);
        v15 = off_1E4782B68;
        if (self->_type != 5)
          v15 = off_1E4782B58;
        v16 = (void *)objc_msgSend(objc_alloc(*v15), "initWithType:", v14);
        v75 = v7;
        if (-[EKEvent changeType](v8, "changeType") == 3)
        {
          -[EKEvent deletedTitle](v8, "deletedTitle");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          v19 = (void *)v13;
          if (v17)
          {
            v20 = v17;
          }
          else
          {
            objc_msgSend(v10, "title");
            v20 = (id)objc_claimAutoreleasedReturnValue();
          }
          v44 = (uint64_t)v20;

          v43 = v44;
        }
        else
        {
          v19 = (void *)v13;
          objc_msgSend(v10, "title");
          v43 = objc_claimAutoreleasedReturnValue();
        }
        v45 = v14 - 4;
        v79 = (void *)v43;
        if (!v43)
        {
          -[EKCalendarItem calendar](v8, "calendar");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "title");
          v79 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v47 = v45 & 0xFFFFFFFFFFFFFFF5;
        v48 = CFPreferencesCopyAppValue(CFSTR("CalendarsExcludedFromNotifications"), (CFStringRef)*MEMORY[0x1E0D0C508]);
        objc_opt_class();
        v77 = (void *)v48;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v48);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v78 = 0;
        }
        v49 = v19;
        objc_msgSend(v16, "setTitle:", v79, v75);
        if (v47)
        {
          -[EKObject objectID](v8, "objectID");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "URIRepresentation");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setURL:", v51);

        }
        else
        {
          objc_msgSend(v10, "externalURI");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setURL:", v50);
        }

        -[EKEvent changedByDisplayName](v8, "changedByDisplayName");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setName:", v52);

        -[EKEvent emailAddress](v8, "emailAddress");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setEmailAddress:", v53);

        -[EKEvent phoneNumber](v8, "phoneNumber");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setPhoneNumber:", v54);

        -[EKCalendarItem calendar](v8, "calendar");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "title");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setCalendarName:", v56);

        objc_msgSend(v10, "eventIdentifier");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setEventID:", v57);

        objc_msgSend(v16, "setAlerted:", -[EKEvent alerted](v8, "alerted"));
        objc_msgSend(v19, "calendarIdentifier");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setHiddenFromNotificationCenter:", objc_msgSend(v78, "containsObject:", v58));

        if (v10)
        {
          objc_msgSend(v10, "calendar");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setDotColor:", objc_msgSend(v59, "CGColor"));

        }
        else
        {
          objc_msgSend(v16, "setDotColor:", objc_msgSend(v19, "CGColor"));
        }
        -[EKObject objectID](v8, "objectID");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObjectID:", v60);

        -[EKCalendarItem calendar](v8, "calendar");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "source");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setSource:", v62);

        objc_msgSend(v16, "setEvent:", v10);
        -[EKCalendarItem calendar](v8, "calendar");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setCalendar:", v63);

        objc_msgSend(v16, "setChangeType:", -[EKEvent changeType](v8, "changeType"));
        if (-[EKEvent changeType](v8, "changeType") == 4)
        {
          -[EKEvent createCount](v8, "createCount");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setCreateCount:", v64);

          -[EKEvent updateCount](v8, "updateCount");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setUpdateCount:", v65);

          -[EKEvent deleteCount](v8, "deleteCount");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setDeleteCount:", v66);
        }
        else
        {
          objc_msgSend(v16, "setDateChanged:", -[EKEvent dateChanged](v8, "dateChanged"));
          objc_msgSend(v16, "setTimeChanged:", -[EKEvent timeChanged](v8, "timeChanged"));
          objc_msgSend(v16, "setLocationChanged:", -[EKEvent locationChanged](v8, "locationChanged"));
          objc_msgSend(v16, "setTitleChanged:", -[EKEvent titleChanged](v8, "titleChanged"));
          objc_msgSend(v10, "startDate");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setStartDate:", v67);

          objc_msgSend(MEMORY[0x1E0C99D68], "CalSimulatedDateForNow");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "earliestOccurrenceEndingAfter:excludeSignificantDetachments:excludeCanceledDetachments:excludeDeclinedDetachments:", v68, 1, 1, 1);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "startDate");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setStartDateForNextOccurrence:", v70);

          v49 = v19;
          objc_msgSend(v10, "endDateUnadjustedForLegacyClients");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setEndDate:", v71);

          objc_msgSend(v16, "setAllDay:", objc_msgSend(v10, "isAllDay"));
          objc_msgSend(v10, "locationWithoutPrediction");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setLocation:", v66);
        }
        v7 = v76;

        objc_storeStrong(p_notification, v16);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v16, "updateSuggestedEventWithEventStore:", self->_eventStore);

LABEL_41:
        break;
      default:
        break;
    }
    if (!-[EKEventStore objectWithIDExists:](self->_eventStore, "objectWithIDExists:", self->_objectID))
    {
      v72 = EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
        -[EKCalendarNotificationReference _notification].cold.2(p_objectID, (uint64_t *)p_notification, v72);
      v73 = *p_notification;
      *p_notification = 0;

    }
    notification = (EKCalendarNotification *)*p_notification;
    goto LABEL_47;
  }
  v11 = EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
    -[EKCalendarNotificationReference _notification].cold.1(v11);
  v12 = 0;
  return v12;
}

- (EKCalendarNotificationReference)initWithType:(int)a3 objectID:(id)a4 eventStore:(id)a5
{
  return -[EKCalendarNotificationReference initWithType:objectID:date:eventStore:](self, "initWithType:objectID:date:eventStore:", *(_QWORD *)&a3, a4, 0, a5);
}

- (int64_t)_notificationTypeForResourceChange:(id)a3 notificationType:(int)a4
{
  int64_t v5;
  BOOL v6;
  int64_t v7;
  int64_t result;

  switch(objc_msgSend(a3, "changeType"))
  {
    case 1u:
      v5 = 12;
      if (a4 != 5)
        v5 = -1;
      v6 = a4 == 4;
      v7 = 4;
      goto LABEL_12;
    case 2u:
      v5 = 14;
      if (a4 != 5)
        v5 = -1;
      v6 = a4 == 4;
      v7 = 6;
      goto LABEL_12;
    case 3u:
      v5 = 13;
      if (a4 != 5)
        v5 = -1;
      v6 = a4 == 4;
      v7 = 5;
LABEL_12:
      if (v6)
        result = v7;
      else
        result = v5;
      break;
    case 4u:
      result = 7;
      break;
    case 5u:
      result = 11;
      break;
    default:
      result = -1;
      break;
  }
  return result;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t type;
  uint64_t v6;
  NSDate *date;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  type = self->_type;
  v6 = -[EKObjectID rowID](self->_objectID, "rowID");
  date = self->_date;
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate descriptionWithLocale:](date, "descriptionWithLocale:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@{type: %d, rowID: %d, date: %@}"), v4, type, v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (int)type
{
  return self->_type;
}

- (EKEventStore)eventStore
{
  return self->_eventStore;
}

- (NSDate)date
{
  return self->_date;
}

- (void)_notification
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = *a2;
  v5 = 138412546;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  _os_log_debug_impl(&dword_1A2318000, log, OS_LOG_TYPE_DEBUG, "After generating a notification, it was observed that its backing data was removed from the database.  Clearing the notification.  Object ID: [%@]  Generated notification: [%@]", (uint8_t *)&v5, 0x16u);
}

@end
