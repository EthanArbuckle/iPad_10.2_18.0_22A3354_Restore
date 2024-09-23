@implementation WFVCalendarFormatter

+ (id)ICSFromCalendarItems:(id)a3
{
  void *v3;
  void *v4;
  void (**v5)(void *, const __CFString *, const __CFString *);
  void *v6;
  __CFString *v7;
  __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  __CFString *v16;
  __CFString *v17;
  char isKindOfClass;
  __CFString *v19;
  void *v20;
  __CFString *v21;
  __CFString *v22;
  void *v23;
  __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  __CFString *v36;
  void *v37;
  void *v38;
  __CFString *v39;
  void *v40;
  __CFString *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t k;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t m;
  void *v52;
  void *v53;
  void *v54;
  __CFString *v55;
  void *v56;
  void *v57;
  double v58;
  double v59;
  __CFString *v60;
  uint64_t v61;
  int v62;
  int v63;
  unsigned int v64;
  int v65;
  uint64_t v66;
  unint64_t v67;
  unsigned int v68;
  _BOOL4 v69;
  void *v70;
  id v71;
  id v72;
  __CFString *v73;
  __CFString *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  __CFString *v88;
  void *v89;
  void *v90;
  void *v91;
  __CFString *v92;
  void *v93;
  void *v94;
  __CFString *v95;
  __CFString *v96;
  void *v97;
  void *v98;
  BOOL v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  unint64_t v107;
  uint64_t v108;
  const __CFString *v109;
  id v110;
  id v112;
  uint64_t v113;
  id obj;
  uint64_t v115;
  uint64_t v116;
  __CFString *v117;
  uint64_t j;
  void *v119;
  id v120;
  id v121;
  id v122;
  id v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  _QWORD v141[4];
  id v142;
  _QWORD aBlock[4];
  id v144;
  id v145;
  _QWORD v146[5];
  uint64_t v147;
  uint64_t *v148;
  uint64_t v149;
  uint64_t v150;
  _BYTE v151[128];
  _BYTE v152[128];
  _BYTE v153[128];
  _BYTE v154[128];
  uint64_t v155;

  v155 = *MEMORY[0x24BDAC8D0];
  v121 = a3;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__WFVCalendarFormatter_ICSFromCalendarItems___block_invoke;
  aBlock[3] = &unk_24C4DE9B8;
  v145 = a1;
  v112 = v3;
  v144 = v112;
  v4 = _Block_copy(aBlock);
  v141[0] = MEMORY[0x24BDAC760];
  v141[1] = 3221225472;
  v141[2] = __45__WFVCalendarFormatter_ICSFromCalendarItems___block_invoke_2;
  v141[3] = &unk_24C4DE9E0;
  v124 = v4;
  v142 = v124;
  v5 = (void (**)(void *, const __CFString *, const __CFString *))_Block_copy(v141);
  v5[2](v5, CFSTR("BEGIN"), CFSTR("VCALENDAR"));
  v5[2](v5, CFSTR("VERSION"), CFSTR("2.0"));
  if (objc_msgSend(v121, "count"))
  {
    objc_msgSend(v121, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "calendar");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v139 = 0u;
    v140 = 0u;
    v137 = 0u;
    v138 = 0u;
    v8 = (__CFString *)v121;
    v9 = -[__CFString countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v137, v154, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v138;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v138 != v10)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v137 + 1) + 8 * i), "calendar");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "calendarIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString calendarIdentifier](v7, "calendarIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v13, "isEqualToString:", v14);

          if (!v15)
          {
            v17 = v7;
            v7 = v8;
            goto LABEL_13;
          }
        }
        v9 = -[__CFString countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v137, v154, 16);
        if (v9)
          continue;
        break;
      }
    }

    if (v7)
    {
      -[__CFString title](v7, "title");
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v5[2](v5, CFSTR("X-WR-CALNAME"), v16);

      objc_msgSend(a1, "hexColorFromCGColor:", -[__CFString CGColor](v7, "CGColor"));
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v5[2](v5, CFSTR("X-APPLE-CALENDAR-COLOR"), v17);
LABEL_13:

    }
  }
  v135 = 0u;
  v136 = 0u;
  v133 = 0u;
  v134 = 0u;
  obj = v121;
  v116 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v133, v153, 16);
  if (v116)
  {
    v115 = *(_QWORD *)v134;
    v113 = *MEMORY[0x24BDBCA18];
    do
    {
      for (j = 0; j != v116; ++j)
      {
        if (*(_QWORD *)v134 != v115)
          objc_enumerationMutation(obj);
        v119 = *(void **)(*((_QWORD *)&v133 + 1) + 8 * j);
        getEKReminderClass();
        isKindOfClass = objc_opt_isKindOfClass();
        v19 = CFSTR("VEVENT");
        if ((isKindOfClass & 1) != 0)
          v19 = CFSTR("VTODO");
        v117 = v19;
        ((void (*)(void (**)(void *, const __CFString *, const __CFString *), const __CFString *))v5[2])(v5, CFSTR("BEGIN"));
        objc_msgSend(v119, "title");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          objc_msgSend(v119, "title");
          v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v5[2](v5, CFSTR("SUMMARY"), v21);

        }
        if (objc_msgSend(v119, "hasNotes"))
        {
          objc_msgSend(v119, "notes");
          v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v5[2](v5, CFSTR("DESCRIPTION"), v22);

        }
        objc_msgSend(v119, "location");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          objc_msgSend(v119, "location");
          v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v5[2](v5, CFSTR("LOCATION"), v24);

        }
        objc_msgSend(v119, "URL");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          v26 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v119, "URL");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "absoluteString");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "stringWithFormat:", CFSTR("URL;VALUE=URI:%@"), v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(id, void *))v124 + 2))(v124, v29);

        }
        objc_msgSend(v119, "calendarItemExternalIdentifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30)
        {
          objc_msgSend(v119, "calendarItemExternalIdentifier");
          v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v5[2](v5, CFSTR("UID"), v31);

        }
        v122 = objc_alloc_init(MEMORY[0x24BDD1500]);
        objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v122, "setLocale:", v32);

        objc_msgSend(v122, "setDateFormat:", CFSTR("yyyyMMdd'T'HHmmss'Z'"));
        objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneWithName:", CFSTR("UTC"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v122, "setTimeZone:", v33);

        objc_msgSend(v119, "creationDate");
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (v34)
        {
          objc_msgSend(v119, "creationDate");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v122, "stringFromDate:", v35);
          v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v5[2](v5, CFSTR("CREATED"), v36);

        }
        objc_msgSend(v119, "lastModifiedDate");
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (v37)
        {
          objc_msgSend(v119, "lastModifiedDate");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v122, "stringFromDate:", v38);
          v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v5[2](v5, CFSTR("LAST-MODIFIED"), v39);

        }
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v122, "stringFromDate:", v40);
        v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v5[2](v5, CFSTR("DTSTAMP"), v41);

        if (objc_msgSend(v119, "hasAttendees"))
        {
          v131 = 0u;
          v132 = 0u;
          v129 = 0u;
          v130 = 0u;
          objc_msgSend(v119, "attendees");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v129, v152, 16);
          if (v43)
          {
            v44 = *(_QWORD *)v130;
            do
            {
              for (k = 0; k != v43; ++k)
              {
                if (*(_QWORD *)v130 != v44)
                  objc_enumerationMutation(v42);
                v46 = (void *)MEMORY[0x24BDD17C8];
                objc_msgSend(a1, "stringRepresentationOfParticipant:", *(_QWORD *)(*((_QWORD *)&v129 + 1) + 8 * k));
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v46, "stringWithFormat:", CFSTR("ATTENDEE%@"), v47);
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                (*((void (**)(id, void *))v124 + 2))(v124, v48);

              }
              v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v129, v152, 16);
            }
            while (v43);
          }

        }
        if (objc_msgSend(v119, "hasAlarms"))
        {
          v127 = 0u;
          v128 = 0u;
          v125 = 0u;
          v126 = 0u;
          objc_msgSend(v119, "alarms");
          v120 = (id)objc_claimAutoreleasedReturnValue();
          v49 = objc_msgSend(v120, "countByEnumeratingWithState:objects:count:", &v125, v151, 16);
          if (v49)
          {
            v50 = *(_QWORD *)v126;
            do
            {
              for (m = 0; m != v49; ++m)
              {
                if (*(_QWORD *)v126 != v50)
                  objc_enumerationMutation(v120);
                v52 = *(void **)(*((_QWORD *)&v125 + 1) + 8 * m);
                v5[2](v5, CFSTR("BEGIN"), CFSTR("VALARM"));
                v5[2](v5, CFSTR("ACTION"), CFSTR("DISPLAY"));
                v5[2](v5, CFSTR("DESCRIPTION"), CFSTR("Reminder"));
                objc_msgSend(v52, "absoluteDate");
                v53 = (void *)objc_claimAutoreleasedReturnValue();

                if (v53)
                {
                  v54 = (void *)MEMORY[0x24BDD17C8];
                  objc_msgSend(v52, "absoluteDate");
                  v55 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v122, "stringFromDate:", v55);
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v54, "stringWithFormat:", CFSTR("TRIGGER;VALUE=DATE-TIME:%@"), v56);
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  (*((void (**)(id, void *))v124 + 2))(v124, v57);

                }
                else
                {
                  objc_msgSend(v52, "relativeOffset");
                  v59 = v58;
                  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", CFSTR("-P"));
                  v60 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  v55 = v60;
                  v61 = (uint64_t)-v59;
                  if ((unint64_t)(v61 + 86399) >= 0x2A2FF)
                    -[__CFString appendFormat:](v60, "appendFormat:", CFSTR("%ldD"), v61 / 86400);
                  v62 = v61 % 86400 / 3600;
                  v63 = v61 % 86400 % 3600;
                  v64 = (v63 + ((-30583 * (__int16)v63) >> 16)) & 0x8000;
                  v65 = ((__int16)((34953 * (__int16)v63) >> 16) >> 5) + (v64 >> 15);
                  v66 = (__int16)(v63 - 60
                                      * (((__int16)((34953 * (__int16)v63) >> 16) >> 5) + (v64 >> 15)));
                  v67 = v61 % 86400 - 3600;
                  v68 = v63 - 60;
                  if (v67 < 0xFFFFFFFFFFFFE3E1
                    || v68 < 0xFFFFFF89
                    || (_WORD)v63 != 60
                                   * (((__int16)((34953 * (__int16)v63) >> 16) >> 5)
                                    + (unsigned __int16)(v64 >> 15)))
                  {
                    v69 = v67 < 0xFFFFFFFFFFFFE3E1;
                    -[__CFString appendString:](v55, "appendString:", CFSTR("T"));
                    if (v69)
                      -[__CFString appendFormat:](v55, "appendFormat:", CFSTR("%ldH"), v62);
                    if (v68 <= 0xFFFFFF88)
                      -[__CFString appendFormat:](v55, "appendFormat:", CFSTR("%ldM"), v65);
                    if ((_DWORD)v66)
                      -[__CFString appendFormat:](v55, "appendFormat:", CFSTR("%ldS"), v66);
                  }
                  v5[2](v5, CFSTR("TRIGGER"), v55);
                }

                v5[2](v5, CFSTR("END"), CFSTR("VALARM"));
              }
              v49 = objc_msgSend(v120, "countByEnumeratingWithState:objects:count:", &v125, v151, 16);
            }
            while (v49);
          }

        }
        v147 = 0;
        v148 = &v147;
        v149 = 0x2050000000;
        v70 = (void *)getEKEventClass_softClass_8691;
        v150 = getEKEventClass_softClass_8691;
        if (!getEKEventClass_softClass_8691)
        {
          v146[0] = MEMORY[0x24BDAC760];
          v146[1] = 3221225472;
          v146[2] = __getEKEventClass_block_invoke_8692;
          v146[3] = &unk_24C4E3118;
          v146[4] = &v147;
          __getEKEventClass_block_invoke_8692((uint64_t)v146);
          v70 = (void *)v148[3];
        }
        v71 = objc_retainAutorelease(v70);
        _Block_object_dispose(&v147, 8);
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          getEKReminderClass();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_94;
          v83 = v119;
          objc_msgSend(MEMORY[0x24BDBCE48], "calendarWithIdentifier:", v113);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "startDateComponents");
          v85 = (void *)objc_claimAutoreleasedReturnValue();

          if (v85)
          {
            objc_msgSend(v83, "startDateComponents");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v84, "dateFromComponents:", v86);
            v87 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v122, "stringFromDate:", v87);
            v88 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v5[2](v5, CFSTR("DTSTART"), v88);

          }
          objc_msgSend(v83, "dueDateComponents");
          v89 = (void *)objc_claimAutoreleasedReturnValue();

          if (v89)
          {
            objc_msgSend(v83, "dueDateComponents");
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v84, "dateFromComponents:", v90);
            v91 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v122, "stringFromDate:", v91);
            v92 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v5[2](v5, CFSTR("DUE"), v92);

          }
          objc_msgSend(v83, "completionDate");
          v93 = (void *)objc_claimAutoreleasedReturnValue();

          if (v93)
          {
            objc_msgSend(v83, "completionDate");
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v122, "stringFromDate:", v94);
            v95 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v5[2](v5, CFSTR("COMPLETED"), v95);

          }
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v83, "priority"));
          v96 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v5[2](v5, CFSTR("PRIORITY"), v96);

          goto LABEL_93;
        }
        v72 = v119;
        if (objc_msgSend(v72, "isAllDay"))
        {
          v73 = (__CFString *)objc_alloc_init(MEMORY[0x24BDD1500]);
          -[__CFString setDateFormat:](v73, "setDateFormat:", CFSTR("yyyyMMdd"));
          v74 = (__CFString *)objc_alloc_init(MEMORY[0x24BDBCE68]);
          -[__CFString setDay:](v74, "setDay:", 1);
          objc_msgSend(v72, "startDate");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString stringFromDate:](v73, "stringFromDate:", v75);
          v76 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "startDate");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "dateByAddingComponents:toDate:options:", v74, v78, 0);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString stringFromDate:](v73, "stringFromDate:", v79);
          v80 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DTSTART;VALUE=DATE:%@"), v76);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(id, void *))v124 + 2))(v124, v81);

          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DTEND;VALUE=DATE:%@"), v80);
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(id, void *))v124 + 2))(v124, v82);

        }
        else
        {
          objc_msgSend(v72, "startDate");
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v97)
            goto LABEL_84;
          objc_msgSend(v72, "endDate");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          v99 = v98 == 0;

          if (v99)
            goto LABEL_84;
          objc_msgSend(v72, "startDate");
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v122, "stringFromDate:", v100);
          v73 = (__CFString *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v72, "endDate");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v122, "stringFromDate:", v101);
          v74 = (__CFString *)objc_claimAutoreleasedReturnValue();

          v5[2](v5, CFSTR("DTSTART"), v73);
          v5[2](v5, CFSTR("DTEND"), v74);
        }

