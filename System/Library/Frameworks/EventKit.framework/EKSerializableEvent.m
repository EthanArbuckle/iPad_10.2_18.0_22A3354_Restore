@implementation EKSerializableEvent

+ (id)serializedProperties
{
  _QWORD v3[11];

  v3[10] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("startDate");
  v3[1] = CFSTR("endDate");
  v3[2] = CFSTR("isAllDay");
  v3[3] = CFSTR("title");
  v3[4] = CFSTR("notes");
  v3[5] = CFSTR("URL");
  v3[6] = CFSTR("location");
  v3[7] = CFSTR("travelTime");
  v3[8] = CFSTR("calendar.calendarIdentifier");
  v3[9] = CFSTR("timeZone");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 10);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)classesForKey
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[2];
  uint64_t v27;
  _QWORD v28[2];
  _QWORD v29[2];
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[17];
  _QWORD v39[19];

  v39[17] = *MEMORY[0x1E0C80C00];
  v38[0] = CFSTR("startDate");
  v37 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v20;
  v38[1] = CFSTR("endDate");
  v36 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v19;
  v38[2] = CFSTR("isAllDay");
  v35 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v39[2] = v18;
  v38[3] = CFSTR("title");
  v34 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v39[3] = v17;
  v38[4] = CFSTR("notes");
  v33 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v39[4] = v16;
  v38[5] = CFSTR("url");
  v32 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v39[5] = v15;
  v38[6] = CFSTR("travelTime");
  v31 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v39[6] = v14;
  v38[7] = CFSTR("location");
  v30 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v39[7] = v13;
  v38[8] = CFSTR("structuredLocation");
  v29[0] = objc_opt_class();
  v29[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v39[8] = v2;
  v38[9] = CFSTR("attendees");
  v28[0] = objc_opt_class();
  v28[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v39[9] = v3;
  v38[10] = CFSTR("selfAttendee");
  v27 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v39[10] = v4;
  v38[11] = CFSTR("attachments");
  v26[0] = objc_opt_class();
  v26[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v39[11] = v5;
  v38[12] = CFSTR("alarms");
  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v39[12] = v6;
  v38[13] = CFSTR("recurrenceRules");
  v24[0] = objc_opt_class();
  v24[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v39[13] = v7;
  v38[14] = CFSTR("calendarIdentifier");
  v23 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v39[14] = v8;
  v38[15] = CFSTR("timeZone");
  v22 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v39[15] = v9;
  v38[16] = CFSTR("isNew");
  v21 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v39[16] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (EKSerializableEvent)initWithEvent:(id)a3
{
  id v4;
  EKSerializableEvent *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  EKSerializableStructuredLocation *v17;
  void *v18;
  EKSerializableStructuredLocation *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)EKSerializableEvent;
  v5 = -[EKSerializableEvent init](&v28, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKSerializableEvent setStartDate:](v5, "setStartDate:", v6);

    objc_msgSend(v4, "endDateUnadjustedForLegacyClients");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKSerializableEvent setEndDate:](v5, "setEndDate:", v7);

    -[EKSerializableEvent setIsAllDay:](v5, "setIsAllDay:", objc_msgSend(v4, "isAllDay"));
    objc_msgSend(v4, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKSerializableEvent setTitle:](v5, "setTitle:", v8);

    objc_msgSend(v4, "notes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKSerializableEvent setNotes:](v5, "setNotes:", v9);

    objc_msgSend(v4, "URL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKSerializableEvent setUrl:](v5, "setUrl:", v10);

    objc_msgSend(v4, "travelTime");
    -[EKSerializableEvent setTravelTime:](v5, "setTravelTime:");
    objc_msgSend(v4, "location");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKSerializableEvent setLocation:](v5, "setLocation:", v11);

    objc_msgSend(v4, "timeZone");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKSerializableEvent setTimeZone:](v5, "setTimeZone:", v12);

    v13 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "objectID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "numberWithBool:", objc_msgSend(v14, "isTemporary"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKSerializableEvent setIsNew:](v5, "setIsNew:", v15);

    objc_msgSend(v4, "structuredLocation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = [EKSerializableStructuredLocation alloc];
      objc_msgSend(v4, "structuredLocation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[EKSerializableStructuredLocation initWithStructuredLocation:](v17, "initWithStructuredLocation:", v18);
      -[EKSerializableEvent setStructuredLocation:](v5, "setStructuredLocation:", v19);

    }
    objc_msgSend(v4, "calendar");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "calendarIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKSerializableEvent setCalendarIdentifier:](v5, "setCalendarIdentifier:", v21);

    objc_msgSend(v4, "allAlarms");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKSerializableEvent _initAlarms:](v5, "_initAlarms:", v22);

    objc_msgSend(v4, "attachments");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKSerializableEvent _initAttachments:](v5, "_initAttachments:", v23);

    objc_msgSend(v4, "attendees");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "selfAttendee");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKSerializableEvent _initAttendees:selfAttendee:](v5, "_initAttendees:selfAttendee:", v24, v25);

    objc_msgSend(v4, "singleRecurrenceRule");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKSerializableEvent _initRecurrenceRule:](v5, "_initRecurrenceRule:", v26);

  }
  return v5;
}

