@implementation CalDAVOfficeHour

+ (id)logHandle
{
  if (logHandle_onceToken != -1)
    dispatch_once(&logHandle_onceToken, &__block_literal_global_5);
  return (id)logHandle_logHandle;
}

void __29__CalDAVOfficeHour_logHandle__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.calendar.DataAccessExpress", "CalDAVOfficeHour");
  v1 = (void *)logHandle_logHandle;
  logHandle_logHandle = (uint64_t)v0;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CalDAVOfficeHour)initWithCoder:(id)a3
{
  id v4;
  CalDAVOfficeHour *v5;
  void *v6;
  uint64_t v7;
  NSDateComponents *startDate;
  void *v9;
  uint64_t v10;
  NSDateComponents *endDate;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CalDAVOfficeHour;
  v5 = -[CalDAVOfficeHour init](&v13, sel_init);
  if (v5)
  {
    v5->_enabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enabled"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDay"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    startDate = v5->_startDate;
    v5->_startDate = (NSDateComponents *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endDate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    endDate = v5->_endDate;
    v5->_endDate = (NSDateComponents *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[CalDAVOfficeHour enabled](self, "enabled"), CFSTR("enabled"));
  -[CalDAVOfficeHour startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("startDay"));

  -[CalDAVOfficeHour endDate](self, "endDate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("endDate"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CalDAVOfficeHour enabled](self, "enabled"))
    v6 = CFSTR("enabled");
  else
    v6 = CFSTR("disabled");
  -[CalDAVOfficeHour startDate](self, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVOfficeHour endDate](self, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ <%p> {%@, %@, %@}"), v5, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)officeHoursFromData:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x1E0DDB820];
    v4 = a3;
    v5 = (void *)objc_msgSend([v3 alloc], "initWithData:options:error:", v4, 0, 0);

    +[CalDAVOfficeHour officeHoursFromICS:](CalDAVOfficeHour, "officeHoursFromICS:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (id)officeHoursFromICS:(id)a3
{
  uint64_t v3;
  void *v4;
  CalDAVOfficeHour *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  void *v33;
  uint64_t v34;
  void *v35;
  unint64_t v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t i;
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
  BOOL v63;
  NSObject *v64;
  NSObject *v65;
  id v67;
  void *v68;
  void *v69;
  id obj;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  NSObject *v77;
  void *v78;
  NSObject *v79;
  NSObject *v80;
  uint64_t v81;
  uint64_t v82;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  id v90;
  void *v91;
  void *v92;
  void *v93;
  uint8_t buf[16];
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  _BYTE v107[128];
  _BYTE v108[128];
  _BYTE v109[128];
  uint64_t v110;

  v110 = *MEMORY[0x1E0C80C00];
  v67 = a3;
  v3 = 7;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 7);
  do
  {
    v5 = objc_alloc_init(CalDAVOfficeHour);
    objc_msgSend(v4, "addObject:", v5);

    --v3;
  }
  while (v3);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "calendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = 0u;
  v104 = 0u;
  v105 = 0u;
  v106 = 0u;
  objc_msgSend(v67, "calendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "components");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v8;
  v9 = v4;
  v72 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v103, v109, 16);
  if (v72)
  {
    v10 = 0x1E0DDB000uLL;
    v71 = *(_QWORD *)v104;
    v75 = v6;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v104 != v71)
          objc_enumerationMutation(obj);
        v74 = v11;
        v12 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_71;
        v13 = v12;
        objc_msgSend(v13, "dtstart");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "systemDateForDate:options:", v14, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v78 = v13;
        objc_msgSend(v13, "dtend");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "systemDateForDate:options:", v16, 0);
        v17 = objc_claimAutoreleasedReturnValue();

        v73 = (void *)v17;
        if (!v17)
        {
          objc_msgSend(v78, "duration");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18;
          if (v18)
          {
            objc_msgSend(v18, "timeInterval");
            objc_msgSend(v15, "dateByAddingTimeInterval:");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v73 = 0;
          }

        }
        v20 = v15;
        if ((!v15 || objc_msgSend(v69, "compare:", v15) == 1) && (!v73 || objc_msgSend(v69, "compare:", v73) == -1))
        {
          v101 = 0u;
          v102 = 0u;
          v99 = 0u;
          v100 = 0u;
          objc_msgSend(v78, "components");
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = -[NSObject countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v99, v108, 16);
          if (!v22)
            goto LABEL_70;
          v23 = v22;
          v68 = v20;
          v24 = *(_QWORD *)v100;
          v76 = *(_QWORD *)v100;
          v77 = v21;
          while (1)
          {
            v25 = 0;
            v82 = v23;
            do
            {
              if (*(_QWORD *)v100 != v24)
                objc_enumerationMutation(v21);
              v26 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * v25);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v27 = v26;
                objc_msgSend(v27, "dtstart");
                v28 = objc_claimAutoreleasedReturnValue();
                v86 = v27;
                objc_msgSend(v27, "dtend");
                v29 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "systemDateForDate:options:", v28, 0);
                v88 = (void *)objc_claimAutoreleasedReturnValue();
                v85 = (void *)v28;
                objc_msgSend(v6, "systemCalendarForDate:options:", v28, 0);
                v87 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "systemDateForDate:options:", v29, 0);
                v30 = objc_claimAutoreleasedReturnValue();
                v84 = (void *)v29;
                objc_msgSend(v6, "systemCalendarForDate:options:", v29, 0);
                v31 = objc_claimAutoreleasedReturnValue();
                v32 = (id)v31;
                v89 = (void *)v30;
                if (v30)
                {
                  v33 = v87;
                }
                else
                {
                  v34 = v24;
                  v35 = v6;
                  v36 = v10;
                  v37 = v21;
                  v38 = (void *)v31;
                  objc_msgSend(v78, "duration");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  v40 = v39;
                  if (v39)
                  {
                    objc_msgSend(v39, "timeInterval");
                    objc_msgSend(v88, "dateByAddingTimeInterval:");
                    v89 = (void *)objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    v89 = 0;
                  }
                  v33 = v87;
                  v32 = v87;

                  v21 = v37;
                  v10 = v36;
                  v6 = v35;
                  v24 = v34;
                  v23 = v82;
                }
                objc_msgSend(v33, "components:fromDate:", 764, v88);
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                v91 = v32;
                objc_msgSend(v32, "components:fromDate:", 764, v89);
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                v93 = v41;
                v43 = objc_msgSend(v41, "weekday");
                v92 = v42;
                if (v43 == objc_msgSend(v42, "weekday"))
                {
                  objc_msgSend(v86, "rrule");
                  v44 = objc_claimAutoreleasedReturnValue();
                  if (-[NSObject count](v44, "count") == 1)
                  {
                    -[NSObject lastObject](v44, "lastObject");
                    v45 = objc_claimAutoreleasedReturnValue();
                    -[NSObject byday](v45, "byday");
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    v47 = v46;
                    v48 = v87;
                    v80 = v44;
                    v81 = v25;
                    v79 = v45;
                    if (v46)
                    {
                      v97 = 0u;
                      v98 = 0u;
                      v95 = 0u;
                      v96 = 0u;
                      v49 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v95, v107, 16);
                      if (!v49)
                        goto LABEL_64;
                      v50 = v49;
                      v51 = *(_QWORD *)v96;
                      v90 = v47;
                      while (1)
                      {
                        for (i = 0; i != v50; ++i)
                        {
                          if (*(_QWORD *)v96 != v51)
                            objc_enumerationMutation(v90);
                          objc_msgSend(v9, "objectAtIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v95 + 1) + 8 * i), "weekday") - 1);
                          v53 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v53, "setEnabled:", 1);
                          objc_msgSend(v53, "startDate");
                          v54 = (void *)objc_claimAutoreleasedReturnValue();
                          if (!v54)
                          {
                            v56 = 0;
LABEL_45:
                            objc_msgSend(v53, "setStartDate:", v93);
                            goto LABEL_46;
                          }
                          objc_msgSend(v48, "dateFromComponents:", v54);
                          v55 = (void *)objc_claimAutoreleasedReturnValue();
                          v56 = v55;
                          if (!v55)
                            goto LABEL_45;
                          objc_msgSend(v55, "laterDate:", v88);
                          v57 = (void *)objc_claimAutoreleasedReturnValue();

                          if (v57 == v56)
                            goto LABEL_45;
LABEL_46:
                          objc_msgSend(v53, "endDate");
                          v58 = (void *)objc_claimAutoreleasedReturnValue();
                          if (!v58)
                          {
                            v60 = 0;
LABEL_52:
                            objc_msgSend(v53, "setEndDate:", v92);
                            goto LABEL_53;
                          }
                          objc_msgSend(v91, "dateFromComponents:", v58);
                          v59 = (void *)objc_claimAutoreleasedReturnValue();
                          v60 = v59;
                          if (!v59)
                            goto LABEL_52;
                          objc_msgSend(v59, "earlierDate:", v89);
                          v61 = v9;
                          v62 = (void *)objc_claimAutoreleasedReturnValue();

                          v63 = v62 == v60;
                          v9 = v61;
                          v48 = v87;
                          if (v63)
                            goto LABEL_52;
LABEL_53:

                        }
                        v47 = v90;
                        v50 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v95, v107, 16);
                        if (!v50)
                          goto LABEL_64;
                      }
                    }
                    objc_msgSend(a1, "logHandle");
                    v65 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_1B5244000, v65, OS_LOG_TYPE_DEFAULT, "Discarding overly-complex recurrence for AVAILABLE, iCal doesn't understand it.", buf, 2u);
                    }

LABEL_64:
                    v6 = v75;
                    v24 = v76;
                    v10 = 0x1E0DDB000;
                    v21 = v77;
                    v25 = v81;
                    v23 = v82;
                    v64 = v79;
                    v44 = v80;
                  }
                  else
                  {
                    objc_msgSend(a1, "logHandle");
                    v64 = objc_claimAutoreleasedReturnValue();
                    v48 = v87;
                    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_1B5244000, v64, OS_LOG_TYPE_DEFAULT, "Discarding non-recurring AVAILABLE, iCal doesn't understand it.", buf, 2u);
                    }
                  }

                }
                else
                {
                  objc_msgSend(a1, "logHandle");
                  v44 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1B5244000, v44, OS_LOG_TYPE_DEFAULT, "Discarding non-same-day AVAILABLE, iCal doesn't understand it.", buf, 2u);
                  }
                  v48 = v87;
                }

              }
              ++v25;
            }
            while (v25 != v23);
            v23 = -[NSObject countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v99, v108, 16);
            if (!v23)
            {
              v20 = v68;
              goto LABEL_70;
            }
          }
        }
        objc_msgSend(a1, "logHandle");
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B5244000, v21, OS_LOG_TYPE_DEFAULT, "Discarding non-current VAVAILABILITY, iCal doesn't understand it.", buf, 2u);
        }