LABEL_84:
        objc_msgSend(v72, "organizer");
        v102 = (void *)objc_claimAutoreleasedReturnValue();

        if (v102)
        {
          v103 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v72, "organizer");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "stringRepresentationOfParticipant:", v104);
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v103, "stringWithFormat:", CFSTR("ORGANIZER%@"), v105);
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(id, void *))v124 + 2))(v124, v106);

        }
        v107 = objc_msgSend(v72, "status") - 1;
        if (v107 <= 2)
          v5[2](v5, CFSTR("STATUS"), off_24C4DEA18[v107]);
        v108 = objc_msgSend(v72, "availability");
        if (!v108)
        {
          v109 = CFSTR("OPAQUE");
          goto LABEL_92;
        }
        if (v108 == 1)
        {
          v109 = CFSTR("TRANSPARENT");
LABEL_92:
          v5[2](v5, CFSTR("TRANSP"), v109);
        }
LABEL_93:

LABEL_94:
        v5[2](v5, CFSTR("SEQUENCE"), CFSTR("0"));
        v5[2](v5, CFSTR("END"), v117);

      }
      v116 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v133, v153, 16);
    }
    while (v116);
  }

  v5[2](v5, CFSTR("END"), CFSTR("VCALENDAR"));
  v110 = v112;

  return v110;
}

