@implementation CalDAVNotificationHandler

+ (void)processNotificationWithData:(id)a3 serverURL:(id)a4 syncKey:(id)a5 database:(CalDatabase *)a6 notificationCalendar:(void *)a7 store:(void *)a8 calendarHomeURL:(id)a9 notificationCalendarURL:(id)a10 contactsProvider:(id)a11 recordIDMap:(id)a12
{
  id v14;
  id v15;
  id v16;
  id v17;
  objc_class *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char isKindOfClass;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  CalDatabase *v33;
  char v34;
  char v35;
  id v36;
  id v37;
  id v38;
  id v43;
  void *v44;
  void *v45;
  id v46;

  v46 = a4;
  v14 = a5;
  v15 = a9;
  v16 = a10;
  v43 = a11;
  v17 = a12;
  v18 = (objc_class *)MEMORY[0x1E0D15828];
  v19 = a3;
  v20 = [v18 alloc];
  v21 = (void *)objc_msgSend(v20, "initWithRootElementNameSpace:name:parseClass:baseURL:", *MEMORY[0x1E0D15838], *MEMORY[0x1E0D09C40], objc_opt_class(), v15);
  objc_msgSend(v21, "processData:forTask:", v19, 0);

  objc_msgSend(v21, "processData:forTask:", 0, 0);
  objc_msgSend(v21, "rootElement");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "lastPathComponent");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "content");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  objc_msgSend(v22, "content");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  v44 = v17;
  v45 = v16;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v26, "uid");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "payloadAsString");
    v29 = objc_claimAutoreleasedReturnValue();

    v37 = v16;
    v38 = v17;
    v30 = a7;
    v36 = v15;
    v31 = v15;
    v32 = a1;
    v33 = a6;
    objc_msgSend(a1, "_handleInviteNotification:withUid:serverURL:syncKey:database:store:calendarHomeURL:notificationCalendar:notificationCalendarURL:recordIDMap:", v27, v29, v46, v14, v36, a7, v37, v38);
    v23 = (void *)v29;
  }
  else
  {
    v31 = v15;
    v32 = a1;
    v33 = a6;
    objc_opt_class();
    v34 = objc_opt_isKindOfClass();

    objc_msgSend(v22, "content");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v34 & 1) != 0)
    {
      v30 = a7;
      objc_msgSend(a1, "_handleInviteReply:withUid:serverURL:syncKey:owningNotification:database:store:calendarHomeURL:notificationCalendar:notificationCalendarURL:contactsProvider:recordIDMap:", v27, v23, v46, v14, v22, a6, a8, v31, a7, v45, v43, v44);
    }
    else
    {
      objc_opt_class();
      v35 = objc_opt_isKindOfClass();

      if ((v35 & 1) == 0)
      {
        v30 = a7;
        goto LABEL_8;
      }
      objc_msgSend(v22, "content");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = a7;
      objc_msgSend(a1, "_handleResourceChanged:withUid:serverURL:syncKey:database:store:calendarHomeURL:notificationCalendar:notificationCalendarURL:recordIDMap:", v27, v23, v46, v14, a6, a8, v31, a7, v45, v44);
    }
  }

LABEL_8:
  objc_msgSend(v32, "setURL:forResourceWithUUID:withDatabase:notificationCalendar:notificationCalendarURL:recordIDMap:", v46, v23, v33, v30, v45, v44);

}

+ (int)_inviteStatusFromString:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D09C38]) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D09C30]) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D09C20]) & 1) != 0)
  {
    v4 = 2;
  }
  else
  {
    objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D09C28]);
    v4 = 3;
  }

  return v4;
}

+ (void)_createNotificationWithInviteStatus:(int)a3 inDatabase:(CalDatabase *)a4
{
  if ((a3 - 1) < 3)
    return (void *)CalDatabaseCreateInviteReplyNotification((os_unfair_lock_s *)a4);
  if (!a3)
    return (void *)CalDatabaseCreateNotification((os_unfair_lock_s *)a4);
  return result;
}

+ (void)_handleInviteNotification:(id)a3 withUid:(id)a4 serverURL:(id)a5 syncKey:(id)a6 database:(CalDatabase *)a7 store:(void *)a8 calendarHomeURL:(id)a9 notificationCalendar:(void *)a10 notificationCalendarURL:(id)a11 recordIDMap:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const void *v26;
  const void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  __CFString *v32;
  void *Calendar;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  int v52;
  int v53;
  int v54;
  unsigned int v55;
  int CanContainEntityType;
  int v57;
  int v58;
  int v59;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  uint8_t buf[4];
  int v67;
  __int16 v68;
  void *v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v65 = a4;
  v64 = a6;
  v18 = a12;
  v19 = a11;
  v20 = a9;
  v21 = a5;
  objc_msgSend(v17, "inviteStatus");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "name");
  v23 = objc_claimAutoreleasedReturnValue();

  v62 = (void *)v23;
  v24 = objc_msgSend(a1, "_inviteStatusFromString:", v23);
  objc_msgSend(v21, "calDAV_leastInfoStringRepresentationRelativeToParentURL:", v19);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v63 = v18;
  v26 = (const void *)objc_msgSend(a1, "_copyNotificationWithExternalID:inCalendar:withDatabase:recordIDMap:", v25, a10, a7, v18);
  if (!v26)
  {
    v26 = (const void *)objc_msgSend(a1, "_createNotificationWithInviteStatus:inDatabase:", v24, a7);
    CalNotificationSetOwner((uint64_t)v26, a10);
    CalNotificationSetExternalID((uint64_t)v26);
    CalNotificationSetExternalModTag((uint64_t)v26);
    CalNotificationSetUUID((uint64_t)v26);
    v27 = CalEntityCopyRecordID(v26);
    if (v27)
      objc_msgSend(v18, "setUniqueIdentifier:forRecordID:", v65, v27);
  }
  objc_msgSend(v17, "hostURL");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "href");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "payloadAsFullURL");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v30, "calDAV_leastInfoStringRepresentationRelativeToParentURL:", v20);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v31, "appendSlashIfNeeded");
  v32 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    Calendar = (void *)CalDatabaseCopyCalendarWithExternalIDInStore(a7, v32, (uint64_t)a8);
    if ((_DWORD)v24)
      goto LABEL_6;