- (void)_initAttendees:(id)a3 selfAttendee:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  EKSerializableParticipant *v15;
  EKSerializableParticipant *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(id *)(*((_QWORD *)&v18 + 1) + 8 * v13);
        v15 = [EKSerializableParticipant alloc];
        v16 = -[EKSerializableParticipant initWithParticipant:](v15, "initWithParticipant:", v14, (_QWORD)v18);
        objc_msgSend(v8, "addObject:", v16);
        if (v14 == v7)
          -[EKSerializableEvent setSelfAttendee:](self, "setSelfAttendee:", v16);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  v17 = (void *)objc_msgSend(v8, "copy");
  -[EKSerializableEvent setAttendees:](self, "setAttendees:", v17);

}

- (void)_initAlarms:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  EKSerializableAlarm *v12;
  EKSerializableAlarm *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
        v12 = [EKSerializableAlarm alloc];
        v13 = -[EKSerializableAlarm initWithAlarm:](v12, "initWithAlarm:", v11, (_QWORD)v15);
        objc_msgSend(v5, "addObject:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  v14 = (void *)objc_msgSend(v5, "copy");
  -[EKSerializableEvent setAlarms:](self, "setAlarms:", v14);

}

- (void)_initAttachments:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  EKSerializableAttachment *v12;
  EKSerializableAttachment *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
        v12 = [EKSerializableAttachment alloc];
        v13 = -[EKSerializableAttachment initWithAttachment:](v12, "initWithAttachment:", v11, (_QWORD)v15);
        objc_msgSend(v5, "addObject:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  v14 = (void *)objc_msgSend(v5, "copy");
  -[EKSerializableEvent setAttachments:](self, "setAttachments:", v14);

}

- (void)_initRecurrenceRule:(id)a3
{
  id v4;
  EKSerializableRecurrenceRule *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[EKSerializableRecurrenceRule initWithRecurrenceRule:]([EKSerializableRecurrenceRule alloc], "initWithRecurrenceRule:", v4);

  v7[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKSerializableEvent setRecurrenceRules:](self, "setRecurrenceRules:", v6);

}

- (id)createEventInEventStore:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  EKSerializableEvent *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  char v37;
  id v38;
  NSObject *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t k;
  void *v46;
  void *v47;
  id v48;
  NSObject *v49;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  uint8_t v71[128];
  uint8_t buf[4];
  id v73;
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[EKEvent eventWithEventStore:](EKEvent, "eventWithEventStore:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKSerializableEvent timeZone](self, "timeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimeZone:", v6);

  -[EKSerializableEvent startDate](self, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStartDate:", v7);

  objc_msgSend(v5, "setAllDay:", -[EKSerializableEvent isAllDay](self, "isAllDay"));
  -[EKSerializableEvent endDate](self, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEndDateUnadjustedForLegacyClients:", v8);

  -[EKSerializableEvent title](self, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v9);

  -[EKSerializableEvent notes](self, "notes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNotes:", v10);

  -[EKSerializableEvent url](self, "url");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setURL:", v11);

  -[EKSerializableEvent travelTime](self, "travelTime");
  objc_msgSend(v5, "setTravelTime:");
  -[EKSerializableEvent location](self, "location");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLocation:", v12);

  -[EKSerializableEvent structuredLocation](self, "structuredLocation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "createStructuredLocation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStructuredLocation:", v14);

  -[EKSerializableEvent calendarIdentifier](self, "calendarIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v4;
  objc_msgSend(v4, "calendarWithIdentifier:", v15);
  v16 = objc_claimAutoreleasedReturnValue();

  v52 = (void *)v16;
  objc_msgSend(v5, "setCalendar:", v16);
  objc_msgSend(v5, "setAlarms:", MEMORY[0x1E0C9AA60]);
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v17 = self;
  -[EKSerializableEvent alarms](self, "alarms");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v67;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v67 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
        v65 = 0;
        objc_msgSend(v23, "createAlarm:", &v65);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v65;
        if (v24)
        {
          objc_msgSend(v5, "addAlarm:", v24);
        }
        else
        {
          v26 = EKLogHandle;
          if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v73 = v25;
            _os_log_error_impl(&dword_1A2318000, v26, OS_LOG_TYPE_ERROR, "Error creating alarm: [%@]", buf, 0xCu);
          }
        }

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
    }
    while (v20);
  }

  v64 = 0u;
  v62 = 0u;
  v63 = 0u;
  v61 = 0u;
  -[EKSerializableEvent attendees](v17, "attendees");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
  if (!v28)
  {
    v40 = 0;
    goto LABEL_29;
  }
  v29 = v28;
  v53 = 0;
  v30 = *(_QWORD *)v62;
  do
  {
    for (j = 0; j != v29; ++j)
    {
      if (*(_QWORD *)v62 != v30)
        objc_enumerationMutation(v27);
      v32 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * j);
      v60 = 0;
      objc_msgSend(v32, "createAttendee:", &v60);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v60;
      if (v33)
      {
        objc_msgSend(v5, "addAttendee:", v33);
        -[EKSerializableEvent selfAttendee](v17, "selfAttendee");
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (v32 == v35)
        {
          objc_msgSend(v52, "ownerIdentityOrganizer");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v33, "isEqualToParticipant:", v36);

          if ((v37 & 1) == 0)
          {
            v38 = v33;

            v53 = v38;
          }
          objc_msgSend(v5, "setSelfAttendee:", v33);
        }
      }
      else
      {
        v39 = EKLogHandle;
        if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v73 = v34;
          _os_log_error_impl(&dword_1A2318000, v39, OS_LOG_TYPE_ERROR, "Error creating attendee: [%@]", buf, 0xCu);
        }
      }

    }
    v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
  }
  while (v29);

  v40 = v53;
  if (v53)
  {
    objc_msgSend(v5, "removeAttendee:", v53);
    objc_msgSend(v5, "addOrganizerAndSelfAttendeeForNewInvitation");
    objc_msgSend(v5, "selfAttendee");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setParticipantStatus:", objc_msgSend(v53, "participantStatus"));
LABEL_29:
    v54 = v40;

    goto LABEL_31;
  }
  v54 = 0;