LABEL_70:

LABEL_71:
        v11 = v74 + 1;
      }
      while (v74 + 1 != v72);
      v72 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v103, v109, 16);
    }
    while (v72);
  }

  return v9;
}

+ (id)dataFromOfficeHours:(id)a3
{
  void *v3;
  void *v4;

  +[CalDAVOfficeHour icsFromOfficeHours:](CalDAVOfficeHour, "icsFromOfficeHours:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ICSDataWithOptions:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_gregorianGMTCalendar
{
  if (_gregorianGMTCalendar_onceToken != -1)
    dispatch_once(&_gregorianGMTCalendar_onceToken, &__block_literal_global_19);
  return (id)_gregorianGMTCalendar_gregorianGMTCalendar;
}

void __41__CalDAVOfficeHour__gregorianGMTCalendar__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = objc_alloc(MEMORY[0x1E0C99D48]);
  v1 = objc_msgSend(v0, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  v2 = (void *)_gregorianGMTCalendar_gregorianGMTCalendar;
  _gregorianGMTCalendar_gregorianGMTCalendar = v1;

  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("GMT"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_gregorianGMTCalendar_gregorianGMTCalendar, "setTimeZone:", v3);

}

+ (id)icsFromOfficeHours:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  BOOL v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  uint64_t v78;

  v75 = a3;
  if (objc_msgSend(v75, "count") != 7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CalDAVOfficeHour.m"), 196, CFSTR("Office hours array must contain seven items"));

  }
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("UTC"));
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_gregorianGMTCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = v6;
  objc_msgSend(v6, "components:fromDate:", 764, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v63 = (void *)v5;
  v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDB800]), "initWithYear:month:day:hour:minute:second:timeZone:", objc_msgSend(v8, "year"), objc_msgSend(v8, "month"), objc_msgSend(v8, "day"), objc_msgSend(v8, "hour"), objc_msgSend(v8, "minute"), objc_msgSend(v8, "second"), v5);
  v64 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v66 = v8;
  v9 = objc_msgSend(v8, "weekday");
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  for (i = 0; i != 7; ++i)
  {
    objc_msgSend(v75, "objectAtIndex:", v9 - 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v15, "enabled"))
      goto LABEL_21;
    v78 = i;
    objc_msgSend(v15, "startDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = v15;
    objc_msgSend(v15, "endDate");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = v16;
    if (!v11 || !v12)
      goto LABEL_17;
    v17 = objc_msgSend(v16, "hour");
    objc_msgSend(v12, "value");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17 != objc_msgSend(v18, "hour"))
      goto LABEL_16;
    v19 = objc_msgSend(v16, "minute");
    objc_msgSend(v12, "value");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19 != objc_msgSend(v20, "minute") || !v13)
      goto LABEL_15;
    v21 = v12;
    v22 = objc_msgSend(v76, "hour");
    objc_msgSend(v13, "value");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22 != objc_msgSend(v23, "hour"))
    {

      v12 = v21;
LABEL_15:

LABEL_16:
LABEL_17:
      v73 = v9;
      v31 = v13;
      if (v10)
      {
        objc_msgSend(MEMORY[0x1E0DDB7F0], "makeUID");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setUid:", v32);

        objc_msgSend(v10, "setDtstamp:", v65);
        objc_msgSend(v10, "setDtstart:", v12);
        objc_msgSend(v10, "setDtend:", v13);
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v11);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setRrule:", v33);

        objc_msgSend(v64, "addObject:", v10);
      }
      v71 = objc_alloc_init(MEMORY[0x1E0DDB7C8]);

      v34 = objc_alloc_init(MEMORY[0x1E0C99D78]);
      v70 = v11;
      objc_msgSend(v34, "setYear:", objc_msgSend(v66, "year"));
      objc_msgSend(v34, "setMonth:", objc_msgSend(v66, "month") - 1);
      objc_msgSend(v34, "setDay:", objc_msgSend(v66, "day") + v78);
      objc_msgSend(v67, "dateFromComponents:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "components:fromDate:", 28, v35);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v36 = objc_alloc(MEMORY[0x1E0DDB800]);
      v37 = objc_msgSend(v28, "year");
      v38 = v12;
      v39 = objc_msgSend(v28, "month");
      v40 = objc_msgSend(v28, "day");
      v41 = objc_msgSend(v16, "hour");
      v42 = objc_msgSend(v16, "minute");
      objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
      v68 = v31;
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = objc_msgSend(v36, "initWithYear:month:day:hour:minute:second:timeZone:", v37, v39, v40, v41, v42, 0, v43);

      v44 = objc_alloc(MEMORY[0x1E0DDB800]);
      v45 = objc_msgSend(v28, "year");
      v46 = objc_msgSend(v28, "month");
      v47 = objc_msgSend(v28, "day");
      v48 = objc_msgSend(v76, "hour");
      v49 = objc_msgSend(v76, "minute");
      objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v44, "initWithYear:month:day:hour:minute:second:timeZone:", v45, v46, v47, v48, v49, 0, v50);

      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDB850]), "initWithFrequency:", 5);
      v9 = v73;
      v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDB7D0]), "initWithWeekday:", v73);
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setByday:", v30);
      v21 = (void *)v69;
      v27 = v76;
      i = v78;
      v10 = v71;
      goto LABEL_20;
    }
    v72 = objc_msgSend(v76, "minute");
    objc_msgSend(v13, "value");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "minute");

    v26 = v72 == v25;
    v12 = v21;
    v16 = v77;
    v27 = v76;
    if (!v26)
      goto LABEL_17;
    objc_msgSend(v11, "byday");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDB7D0]), "initWithWeekday:", v9);
    objc_msgSend(v28, "arrayByAddingObject:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setByday:", v30);
    i = v78;
LABEL_20:

    v12 = v21;
    v15 = v74;
LABEL_21:
    v9 = v9 % 7 + 1;

  }
  v51 = v12;
  v52 = v13;
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0DDB7F0], "makeUID");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setUid:", v53);

    objc_msgSend(v10, "setDtstamp:", v65);
    objc_msgSend(v10, "setDtstart:", v51);
    objc_msgSend(v10, "setDtend:", v52);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v11);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setRrule:", v54);

    objc_msgSend(v64, "addObject:", v10);
  }
  v55 = objc_alloc_init(MEMORY[0x1E0DDB7C0]);
  objc_msgSend(MEMORY[0x1E0DDB7F0], "makeUID");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setUid:", v56);

  objc_msgSend(v55, "setDtstamp:", v65);
  objc_msgSend(v55, "setComponents:", v64);
  v57 = objc_alloc_init(MEMORY[0x1E0DDB7D8]);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v55);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setComponents:options:", v58, 2);

  ICSDefaultPRODID();
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setProdid:", v59);

  v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDB820]), "initWithCalendar:", v57);
  return v60;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (NSDateComponents)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDateComponents)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