LABEL_13:
    if (!Calendar)
    {
      Calendar = (void *)CalDatabaseCreateCalendar((os_unfair_lock_s *)a7);
      CalStoreAddCalendar((uint64_t)a8, Calendar);
      CalCalendarSetExternalID((uint64_t)Calendar);
      CalNotificationSetHostURL((uint64_t)v26, (const __CFURL *)v30);
      CalCalendarSetNeedsNotification((uint64_t)Calendar);
    }
    CalCalendarSetIsSharingInvitation((uint64_t)Calendar);
    CalCalendarSetSharingStatus((uint64_t)Calendar);
    CalCalendarSetHidden((uint64_t)Calendar);
    CalCalendarSetImmutable((uint64_t)Calendar);
    CalCalendarSetReadOnly((uint64_t)Calendar);
    CalCalendarSetSharingInvitationResponse((uint64_t)Calendar);
    objc_msgSend(v17, "organizer");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "commonName");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "payloadAsString");
    v43 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "organizer");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "href");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "payloadAsFullURL");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    v61 = (void *)v43;
    CalCalendarSetSharedOwnerName((uint64_t)Calendar);
    objc_msgSend(v46, "absoluteString");
    CalCalendarSetSharedOwnerAddress((uint64_t)Calendar);
    objc_msgSend(v17, "summary");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "payloadAsString");
    CalCalendarSetTitle((uint64_t)Calendar);

    objc_msgSend(v17, "uid");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "payloadAsString");
    CalCalendarSetExternalIdentificationTag((uint64_t)Calendar);

    objc_msgSend(v17, "supportedCalendarComponentSet");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "componentsAsString");
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v50, "length"))
    {
      v51 = objc_msgSend(MEMORY[0x1E0D09C18], "allowedCalendars:contains:", v50, CFSTR("VEVENT"));
      v52 = objc_msgSend(MEMORY[0x1E0D09C18], "allowedCalendars:contains:", v50, CFSTR("VTODO"));
      if ((v52 & (v51 ^ 1)) != 0)
        v53 = 3;
      else
        v53 = 0;
      if (v51)
        v54 = 2;
      else
        v54 = 0;
      if (v52)
        v55 = v53;
      else
        v55 = v54;
      CanContainEntityType = CalCalendarCanContainEntityType((uint64_t)Calendar, 3);
      v57 = CalCalendarCanContainEntityType((uint64_t)Calendar, 2);
      if ((CanContainEntityType & (v57 ^ 1)) != 0)
        v58 = 3;
      else
        v58 = 0;
      if (v57)
        v59 = 2;
      else
        v59 = 0;
      if (!CanContainEntityType)
        v58 = v59;
      if (v58 != v55)
        CalCalendarSetCanContainEntityType((uint64_t)Calendar, v55);
    }

    v40 = v62;
    if (Calendar)
      goto LABEL_36;
    goto LABEL_37;
  }
  Calendar = 0;
  if (!(_DWORD)v24)
    goto LABEL_13;
LABEL_6:
  if ((_DWORD)v24 == 1)
  {
    CalInviteReplyNotificationSetHostURL((uint64_t)v26, (const __CFURL *)v30);
    objc_msgSend(v17, "summary");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "payloadAsString");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    CalInviteReplyNotificationSetSummary(v26, v35);
    CalInviteReplyNotificationSetStatus((uint64_t)v26);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "timeIntervalSinceReferenceDate");
    v38 = v37;

    CalInviteReplyNotificationSetCreationDate(v26, v38);
  }
  v39 = CDBLogHandle;
  v40 = v62;
  if (os_log_type_enabled((os_log_t)CDBLogHandle, (os_log_type_t)6u))
  {
    *(_DWORD *)buf = 67109378;
    v67 = v24;
    v68 = 2112;
    v69 = v30;
    _os_log_impl(&dword_1A5CCB000, v39, (os_log_type_t)6u, "Got an invitation response of %d for calendar %@, so we're going to remove it", buf, 0x12u);
  }
  if (Calendar)
  {
    CalRemoveCalendar(Calendar);
LABEL_36:
    CFRelease(Calendar);
  }
LABEL_37:
  if (v26)
    CFRelease(v26);

}