+ (id)calendarItemsFromICS:(id)a3
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (id)foldString:(id)a3 withOctetCount:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  int64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataUsingEncoding:allowLossyConversion:", 4, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    v8 = 0;
    do
    {
      v9 = a4 - ((uint64_t)v8 > 0);
      if (v9 + v8 > objc_msgSend(v7, "length"))
        v9 = objc_msgSend(v7, "length") - v8;
      while (1)
      {
        objc_msgSend(v7, "subdataWithRange:", v8, v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v10, 4);
        if (v11)
          break;
        --v9;

        if (!v9)
        {
          v13 = 0;
          goto LABEL_13;
        }
      }
      v12 = (void *)v11;

      if (v8)
        objc_msgSend(v6, "appendFormat:", CFSTR("\r\n %@"), v12);
      else
        objc_msgSend(v6, "appendString:", v12);
      v8 += v9;

    }
    while (v8 < objc_msgSend(v7, "length"));
  }
  v13 = v6;
LABEL_13:

  return v13;
}

+ (id)stringRepresentationOfParticipant:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(";CN=\"%@\"), v6);

  }
  v7 = objc_msgSend(v3, "participantRole") - 1;
  if (v7 <= 3)
    objc_msgSend(v4, "appendFormat:", CFSTR(";ROLE=%@"), off_24C4DEA30[v7]);
  v8 = objc_msgSend(v3, "participantStatus") - 1;
  if (v8 <= 6)
    objc_msgSend(v4, "appendFormat:", CFSTR(";PARTSTAT=%@"), off_24C4DEA50[v8]);
  v9 = objc_msgSend(v3, "participantType");
  if (v9 <= 4)
    objc_msgSend(v4, "appendFormat:", CFSTR(";CUTYPE=%@"), off_24C4DEA88[v9]);
  objc_msgSend(v3, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v3, "URL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "absoluteString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(":%@"), v12);

  }
  return v4;
}

+ (id)hexColorFromCGColor:(CGColor *)a3
{
  void *v3;
  void *v4;
  uint64_t v6;
  double v7;
  double v8;
  double v9;

  objc_msgSend(MEMORY[0x24BEC1398], "colorWithCGColor:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v7 = 0.0;
  v8 = 0.0;
  v9 = 0.0;
  objc_msgSend(v3, "getRed:green:blue:alpha:", &v9, &v8, &v7, &v6);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("#%02X%02X%02X"), (int)(v9 * 255.0), (int)(v8 * 255.0), (int)(v7 * 255.0));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __45__WFVCalendarFormatter_ICSFromCalendarItems___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 40);
  objc_msgSend(a2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\\n"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "foldString:withOctetCount:", v4, 75);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v5 = *(void **)(a1 + 32);
  objc_msgSend(CFSTR("\r\n"), "stringByAppendingString:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v6);

}

void __45__WFVCalendarFormatter_ICSFromCalendarItems___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

@end
