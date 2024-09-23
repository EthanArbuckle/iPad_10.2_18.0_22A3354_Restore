@implementation CalDAVFreeBusyLookupTask

- (CalDAVFreeBusyLookupTask)initWithOrganizer:(id)a3 originator:(id)a4 attendees:(id)a5 start:(id)a6 end:(id)a7 outboxURL:(id)a8 maskedUID:(id)a9
{
  uint64_t v10;

  LOBYTE(v10) = 1;
  return -[CalDAVFreeBusyLookupTask initWithOrganizer:originator:attendees:start:end:outboxURL:maskedUID:extendedFreeBusy:prodID:](self, "initWithOrganizer:originator:attendees:start:end:outboxURL:maskedUID:extendedFreeBusy:prodID:", a3, a4, a5, a6, a7, a8, a9, v10, 0);
}

- (CalDAVFreeBusyLookupTask)initWithOrganizer:(id)a3 originator:(id)a4 attendees:(id)a5 start:(id)a6 end:(id)a7 outboxURL:(id)a8 maskedUID:(id)a9 extendedFreeBusy:(BOOL)a10 prodID:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  CalDAVFreeBusyLookupTask *v22;
  objc_super v26;

  v16 = a9;
  v17 = a8;
  v18 = a5;
  v19 = a4;
  +[CalDAVFreeBusyLookupTask _freeBusyDocumentWithOrganizer:attendees:start:end:maskedUID:extendedFreeBusy:prodID:](CalDAVFreeBusyLookupTask, "_freeBusyDocumentWithOrganizer:attendees:start:end:maskedUID:extendedFreeBusy:prodID:", a3, v18, a6, a7, v16, a10, a11);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "ICSDataWithOptions:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26.receiver = self;
  v26.super_class = (Class)CalDAVFreeBusyLookupTask;
  v22 = -[CalDAVScheduleTask initWithOriginator:attendees:outboxURL:payload:](&v26, sel_initWithOriginator_attendees_outboxURL_payload_, v19, v18, v17, v21);

  if (v22)
    -[CalDAVFreeBusyLookupTask setMaskedUID:](v22, "setMaskedUID:", v16);

  return v22;
}

+ (id)_freeBusyDocumentWithOrganizer:(id)a3 attendees:(id)a4 start:(id)a5 end:(id)a6 maskedUID:(id)a7 extendedFreeBusy:(BOOL)a8 prodID:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  _BOOL4 v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v36 = a8;
  v49 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v38 = a7;
  v18 = a9;
  v19 = objc_alloc(MEMORY[0x24BDBCE48]);
  v20 = (void *)objc_msgSend(v19, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA18]);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_icsDate:calendar:", v21, v20);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = v16;
  objc_msgSend(a1, "_icsDate:calendar:", v16, v20);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v17;
  objc_msgSend(a1, "_icsDate:calendar:", v17, v20);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v14;
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC6FF8]), "initWithEmailAddress:", v14);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v24 = v15;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v45 != v27)
          objc_enumerationMutation(v24);
        v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC6FF8]), "initWithEmailAddress:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i));
        objc_msgSend(v23, "addObject:", v29);

      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    }
    while (v26);
  }

  v30 = objc_alloc_init(MEMORY[0x24BEC6FD0]);
  objc_msgSend(v30, "setAttendee:", v23);
  objc_msgSend(v30, "setDtend:", v42);
  objc_msgSend(v30, "setDtstamp:", v37);
  objc_msgSend(v30, "setDtstart:", v43);
  objc_msgSend(v30, "setOrganizer:", v22);
  objc_msgSend(MEMORY[0x24BEC6F90], "makeUID");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setUid:", v31);

  objc_msgSend(v30, "setX_calendarserver_mask_uid:", v38);
  if (v36)
    objc_msgSend(v30, "setX_calendarserver_extended_freebusy:", CFSTR("T"));
  v32 = objc_alloc_init(MEMORY[0x24BEC6F80]);
  objc_msgSend(v32, "setMethod:", 2);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v30);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setComponents:options:", v33, 0);

  if (v18 && objc_msgSend(v18, "length"))
    objc_msgSend(v32, "setProdid:", v18);
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC6FB8]), "initWithCalendar:", v32);

  return v34;
}

+ (id)_icsDate:(id)a3 calendar:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x24BDBCF38];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "timeZoneWithName:", CFSTR("UTC"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTimeZone:", v8);
  objc_msgSend(v6, "components:fromDate:", 252, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC6F98]), "initWithYear:month:day:hour:minute:second:timeZone:", objc_msgSend(v9, "year"), objc_msgSend(v9, "month"), objc_msgSend(v9, "day"), objc_msgSend(v9, "hour"), objc_msgSend(v9, "minute"), objc_msgSend(v9, "second"), v8);
  return v10;
}

- (NSString)maskedUID
{
  return self->_maskedUID;
}

- (void)setMaskedUID:(id)a3
{
  objc_storeStrong((id *)&self->_maskedUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maskedUID, 0);
}

@end