+ (void)_handleInviteReply:(id)a3 withUid:(id)a4 serverURL:(id)a5 syncKey:(id)a6 owningNotification:(id)a7 database:(CalDatabase *)a8 store:(void *)a9 calendarHomeURL:(id)a10 notificationCalendar:(void *)a11 notificationCalendarURL:(id)a12 contactsProvider:(id)a13 recordIDMap:(id)a14
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  const void *InviteReplyNotification;
  void *v29;
  id v30;
  uint64_t v31;
  const void *v32;
  const void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  const __CFURL *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  id v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  NSObject *v69;
  void *v70;
  void *v71;
  NSObject *v72;
  uint64_t v73;
  void *v74;
  NSObject *v75;
  id v76;
  void *v77;
  void *v78;
  void *v79;
  NSObject *v80;
  void *v81;
  void *v82;
  const __CFURL *v83;
  id v84;
  id v85;
  id v87;
  void *v88;
  id v89;
  id v90;
  void *v91;
  id v92;
  void *v93;
  uint8_t buf[4];
  id v95;
  __int16 v96;
  void *v97;
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v90 = a4;
  v20 = a5;
  v92 = a6;
  v21 = a7;
  v22 = a10;
  v23 = a12;
  v89 = a13;
  v24 = a14;
  v25 = CDBLogHandle;
  if (os_log_type_enabled((os_log_t)CDBLogHandle, (os_log_type_t)6u))
  {
    *(_DWORD *)buf = 138412290;
    v95 = v19;
    _os_log_impl(&dword_1A5CCB000, v25, (os_log_type_t)6u, "Handling invite reply notification %@", buf, 0xCu);
  }
  objc_msgSend(v20, "calDAV_leastInfoStringRepresentationRelativeToParentURL:", v23);
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(a1, "_copyNotificationWithExternalID:inCalendar:withDatabase:recordIDMap:");
  v91 = v21;
  v88 = v23;
  if (v27)
  {
    InviteReplyNotification = (const void *)v27;
    v84 = v22;
    v93 = 0;
    v29 = (void *)v26;
    v30 = v90;
    goto LABEL_9;
  }
  v31 = objc_msgSend(a1, "_copyCalendarForReplyItem:inDatabase:store:calendarHomeURL:", v19, a8, a9, v22);
  if (v31)
  {
    v32 = (const void *)v31;
    InviteReplyNotification = CalDatabaseCreateInviteReplyNotification((os_unfair_lock_s *)a8);
    CalNotificationSetOwner((uint64_t)InviteReplyNotification, a11);
    v29 = (void *)v26;
    CalNotificationSetExternalID((uint64_t)InviteReplyNotification);
    CalNotificationSetExternalModTag((uint64_t)InviteReplyNotification);
    v30 = v90;
    CalNotificationSetUUID((uint64_t)InviteReplyNotification);
    CalInviteReplyNotificationSetInviteReplyCalendar((uint64_t)InviteReplyNotification, v32);
    v93 = (void *)CalCalendarCopyTitle((uint64_t)v32);
    v33 = CalEntityCopyRecordID(InviteReplyNotification);
    if (v33)
      objc_msgSend(v24, "setUniqueIdentifier:forRecordID:", v90, v33);
    v84 = v22;
    CFRelease(v32);
    v21 = v91;
LABEL_9:
    objc_msgSend(v21, "dtstamp");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "payloadAsString");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v21;
    v37 = objc_msgSend(v35, "length");

    if (v37)
    {
      v38 = (void *)MEMORY[0x1E0DDB818];
      objc_msgSend(v36, "dtstamp");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "payloadAsString");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "dateFromICSString:", v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDB800]), "initWithValue:", v41);
      v43 = CalDateFromICSDateAsUTC(v42);
      CalInviteReplyNotificationSetCreationDate(InviteReplyNotification, v43);

    }
    objc_msgSend(v19, "inviteStatus");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "name");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    v85 = v20;
    v87 = v24;
    if ((objc_msgSend(v45, "isEqualToString:", *MEMORY[0x1E0D09C20]) & 1) != 0)
    {
      v46 = v30;
    }
    else
    {
      v46 = v30;
      if ((objc_msgSend(v45, "isEqualToString:", *MEMORY[0x1E0D09C28]) & 1) == 0)
        objc_msgSend(v45, "isEqualToString:", *MEMORY[0x1E0D09C30]);
    }
    CalInviteReplyNotificationSetStatus((uint64_t)InviteReplyNotification);
    objc_msgSend(v19, "hostURL");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "href");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "payloadAsFullURL");
    v49 = (const __CFURL *)objc_claimAutoreleasedReturnValue();

    CalInviteReplyNotificationSetHostURL((uint64_t)InviteReplyNotification, v49);
    objc_msgSend(v19, "inReplyTo");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "payloadAsString");
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    CalInviteReplyNotificationSetInReplyTo((uint64_t)InviteReplyNotification);
    objc_msgSend(v19, "summary");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "payloadAsString");
    v53 = objc_claimAutoreleasedReturnValue();
    v54 = (void *)v53;
    v55 = v93;
    if (v53)
      v55 = (void *)v53;
    v56 = v55;

    CalInviteReplyNotificationSetSummary(InviteReplyNotification, v56);
    objc_msgSend(v19, "firstName");
    v57 = objc_claimAutoreleasedReturnValue();
    if (v57
      && (v58 = (void *)v57,
          objc_msgSend(v19, "lastName"),
          v59 = (void *)objc_claimAutoreleasedReturnValue(),
          v59,
          v58,
          v59))
    {
      v60 = (void *)CDBLogHandle;
      if (os_log_type_enabled((os_log_t)CDBLogHandle, (os_log_type_t)6u))
      {
        v61 = v60;
        objc_msgSend(v19, "firstName");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "lastName");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v95 = v62;
        v96 = 2112;
        v97 = v63;
        _os_log_impl(&dword_1A5CCB000, v61, (os_log_type_t)6u, "Invite reply has firstName: %@, lastName: %@", buf, 0x16u);

      }
      objc_msgSend(v19, "firstName");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      CalInviteReplyNotificationSetShareeFirstName((uint64_t)InviteReplyNotification);

      objc_msgSend(v19, "lastName");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      CalInviteReplyNotificationSetShareeLastName((uint64_t)InviteReplyNotification);
      v66 = v46;
    }
    else
    {
      objc_msgSend(v19, "acceptedURL");
      v67 = (void *)objc_claimAutoreleasedReturnValue();

      v66 = v46;
      v24 = v87;
      if (v67)
      {
LABEL_39:
        objc_msgSend(v19, "acceptedURL");
        v82 = (void *)objc_claimAutoreleasedReturnValue();

        if (v82)
        {
          objc_msgSend(v19, "acceptedURL");
          v83 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
          CalInviteReplyNotificationSetShareeAddress((uint64_t)InviteReplyNotification, v83);

        }
        CFRelease(InviteReplyNotification);

        v22 = v84;
        v20 = v85;
        goto LABEL_42;
      }
      objc_msgSend(v19, "href");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "payloadAsFullURL");
      v65 = (void *)objc_claimAutoreleasedReturnValue();

      v69 = CDBLogHandle;
      if (os_log_type_enabled((os_log_t)CDBLogHandle, (os_log_type_t)6u))
      {
        *(_DWORD *)buf = 138412290;
        v95 = v65;
        _os_log_impl(&dword_1A5CCB000, v69, (os_log_type_t)6u, "Invite reply has no names. Using the provided address of %@", buf, 0xCu);
      }
      objc_msgSend(v65, "absoluteString");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v70, "hasMailto") & 1) != 0 || objc_msgSend(v70, "hasTel"))
      {
        CalInviteReplyNotificationSetShareeAddress((uint64_t)InviteReplyNotification, (const __CFURL *)v65);
        if (objc_msgSend(v70, "hasMailto"))
        {
          objc_msgSend(v70, "stringRemovingMailto");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = CDBLogHandle;
          if (os_log_type_enabled((os_log_t)CDBLogHandle, (os_log_type_t)6u))
          {
            *(_DWORD *)buf = 138412290;
            v95 = v71;
            _os_log_impl(&dword_1A5CCB000, v72, (os_log_type_t)6u, "This looks like a mailto address. Search the addressbook for a contact with the address %@", buf, 0xCu);
          }
          objc_msgSend(v89, "fullNameForFirstContactMatchingEmailAddress:", v71);
          v73 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v70, "stringRemovingTel");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v80 = CDBLogHandle;
          if (os_log_type_enabled((os_log_t)CDBLogHandle, (os_log_type_t)6u))
          {
            *(_DWORD *)buf = 138412290;
            v95 = v71;
            _os_log_impl(&dword_1A5CCB000, v80, (os_log_type_t)6u, "This looks like a telephone number. Search the addressbook for a contact with the phone number %@", buf, 0xCu);
          }
          objc_msgSend(v89, "fullNameForFirstContactMatchingPhoneNumber:", v71);
          v73 = objc_claimAutoreleasedReturnValue();
        }
        v81 = (void *)v73;

        CalInviteReplyNotificationSetShareeDisplayName((uint64_t)InviteReplyNotification);
        v66 = v90;
      }

    }
    v24 = v87;
    goto LABEL_39;
  }
  v74 = (void *)CDBLogHandle;
  v29 = (void *)v26;
  v66 = v90;
  if (os_log_type_enabled((os_log_t)CDBLogHandle, (os_log_type_t)6u))
  {
    v75 = v74;
    objc_msgSend(v19, "hostURL");
    v76 = v22;
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "href");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "payloadAsOriginalURL");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v95 = v79;
    _os_log_impl(&dword_1A5CCB000, v75, (os_log_type_t)6u, "Ignoring invite reply notification for an unknown calendar: %@", buf, 0xCu);

    v22 = v76;
  }
