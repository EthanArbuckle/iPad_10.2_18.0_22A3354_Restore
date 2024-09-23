@implementation EKiMIPHandler

- (EKiMIPHandler)initWithEvent:(id)a3
{
  id v5;
  EKiMIPHandler *v6;
  EKiMIPHandler *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EKiMIPHandler;
  v6 = -[EKiMIPHandler init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_event, a3);

  return v7;
}

- (id)attachmentData
{
  void *v2;
  void *v3;

  -[EKiMIPHandler iCalendarDocumentWithMethod:](self, "iCalendarDocumentWithMethod:", -[EKiMIPHandler icsMethod](self, "icsMethod"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ICSDataWithOptions:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)sendEmail
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  -[EKiMIPHandler attendees](self, "attendees");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKiMIPHandler emailsFromAttendees:](EKiMIPHandler, "emailsFromAttendees:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    -[EKiMIPHandler emailSubject](self, "emailSubject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v6 = EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
        -[EKiMIPHandler sendEmail].cold.2((uint64_t)self, v6, v7, v8, v9, v10, v11, v12);
    }

  }
  else
  {
    v13 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      -[EKiMIPHandler sendEmail].cold.1((uint64_t)self, v13, v14, v15, v16, v17, v18, v19);
  }

  return 0;
}

+ (id)emailsFromAttendees:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "emailAddress", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v10, "emailAddress");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v12);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)iCalendarDocumentWithMethod:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *j;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t i;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v68;
  id v69;
  void *v70;
  uint64_t v71;
  int v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  id v92;
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;

  v3 = *(_QWORD *)&a3;
  v96 = *MEMORY[0x1E0C80C00];
  -[EKiMIPHandler event](self, "event");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "exportToICS");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D0C298], "defaultProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = 0;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDB820]), "initWithData:options:error:", v5, 0, &v92);
  v8 = v92;
  v9 = v8;
  if (v7)
    v10 = v8 == 0;
  else
    v10 = 0;
  if (v10)
  {
    v69 = v8;
    v70 = v5;
    objc_msgSend(v7, "calendar");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setMethod:", v3);

    objc_msgSend(v7, "calendar");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setX_calendarserver_access:", 0);

    v90 = 0u;
    v91 = 0u;
    v88 = 0u;
    v89 = 0u;
    v68 = v7;
    objc_msgSend(v7, "calendar");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "components");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v88, v95, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v89;
      v73 = v6;
      v72 = v3;
      v78 = v22;
      v71 = *(_QWORD *)v89;
      do
      {
        v26 = 0;
        v79 = v24;
        do
        {
          if (*(_QWORD *)v89 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * v26);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v28 = v27;
            v29 = v28;
            switch((_DWORD)v3)
            {
              case 2:
                objc_msgSend(v28, "organizer");
                v59 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v59)
                {
                  v60 = v29;
                  v61 = (void *)MEMORY[0x1E0C99E98];
                  objc_msgSend(v6, "myEmailAddress");
                  v62 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v61, "URLForMail:", v62);
                  v63 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v63)
                  {
                    v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDB888]), "initWithURL:", v63);
                    objc_msgSend(v60, "setOrganizer:", v64);

                    objc_msgSend(v6, "myShortDisplayName");
                    v65 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v60, "organizer");
                    v66 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v66, "setCn:", v65);

                    v24 = v79;
                  }

                  v29 = v60;
                }
                break;
              case 5:
                objc_msgSend(v28, "organizer");
                v44 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v44)
                {
                  v45 = v29;
                  v46 = (void *)MEMORY[0x1E0C99E98];
                  objc_msgSend(v6, "myEmailAddress");
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v46, "URLForMail:", v47);
                  v48 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v48)
                  {
                    v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDB888]), "initWithURL:", v48);
                    objc_msgSend(v45, "setOrganizer:", v49);

                    objc_msgSend(v6, "myShortDisplayName");
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v45, "organizer");
                    v51 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v51, "setCn:", v50);

                  }
                  v29 = v45;
                }
                v52 = v6;
                v82 = 0u;
                v83 = 0u;
                v80 = 0u;
                v81 = 0u;
                v53 = v29;
                objc_msgSend(v29, "attendee");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v80, v93, 16);
                if (v55)
                {
                  v56 = v55;
                  v57 = *(_QWORD *)v81;
                  do
                  {
                    for (i = 0; i != v56; ++i)
                    {
                      if (*(_QWORD *)v81 != v57)
                        objc_enumerationMutation(v54);
                      objc_msgSend(*(id *)(*((_QWORD *)&v80 + 1) + 8 * i), "setRsvp:", 0);
                    }
                    v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v80, v93, 16);
                  }
                  while (v56);
                }

                v29 = v53;
                objc_msgSend(v53, "setSequence:", objc_msgSend(v53, "sequence") + 1);
                objc_msgSend(v53, "setStatus:", 8);
                objc_msgSend(v53, "setX_wr_rsvpneeded:", 0);
                v6 = v52;
                v22 = v78;
                v24 = v79;
                break;
              case 3:
                objc_msgSend(MEMORY[0x1E0C99D48], "CalGregorianGMTCalendar");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("UTC"));
                v31 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99D68], "date");
                v32 = v29;
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                v76 = v30;
                objc_msgSend(v30, "components:fromDate:", 252, v33);
                v34 = (void *)objc_claimAutoreleasedReturnValue();

                v75 = (void *)v31;
                v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDB800]), "initWithYear:month:day:hour:minute:second:timeZone:", objc_msgSend(v34, "year"), objc_msgSend(v34, "month"), objc_msgSend(v34, "day"), objc_msgSend(v34, "hour"), objc_msgSend(v34, "minute"), objc_msgSend(v34, "second"), v31);
                objc_msgSend(v32, "setDtstamp:", v35);
                v86 = 0u;
                v87 = 0u;
                v84 = 0u;
                v85 = 0u;
                v77 = v32;
                objc_msgSend(v32, "attendee");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v37 = (void *)objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v84, v94, 16);
                if (v37)
                {
                  v74 = v35;
                  v38 = *(_QWORD *)v85;
                  while (2)
                  {
                    for (j = 0; j != v37; j = (char *)j + 1)
                    {
                      if (*(_QWORD *)v85 != v38)
                        objc_enumerationMutation(v36);
                      v40 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * (_QWORD)j);
                      objc_msgSend(MEMORY[0x1E0D0C298], "defaultProvider");
                      v41 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v40, "value");
                      v42 = (void *)objc_claimAutoreleasedReturnValue();
                      v43 = objc_msgSend(v41, "urlMatchesOneOfMyEmails:", v42);

                      if (v43)
                      {
                        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v40);
                        v37 = (void *)objc_claimAutoreleasedReturnValue();
                        goto LABEL_43;
                      }
                    }
                    v37 = (void *)objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v84, v94, 16);
                    if (v37)
                      continue;
                    break;
                  }