LABEL_31:
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  -[EKSerializableEvent recurrenceRules](v17, "recurrenceRules");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v56, v70, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v57;
    do
    {
      for (k = 0; k != v43; ++k)
      {
        if (*(_QWORD *)v57 != v44)
          objc_enumerationMutation(v41);
        v46 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * k);
        v55 = 0;
        objc_msgSend(v46, "createRecurrenceRule:", &v55);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = v55;
        if (v47)
        {
          objc_msgSend(v5, "addRecurrenceRule:", v47);
        }
        else
        {
          v49 = EKLogHandle;
          if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v73 = v48;
            _os_log_error_impl(&dword_1A2318000, v49, OS_LOG_TYPE_ERROR, "Error creating recurrence rule: [%@]", buf, 0xCu);
          }
        }

      }
      v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v56, v70, 16);
    }
    while (v43);
  }

  return v5;
}

- (NSNumber)isNew
{
  return self->_isNew;
}

- (void)setIsNew:(id)a3
{
  objc_storeStrong((id *)&self->_isNew, a3);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)isAllDay
{
  return self->_isAllDay;
}

- (void)setIsAllDay:(BOOL)a3
{
  self->_isAllDay = a3;
}

- (double)travelTime
{
  return self->_travelTime;
}

- (void)setTravelTime:(double)a3
{
  self->_travelTime = a3;
}

- (NSArray)recurrenceRules
{
  return self->_recurrenceRules;
}

- (void)setRecurrenceRules:(id)a3
{
  objc_storeStrong((id *)&self->_recurrenceRules, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)notes
{
  return self->_notes;
}

- (void)setNotes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (NSString)calendarIdentifier
{
  return self->_calendarIdentifier;
}

- (void)setCalendarIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (EKSerializableStructuredLocation)structuredLocation
{
  return self->_structuredLocation;
}

- (void)setStructuredLocation:(id)a3
{
  objc_storeStrong((id *)&self->_structuredLocation, a3);
}

- (NSArray)attendees
{
  return self->_attendees;
}

- (void)setAttendees:(id)a3
{
  objc_storeStrong((id *)&self->_attendees, a3);
}

- (EKSerializableParticipant)selfAttendee
{
  return self->_selfAttendee;
}

- (void)setSelfAttendee:(id)a3
{
  objc_storeStrong((id *)&self->_selfAttendee, a3);
}

- (NSArray)alarms
{
  return self->_alarms;
}

- (void)setAlarms:(id)a3
{
  objc_storeStrong((id *)&self->_alarms, a3);
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
{
  objc_storeStrong((id *)&self->_attachments, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_alarms, 0);
  objc_storeStrong((id *)&self->_selfAttendee, 0);
  objc_storeStrong((id *)&self->_attendees, 0);
  objc_storeStrong((id *)&self->_structuredLocation, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_calendarIdentifier, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_recurrenceRules, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_isNew, 0);
}

@end