LABEL_42:

}

+ (void)_copyCalendarForReplyItem:(id)a3 inDatabase:(CalDatabase *)a4 store:(void *)a5 calendarHomeURL:(id)a6
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  CFTypeRef v15;

  if (!a5)
    return 0;
  v9 = a6;
  objc_msgSend(a3, "hostURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "href");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "payloadAsFullURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "calDAV_leastInfoStringRepresentationRelativeToParentURL:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "appendSlashIfNeeded");
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v15 = CalDatabaseCopyCalendarWithExternalIDInStore(a4, v14, (uint64_t)a5);
  return (void *)v15;
}

+ (void)_handleResourceChanged:(id)a3 withUid:(id)a4 serverURL:(id)a5 syncKey:(id)a6 database:(CalDatabase *)a7 store:(void *)a8 calendarHomeURL:(id)a9 notificationCalendar:(void *)a10 notificationCalendarURL:(id)a11 recordIDMap:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  const void *v24;
  const void *v25;
  id v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  const void *v35;
  const void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  uint64_t j;
  void *v49;
  const void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t k;
  void *v56;
  uint64_t v57;
  const void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t m;
  void *v68;
  uint64_t v69;
  const void *v70;
  void *v71;
  uint64_t v72;
  const void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t n;
  void *v77;
  uint64_t v78;
  const void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  id obj;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  id v90;
  CalDatabase *v91;
  void *v92;
  void *v93;
  const void *v94;
  uint64_t v95;
  id v97;
  uint64_t v98;
  const void *v99;
  uint64_t v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  _BYTE v129[128];
  _BYTE v130[128];
  _BYTE v131[128];
  _BYTE v132[128];
  _BYTE v133[128];
  _BYTE v134[128];
  _BYTE v135[128];
  uint64_t v136;

  v136 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  v19 = a6;
  v97 = a9;
  v20 = a1;
  v21 = a12;
  objc_msgSend(a5, "calDAV_leastInfoStringRepresentationRelativeToParentURL:", a11);
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(a1, "_copyNotificationWithExternalID:inCalendar:withDatabase:recordIDMap:", v22, a10, a7, v21);
  v83 = v19;
  v84 = v18;
  v81 = (void *)v22;
  if (v23)
  {
    v24 = (const void *)v23;
    CalResourceChangeNotificationRemoveAllChanges(v23);
  }
  else
  {
    v24 = CalDatabaseCreateResourceChangeNotification((os_unfair_lock_s *)a7);
    CalNotificationSetOwner((uint64_t)v24, a10);
    CalNotificationSetExternalID((uint64_t)v24);
    CalNotificationSetExternalModTag((uint64_t)v24);
    CalNotificationSetUUID((uint64_t)v24);
    v25 = CalEntityCopyRecordID(v24);
    if (v25)
      objc_msgSend(v21, "setUniqueIdentifier:forRecordID:", v18, v25);
  }
  v26 = objc_alloc(MEMORY[0x1E0DDB800]);
  objc_msgSend(v17, "dtstamp");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v26, "initWithValue:", v27);

  v80 = v28;
  v29 = CalDateFromICSDateAsUTC(v28);
  v94 = v24;
  CalResourceChangeNotificationSetLastModifiedDate(v24, v29);
  v127 = 0u;
  v128 = 0u;
  v125 = 0u;
  v126 = 0u;
  objc_msgSend(v17, "created");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v125, v135, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v126;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v126 != v33)
          objc_enumerationMutation(v30);
        v35 = (const void *)objc_msgSend(a1, "_createResourceChange:withType:forNotification:withRecurrenceID:database:store:calendarHomeURL:", *(_QWORD *)(*((_QWORD *)&v125 + 1) + 8 * i), 1, v24, 0, a7, a8, v97);
        if (v35)
          CFRelease(v35);
      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v125, v135, 16);
    }
    while (v32);
  }
  v82 = v21;

  v123 = 0u;
  v124 = 0u;
  v121 = 0u;
  v122 = 0u;
  v85 = v17;
  objc_msgSend(v17, "updated");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v36 = v24;
  v88 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v121, v134, 16);
  if (v88)
  {
    v87 = *(_QWORD *)v122;
    v91 = a7;
    do
    {
      v37 = 0;
      do
      {
        if (*(_QWORD *)v122 != v87)
          objc_enumerationMutation(obj);
        v89 = v37;
        v38 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * v37);
        objc_msgSend(v38, "calendarChanges");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "_changedAttributesFromCalendarChanges:", v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v40, "count"))
        {
          v119 = 0u;
          v120 = 0u;
          v117 = 0u;
          v118 = 0u;
          objc_msgSend(v40, "allKeys");
          v90 = (id)objc_claimAutoreleasedReturnValue();
          v98 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v117, v133, 16);
          if (!v98)
            goto LABEL_46;
          v95 = *(_QWORD *)v118;
          v92 = v38;
          v93 = v40;
          while (1)
          {
            v41 = 0;
            do
            {
              if (*(_QWORD *)v118 != v95)
                objc_enumerationMutation(v90);
              v100 = v41;
              v42 = *(_QWORD *)(*((_QWORD *)&v117 + 1) + 8 * v41);
              v99 = (const void *)objc_msgSend(v20, "_createResourceChange:withType:forNotification:withRecurrenceID:database:store:calendarHomeURL:", v38, 2, v36, v42, a7, a8, v97);
              if (v99)
              {
                objc_msgSend(v40, "objectForKeyedSubscript:", v42);
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                v113 = 0u;
                v114 = 0u;
                v115 = 0u;
                v116 = 0u;
                v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v113, v132, 16);
                if (!v44)
                  goto LABEL_43;
                v45 = v44;
                v46 = 0;
                v47 = *(_QWORD *)v114;
                while (1)
                {
                  for (j = 0; j != v45; ++j)
                  {
                    if (*(_QWORD *)v114 != v47)
                      objc_enumerationMutation(v43);
                    v49 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * j);
                    if (!objc_msgSend(v49, "caseInsensitiveCompare:", CFSTR("dtstart")))
                    {
LABEL_38:
                      v46 |= 1u;
                      continue;
                    }
                    if (objc_msgSend(v49, "caseInsensitiveCompare:", CFSTR("TimeChanged")))
                    {
                      if (!objc_msgSend(v49, "caseInsensitiveCompare:", CFSTR("DateChanged")))
                        goto LABEL_38;
                      if (objc_msgSend(v49, "caseInsensitiveCompare:", CFSTR("summary")))
                      {
                        if (!objc_msgSend(v49, "caseInsensitiveCompare:", CFSTR("location"))
                          || !objc_msgSend(v49, "caseInsensitiveCompare:", CFSTR("x-apple-structured-location")))
                        {
                          v46 |= 8u;
                        }
                      }
                      else
                      {
                        v46 |= 4u;
                      }
                    }
                    else
                    {
                      v46 |= 2u;
                    }
                  }
                  v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v113, v132, 16);
                  if (!v45)
                  {
LABEL_43:
                    CalResourceChangeSetChangedProperties((uint64_t)v99);
                    CFRelease(v99);

                    a7 = v91;
                    v38 = v92;
                    v20 = a1;
                    v36 = v24;
                    v40 = v93;
                    break;
                  }
                }
              }
              v41 = v100 + 1;
            }
            while (v100 + 1 != v98);
            v98 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v117, v133, 16);
            if (!v98)
            {
LABEL_46:

              goto LABEL_49;
            }
          }
        }
        v50 = (const void *)objc_msgSend(v20, "_createResourceChange:withType:forNotification:withRecurrenceID:database:store:calendarHomeURL:", v38, 2, v36, 0, a7, a8, v97);
        if (v50)
          CFRelease(v50);