LABEL_43:
                  v6 = v73;
                  v35 = v74;
                }
                else
                {
                  v6 = v73;
                }

                objc_msgSend(v77, "setAttendee:", v37);
                v29 = v77;

                LODWORD(v3) = v72;
                v22 = v78;
                v24 = v79;
                v25 = v71;
                break;
            }

          }
          ++v26;
        }
        while (v26 != v24);
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v88, v95, 16);
      }
      while (v24);
    }

    v7 = v68;
    v18 = v68;
    v9 = v69;
    v5 = v70;
  }
  else
  {
    v11 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      -[EKiMIPHandler iCalendarDocumentWithMethod:].cold.1((uint64_t)v9, v11, v12, v13, v14, v15, v16, v17);
    v18 = 0;
  }

  return v18;
}

- (EKEvent)event
{
  return (EKEvent *)objc_getProperty(self, a2, 8, 1);
}

- (void)setEvent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
}

+ (BOOL)shouldSendEmailForEvent:(id)a3 withDiff:(id)a4
{
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_2_0();
  return 0;
}

- (id)attendees
{
  id result;

  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_6();
  return result;
}

- (id)emailSubject
{
  id result;

  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_6();
  return result;
}

- (id)emailBody
{
  id result;

  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_6();
  return result;
}

- (id)emailAttachmentName
{
  id result;

  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_6();
  return result;
}

- (int)icsMethod
{
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_2_0();
  return 0;
}

- (void)sendEmail
{
  OUTLINED_FUNCTION_7(&dword_1A2318000, a2, a3, "Missing Subject, (invalid part-stat?) can't send iMIP event: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)iCalendarDocumentWithMethod:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_1A2318000, a2, a3, "Could not parse ICSDocument from data: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