LABEL_49:

        v37 = v89 + 1;
      }
      while (v89 + 1 != v88);
      v88 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v121, v134, 16);
    }
    while (v88);
  }

  v111 = 0u;
  v112 = 0u;
  v109 = 0u;
  v110 = 0u;
  objc_msgSend(v85, "deleted");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v109, v131, 16);
  if (v52)
  {
    v53 = v52;
    v54 = *(_QWORD *)v110;
    do
    {
      for (k = 0; k != v53; ++k)
      {
        if (*(_QWORD *)v110 != v54)
          objc_enumerationMutation(v51);
        v56 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * k);
        v57 = objc_msgSend(a1, "_createResourceChange:withType:forNotification:withRecurrenceID:database:store:calendarHomeURL:", v56, 3, v36, 0, a7, a8, v97);
        if (v57)
        {
          v58 = (const void *)v57;
          objc_msgSend(v56, "summary");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = v59;
          if (v59)
          {
            v61 = v59;
          }
          else
          {
            objc_msgSend(v56, "displayName");
            v61 = (id)objc_claimAutoreleasedReturnValue();
          }
          v62 = v61;

          CalResourceChangeSetDeletedSummary((uint64_t)v58);
          CFRelease(v58);

        }
        v36 = v94;
      }
      v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v109, v131, 16);
    }
    while (v53);
  }

  v107 = 0u;
  v108 = 0u;
  v105 = 0u;
  v106 = 0u;
  objc_msgSend(v85, "collectionChanges");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v105, v130, 16);
  if (v64)
  {
    v65 = v64;
    v66 = *(_QWORD *)v106;
    do
    {
      for (m = 0; m != v65; ++m)
      {
        if (*(_QWORD *)v106 != v66)
          objc_enumerationMutation(v63);
        v68 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * m);
        v69 = objc_msgSend(a1, "_createResourceChange:withType:forNotification:withRecurrenceID:database:store:calendarHomeURL:", v68, 4, v94, 0, a7, a8, v97);
        if (v69)
        {
          v70 = (const void *)v69;
          if (objc_msgSend(v68, "created"))
          {
            objc_msgSend(v68, "created");
            CalResourceChangeSetCreateCount((uint64_t)v70);
          }
          if (objc_msgSend(v68, "updated"))
          {
            objc_msgSend(v68, "updated");
            CalResourceChangeSetUpdateCount((uint64_t)v70);
          }
          if (objc_msgSend(v68, "deleted"))
          {
            objc_msgSend(v68, "deleted");
            CalResourceChangeSetDeleteCount((uint64_t)v70);
          }
          CFRelease(v70);
        }
      }
      v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v105, v130, 16);
    }
    while (v65);
  }

  v103 = 0u;
  v104 = 0u;
  v101 = 0u;
  v102 = 0u;
  objc_msgSend(v85, "collectionUpdates");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v101, v129, 16);
  v73 = v94;
  if (v72)
  {
    v74 = v72;
    v75 = *(_QWORD *)v102;
    do
    {
      for (n = 0; n != v74; ++n)
      {
        if (*(_QWORD *)v102 != v75)
          objc_enumerationMutation(v71);
        v77 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * n);
        v78 = objc_msgSend(a1, "_createResourceChange:withType:forNotification:withRecurrenceID:database:store:calendarHomeURL:", v77, 5, v73, 0, a7, a8, v97);
        if (v78)
        {
          v79 = (const void *)v78;
          if (objc_msgSend(v77, "state") != 2)
            objc_msgSend(v77, "state");
          CalResourceChangeSetPublicStatus((uint64_t)v79);
          CFRelease(v79);
        }
        v73 = v94;
      }
      v74 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v101, v129, 16);
    }
    while (v74);
  }

  CFRelease(v73);
}

+ (void)_createResourceChange:(id)a3 withType:(unsigned int)a4 forNotification:(void *)a5 withRecurrenceID:(id)a6 database:(CalDatabase *)a7 store:(void *)a8 calendarHomeURL:(id)a9
{
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  unsigned int v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  __CFString *v31;
  CFTypeRef v32;
  const void *v33;
  __CFString *v34;
  CFTypeRef v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  const __CFURL *v46;
  id v47;
  void *v48;
  void *v49;
  double v50;
  CFDateRef v51;
  CFMutableArrayRef v53;
  id v54;
  void *v55;
  CalDatabase *v56;
  double v57;
  uint64_t v58;
  void *v59;
  const __CFURL *v60;
  CalDatabase *v61;
  id v62;

  v14 = a3;
  v15 = a6;
  v16 = a9;
  v17 = (void *)CalDatabaseCreateResourceChangeOfType((os_unfair_lock_s *)a7);
  CalResourceChangeNotificationAddChange((uint64_t)a5, v17);
  objc_msgSend(v14, "href");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "payloadAsFullURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "pathExtension");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("ics"));

  if (v21)
  {
    objc_msgSend(v19, "URLByDeletingLastPathComponent");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "calDAV_leastInfoStringRepresentationRelativeToParentURL:", v16);
    v61 = a7;
    v23 = a4;
    v24 = a8;
    v25 = v17;
    v26 = v19;
    v27 = v14;
    v28 = v16;
    v29 = v15;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "appendSlashIfNeeded");
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v15 = v29;
    v16 = v28;
    v14 = v27;
    v19 = v26;
    v17 = v25;
    a8 = v24;
    a4 = v23;
    a7 = v61;
  }
  else
  {
    objc_msgSend(v19, "calDAV_leastInfoStringRepresentationRelativeToParentURL:", v16);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "appendSlashIfNeeded");
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  v32 = CalDatabaseCopyCalendarWithExternalIDInStore(a7, v31, (uint64_t)a8);
  if (v32)
  {
    v33 = v32;
    CalResourceChangeSetCalendar((uint64_t)v17, v32);
    CFRelease(v33);
  }
  if (a4 - 1 <= 1)
  {
    objc_msgSend(v19, "calDAV_leastInfoStringRepresentationRelativeToParentURL:", v16);
    v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v35 = CalDatabaseCopyCalendarItemWithExternalIDInCalendarOrStore((os_unfair_lock_s *)a7, -1, v34, 0, (uint64_t)a8);
    v62 = v15;
    if (v15)
    {
      if ((objc_msgSend(v15, "isEqualToString:", CFSTR("master")) & 1) == 0)
      {
        v53 = CalEventCopyDetachedEvents((uint64_t)v35);
        if (-[__CFArray count](v53, "count"))
        {
          v54 = objc_alloc(MEMORY[0x1E0DDB800]);
          objc_msgSend(MEMORY[0x1E0DDB818], "dateFromICSString:", v15);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = (CalDatabase *)objc_msgSend(v54, "initWithValue:", v55);

          v61 = v56;
          v57 = CalDateFromICSDateAsUTC(v56);
          if (-[__CFArray count](v53, "count"))
          {
            v58 = 0;
            while (1)
            {
              -[__CFArray objectAtIndexedSubscript:](v53, "objectAtIndexedSubscript:", v58, v61);
              v36 = (void *)objc_claimAutoreleasedReturnValue();

              if (CalEventGetOriginalStartDate((uint64_t)v36) == v57)
                break;
              if (++v58 >= (unint64_t)-[__CFArray count](v53, "count"))
                goto LABEL_36;
            }
            if (v36)
            {
              CFRetain(v36);
              v15 = v36;
            }
            else
            {
              v15 = 0;
            }
          }
          else
          {
LABEL_36:
            v15 = 0;
            v36 = (void *)v35;
          }

        }
        else
        {
          v15 = 0;
          v36 = (void *)v35;
        }

        if (!v36)
          goto LABEL_12;
        goto LABEL_11;
      }
      v15 = 0;
    }
    v36 = (void *)v35;
    if (!v35)
    {
LABEL_12:
      if (v35)
        CFRelease(v35);
      if (v15)
        CFRelease(v15);

      v15 = v62;
      goto LABEL_17;
    }
LABEL_11:
    CalResourceChangeSetCalendarItem((uint64_t)v17, v36);
    goto LABEL_12;
  }
LABEL_17:
  objc_msgSend(v14, "changedBy", v61);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v37;
  if (!v37)
    goto LABEL_30;
  objc_msgSend(v37, "displayName");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
  {
    CalResourceChangeSetChangedByDisplayName((uint64_t)v17);
  }
  else
  {
    objc_msgSend(v38, "firstName");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    CalResourceChangeSetChangedByFirstName((uint64_t)v17);

    objc_msgSend(v38, "lastName");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    CalResourceChangeSetChangedByLastName((uint64_t)v17);

  }
  objc_msgSend(v38, "emailAddress");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    objc_msgSend(v38, "emailAddress");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (const __CFString *)objc_msgSend(v43, "stringAddingMailto");
  }
  else
  {
    objc_msgSend(v38, "phoneNumber");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v45)
    {
      objc_msgSend(v38, "address");
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      if (v59)
      {
        objc_msgSend(v38, "address");
        v60 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
        CalResourceChangeSetChangedByAddress((uint64_t)v17, v60);

      }
      goto LABEL_27;
    }
    objc_msgSend(v38, "phoneNumber");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (const __CFString *)objc_msgSend(v43, "stringAddingTel");
  }
  v46 = CFURLCreateWithString(0, v44, 0);

  CalResourceChangeSetChangedByAddress((uint64_t)v17, v46);
  if (v46)
    CFRelease(v46);
LABEL_27:
  v47 = objc_alloc(MEMORY[0x1E0DDB800]);
  objc_msgSend(v38, "dtstamp");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = (void *)objc_msgSend(v47, "initWithValue:", v48);

  v50 = CalDateFromICSDateAsUTC(v49);
  v51 = CFDateCreate(0, v50);
  CalResourceChangeSetTimestamp((uint64_t)v17);
  if (v51)
    CFRelease(v51);

LABEL_30:
  return v17;
}

+ (id)_changedAttributesFromCalendarChanges:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  const __CFString *v32;
  uint64_t v33;
  id obj;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  __CFString *v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v42 = (id)objc_claimAutoreleasedReturnValue();
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  obj = v3;
  v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
  if (v37)
  {
    v36 = *(_QWORD *)v54;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v54 != v36)
          objc_enumerationMutation(obj);
        v38 = v4;
        v5 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v4);
        v49 = 0u;
        v50 = 0u;
        v51 = 0u;
        v52 = 0u;
        objc_msgSend(v5, "recurrences");
        v39 = (id)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
        if (v41)
        {
          v40 = *(_QWORD *)v50;
          do
          {
            v6 = 0;
            do
            {
              if (*(_QWORD *)v50 != v40)
                objc_enumerationMutation(v39);
              v44 = v6;
              v7 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v6);
              objc_msgSend(v7, "recurrenceID");
              v8 = (void *)objc_claimAutoreleasedReturnValue();
              if (v8)
              {
                objc_msgSend(v7, "recurrenceID");
                v9 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "payloadAsString");
                v10 = (const __CFString *)objc_claimAutoreleasedReturnValue();

              }
              else
              {
                v10 = CFSTR("master");
              }

              objc_msgSend(v42, "objectForKeyedSubscript:", v10);
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v11)
              {
                v11 = (void *)objc_opt_new();
                objc_msgSend(v42, "setObject:forKeyedSubscript:", v11, v10);
              }
              v43 = (__CFString *)v10;
              v47 = 0u;
              v48 = 0u;
              v45 = 0u;
              v46 = 0u;
              objc_msgSend(v7, "changes");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "changedProperties");
              v13 = (void *)objc_claimAutoreleasedReturnValue();

              v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
              if (v14)
              {
                v15 = v14;
                v16 = *(_QWORD *)v46;
                do
                {
                  v17 = 0;
                  do
                  {
                    if (*(_QWORD *)v46 != v16)
                      objc_enumerationMutation(v13);
                    v18 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v17);
                    objc_msgSend(v18, "nameAttribute");
                    v19 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v19)
                    {
                      objc_msgSend(v18, "nameAttribute");
                      v20 = (void *)objc_claimAutoreleasedReturnValue();
                      v21 = objc_msgSend(v20, "caseInsensitiveCompare:", CFSTR("dtstart"));

                      if (v21)
                        goto LABEL_23;
                      objc_msgSend(v18, "typeAttribute");
                      v23 = objc_claimAutoreleasedReturnValue();
                      if (v23
                        && (v24 = (void *)v23,
                            objc_msgSend(v18, "typeAttribute"),
                            v25 = (void *)objc_claimAutoreleasedReturnValue(),
                            v26 = objc_msgSend(v25, "caseInsensitiveCompare:", CFSTR("time")),
                            v25,
                            v24,
                            !v26))
                      {
                        v31 = v11;
                        v32 = CFSTR("TimeChanged");
                      }
                      else
                      {
                        objc_msgSend(v18, "typeAttribute");
                        v27 = objc_claimAutoreleasedReturnValue();
                        if (!v27
                          || (v28 = (void *)v27,
                              objc_msgSend(v18, "typeAttribute"),
                              v29 = (void *)objc_claimAutoreleasedReturnValue(),
                              v30 = objc_msgSend(v29, "caseInsensitiveCompare:", CFSTR("date")),
                              v29,
                              v28,
                              v30))
                        {
LABEL_23:
                          objc_msgSend(v18, "nameAttribute");
                          v22 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v11, "addObject:", v22);

                          goto LABEL_24;
                        }
                        v31 = v11;
                        v32 = CFSTR("DateChanged");
                      }
                      objc_msgSend(v31, "addObject:", v32);
                    }
LABEL_24:
                    ++v17;
                  }
                  while (v15 != v17);
                  v33 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
                  v15 = v33;
                }
                while (v33);
              }

              v6 = v44 + 1;
            }
            while (v44 + 1 != v41);
            v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
          }
          while (v41);
        }

        v4 = v38 + 1;
      }
      while (v38 + 1 != v37);
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
    }
    while (v37);
  }

  return v42;
}

+ (void)_copyNotificationWithUniqueIdentifier:(id)a3 inCalendar:(void *)a4 orStore:(void *)a5 withDatabase:(CalDatabase *)a6 recordIDMap:(id)a7
{
  __CFString *v11;
  id v12;
  const void *v13;
  void *v14;
  CFTypeRef v15;
  const void *v16;
  const void *v17;

  v11 = (__CFString *)a3;
  v12 = a7;
  v13 = (const void *)objc_msgSend(v12, "recordIDForUniqueIdentifier:", v11);
  if (!v13 || (v14 = (void *)CalDatabaseCopyEntityWithRecordID((uint64_t)a6, v13)) == 0)
  {
    v15 = CalDatabaseCopyNotificationWithUniqueIdentifierInCalendarOrStore((os_unfair_lock_s *)a6, -1, v11, (uint64_t)a4, (uint64_t)a5);
    v14 = (void *)v15;
    if (v15)
    {
      v16 = CalEntityCopyRecordID(v15);
      if (v16)
      {
        v17 = v16;
        objc_msgSend(v12, "setUniqueIdentifier:forRecordID:", v11, v16);
        CFRelease(v17);
      }
    }
  }

  return v14;
}

+ (void)_copyNotificationWithExternalID:(id)a3 inCalendar:(void *)a4 withDatabase:(CalDatabase *)a5 recordIDMap:(id)a6
{
  __CFString *v9;
  const void *v10;
  void *v11;

  v9 = (__CFString *)a3;
  v10 = (const void *)objc_msgSend(a6, "recordIDForExternalIdentifier:", v9);
  if (v10)
  {
    v11 = (void *)CalDatabaseCopyEntityWithRecordID((uint64_t)a5, v10);
    if (!a4)
      goto LABEL_7;
  }
  else
  {
    v11 = 0;
    if (!a4)
      goto LABEL_7;
  }
  if (!v11)
    v11 = (void *)CalDatabaseCopyNotificationWithExternalIDInCalendarOrStore((os_unfair_lock_s *)a5, -1, v9, (uint64_t)a4, 0);
LABEL_7:

  return v11;
}

+ (void)setURL:(id)a3 forResourceWithUUID:(id)a4 withDatabase:(CalDatabase *)a5 notificationCalendar:(void *)a6 notificationCalendarURL:(id)a7 recordIDMap:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  const void *v19;
  void *v20;
  const void *v21;
  const void *v22;
  NSObject *v23;
  int v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a7;
  v17 = a8;
  if (v14)
  {
    v18 = objc_msgSend(a1, "_copyNotificationWithUniqueIdentifier:inCalendar:orStore:withDatabase:recordIDMap:", v15, a6, 0, a5, v17);
    if (v18)
    {
      v19 = (const void *)v18;
      objc_msgSend(v14, "calDAV_leastInfoStringRepresentationRelativeToParentURL:", v16);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      CalNotificationSetExternalID((uint64_t)v19);
      v21 = CalEntityCopyRecordID(v19);
      if (v21)
      {
        v22 = v21;
        objc_msgSend(v17, "setExternalIdentifier:forRecordID:", v20, v21);
        CFRelease(v22);
      }
      CFRelease(v19);

    }
    else
    {
      v23 = CDBLogHandle;
      if (os_log_type_enabled((os_log_t)CDBLogHandle, (os_log_type_t)4u))
      {
        v24 = 138412290;
        v25 = v15;
        _os_log_impl(&dword_1A5CCB000, v23, (os_log_type_t)4u, "Couldn't set url for the event %@ because it doesn't exist in our database", (uint8_t *)&v24, 0xCu);
      }
    }
  }

}

@end
