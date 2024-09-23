@implementation MOTime

- (MOTime)initWithIdentifier:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  MOTime *v9;

  v5 = a3;
  if (!v5)
  {
    _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[MOTime initWithIdentifier:].cold.1(v6);

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOTime.m"), 102, CFSTR("Invalid parameter not satisfying: identifier (in %s:%d)"), "-[MOTime initWithIdentifier:]", 102);

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  v9 = -[MOTime initWithIdentifier:timestamp:timeString:timeZone:timeTag:](self, "initWithIdentifier:timestamp:timeString:timeZone:timeTag:", v5, CFSTR("today"), CFSTR("Unknown"), 0);

  return v9;
}

- (MOTime)initWithTimestamp:(double)a3 timeString:(id)a4 timeZone:(id)a5 timeTag:(unint64_t)a6
{
  void *v10;
  id v11;
  id v12;
  void *v13;
  MOTime *v14;

  v10 = (void *)MEMORY[0x1E0CB3A28];
  v11 = a5;
  v12 = a4;
  objc_msgSend(v10, "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[MOTime initWithIdentifier:timestamp:timeString:timeZone:timeTag:](self, "initWithIdentifier:timestamp:timeString:timeZone:timeTag:", v13, v12, v11, a6, a3);

  return v14;
}

- (MOTime)initWithIdentifier:(id)a3 timestamp:(double)a4 timeString:(id)a5 timeZone:(id)a6 timeTag:(unint64_t)a7
{
  id v13;
  id v14;
  id v15;
  MOTime *v16;
  MOTime *v17;
  objc_super v19;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)MOTime;
  v16 = -[MOTime init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_identifier, a3);
    v17->_timestamp = a4;
    objc_storeStrong((id *)&v17->_timeString, a5);
    objc_storeStrong((id *)&v17->_timeZone, a6);
    v17->_timeTag = a7;
    v17->_dateReferenceTag = 0;
  }

  return v17;
}

- (id)timeZoneObject
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[MOTime timeZone](self, "timeZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0C99E80];
    -[MOTime timeZone](self, "timeZone");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeZoneWithName:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)localTime
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[MOTime timestamp](self, "timestamp");
  if (v3 == 0.0)
  {
    v7 = 0;
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C99D68];
    -[MOTime timestamp](self, "timestamp");
    objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MOTime timeZoneObject](self, "timeZoneObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[MOTime localTimeOfDate:timeZone:](MOTime, "localTimeOfDate:timeZone:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)date
{
  double v3;
  void *v4;
  void *v5;

  -[MOTime timestamp](self, "timestamp");
  if (v3 == 0.0)
  {
    v5 = 0;
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C99D68];
    -[MOTime timestamp](self, "timestamp");
    objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

+ (id)localTimeOfDate:(id)a3 timeZone:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqualToTimeZone:", v7))
      {
        v9 = v5;
      }
      else
      {
        v10 = objc_msgSend(v7, "secondsFromGMTForDate:", v5);
        v11 = v10 - objc_msgSend(v8, "secondsFromGMTForDate:", v5);
        objc_msgSend(v5, "dateByAddingTimeInterval:", (double)v11);
        v9 = (id)objc_claimAutoreleasedReturnValue();
        _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          v14 = 138413314;
          v15 = v5;
          v16 = 2112;
          v17 = v7;
          v18 = 2112;
          v19 = v8;
          v20 = 2048;
          v21 = v11;
          v22 = 2112;
          v23 = v9;
          _os_log_debug_impl(&dword_1CAE42000, v12, OS_LOG_TYPE_DEBUG, "localTime, object date, %@, object timezone, %@, system timezone, %@, timezone diff, %ld, adjusted date, %@", (uint8_t *)&v14, 0x34u);
        }

      }
    }
    else
    {
      v9 = v5;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)timeForDate:(id)a3
{
  return +[MOTime timeFromStartDate:endDate:timeZoneManager:](MOTime, "timeFromStartDate:endDate:timeZoneManager:", a3, 0, 0);
}

+ (id)timeForDate:(id)a3 timeZoneManager:(id)a4
{
  return +[MOTime timeFromStartDate:endDate:timeZoneManager:](MOTime, "timeFromStartDate:endDate:timeZoneManager:", a3, 0, a4);
}

+ (id)timeFromStartDate:(id)a3 endDate:(id)a4
{
  return +[MOTime timeFromStartDate:endDate:timeZoneManager:](MOTime, "timeFromStartDate:endDate:timeZoneManager:", a3, a4, 0);
}

+ (id)timeFromStartDate:(id)a3 endDate:(id)a4 timeZoneManager:(id)a5
{
  id v6;
  id v7;
  double v8;
  double v9;
  void *v10;
  NSObject *v11;
  MOTime *v12;
  void *v13;
  MOTime *v14;
  int v16;
  id v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a5;
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  v9 = v8;
  if (v7)
  {
    objc_msgSend(v7, "timeZoneAtDate:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v16 = 138412802;
      v17 = v6;
      v18 = 2112;
      v19 = v10;
      v20 = 2112;
      v21 = v7;
      _os_log_debug_impl(&dword_1CAE42000, v11, OS_LOG_TYPE_DEBUG, "timeZone, date, %@, timeZone, %@, source, timeZoneManager, %@", (uint8_t *)&v16, 0x20u);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      +[MOTime timeFromStartDate:endDate:timeZoneManager:].cold.1();
  }

  v12 = [MOTime alloc];
  objc_msgSend(v10, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[MOTime initWithTimestamp:timeString:timeZone:timeTag:](v12, "initWithTimestamp:timeString:timeZone:timeTag:", 0, v13, 0, v9);

  return v14;
}

+ (id)dateFromDate:(id)a3 hour:(int64_t)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0C99D48];
  v6 = a3;
  objc_msgSend(v5, "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "components:fromDate:", 60, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setHour:", a4);
  objc_msgSend(v7, "dateFromComponents:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)buildTimeTagIntervalsForDate:(id)a3
{
  id v3;
  void *v4;
  MOTimeTagInterval *v5;
  id v6;
  void *v7;
  void *v8;
  MOTimeTagInterval *v9;
  MOTimeTagInterval *v10;
  id v11;
  void *v12;
  void *v13;
  MOTimeTagInterval *v14;
  MOTimeTagInterval *v15;
  id v16;
  void *v17;
  void *v18;
  MOTimeTagInterval *v19;
  MOTimeTagInterval *v20;
  id v21;
  void *v22;
  void *v23;
  MOTimeTagInterval *v24;
  MOTimeTagInterval *v25;
  id v26;
  void *v27;
  void *v28;
  MOTimeTagInterval *v29;
  MOTimeTagInterval *v30;
  id v31;
  void *v32;
  void *v33;
  MOTimeTagInterval *v34;
  MOTimeTagInterval *v35;
  id v36;
  void *v37;
  void *v38;
  MOTimeTagInterval *v39;
  void *v40;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = [MOTimeTagInterval alloc];
  v6 = objc_alloc(MEMORY[0x1E0CB3588]);
  +[MOTime dateFromDate:hour:](MOTime, "dateFromDate:hour:", v3, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithStartDate:duration:", v7, 10800.0);
  v9 = -[MOTimeTagInterval initWithTimeTag:dateInterval:](v5, "initWithTimeTag:dateInterval:", 8, v8);
  objc_msgSend(v4, "addObject:", v9);

  v10 = [MOTimeTagInterval alloc];
  v11 = objc_alloc(MEMORY[0x1E0CB3588]);
  +[MOTime dateFromDate:hour:](MOTime, "dateFromDate:hour:", v3, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithStartDate:duration:", v12, 21600.0);
  v14 = -[MOTimeTagInterval initWithTimeTag:dateInterval:](v10, "initWithTimeTag:dateInterval:", 2, v13);
  objc_msgSend(v4, "addObject:", v14);

  v15 = [MOTimeTagInterval alloc];
  v16 = objc_alloc(MEMORY[0x1E0CB3588]);
  +[MOTime dateFromDate:hour:](MOTime, "dateFromDate:hour:", v3, 9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithStartDate:duration:", v17, 10800.0);
  v19 = -[MOTimeTagInterval initWithTimeTag:dateInterval:](v15, "initWithTimeTag:dateInterval:", 3, v18);
  objc_msgSend(v4, "addObject:", v19);

  v20 = [MOTimeTagInterval alloc];
  v21 = objc_alloc(MEMORY[0x1E0CB3588]);
  +[MOTime dateFromDate:hour:](MOTime, "dateFromDate:hour:", v3, 12);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v21, "initWithStartDate:duration:", v22, 10800.0);
  v24 = -[MOTimeTagInterval initWithTimeTag:dateInterval:](v20, "initWithTimeTag:dateInterval:", 4, v23);
  objc_msgSend(v4, "addObject:", v24);

  v25 = [MOTimeTagInterval alloc];
  v26 = objc_alloc(MEMORY[0x1E0CB3588]);
  +[MOTime dateFromDate:hour:](MOTime, "dateFromDate:hour:", v3, 15);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v26, "initWithStartDate:duration:", v27, 10800.0);
  v29 = -[MOTimeTagInterval initWithTimeTag:dateInterval:](v25, "initWithTimeTag:dateInterval:", 5, v28);
  objc_msgSend(v4, "addObject:", v29);

  v30 = [MOTimeTagInterval alloc];
  v31 = objc_alloc(MEMORY[0x1E0CB3588]);
  +[MOTime dateFromDate:hour:](MOTime, "dateFromDate:hour:", v3, 18);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_msgSend(v31, "initWithStartDate:duration:", v32, 10800.0);
  v34 = -[MOTimeTagInterval initWithTimeTag:dateInterval:](v30, "initWithTimeTag:dateInterval:", 6, v33);
  objc_msgSend(v4, "addObject:", v34);

  v35 = [MOTimeTagInterval alloc];
  v36 = objc_alloc(MEMORY[0x1E0CB3588]);
  +[MOTime dateFromDate:hour:](MOTime, "dateFromDate:hour:", v3, 21);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = (void *)objc_msgSend(v36, "initWithStartDate:duration:", v37, 10800.0);
  v39 = -[MOTimeTagInterval initWithTimeTag:dateInterval:](v35, "initWithTimeTag:dateInterval:", 7, v38);
  objc_msgSend(v4, "addObject:", v39);

  v40 = (void *)objc_msgSend(v4, "copy");
  return v40;
}

+ (id)buildSimpleTimeTagIntervalsForDate:(id)a3
{
  id v3;
  void *v4;
  MOTimeTagInterval *v5;
  id v6;
  void *v7;
  void *v8;
  MOTimeTagInterval *v9;
  MOTimeTagInterval *v10;
  id v11;
  void *v12;
  void *v13;
  MOTimeTagInterval *v14;
  MOTimeTagInterval *v15;
  id v16;
  void *v17;
  void *v18;
  MOTimeTagInterval *v19;
  MOTimeTagInterval *v20;
  id v21;
  void *v22;
  void *v23;
  MOTimeTagInterval *v24;
  MOTimeTagInterval *v25;
  id v26;
  void *v27;
  void *v28;
  MOTimeTagInterval *v29;
  void *v30;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = [MOTimeTagInterval alloc];
  v6 = objc_alloc(MEMORY[0x1E0CB3588]);
  +[MOTime dateFromDate:hour:](MOTime, "dateFromDate:hour:", v3, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithStartDate:duration:", v7, 32400.0);
  v9 = -[MOTimeTagInterval initWithTimeTag:dateInterval:](v5, "initWithTimeTag:dateInterval:", 2, v8);
  objc_msgSend(v4, "addObject:", v9);

  v10 = [MOTimeTagInterval alloc];
  v11 = objc_alloc(MEMORY[0x1E0CB3588]);
  +[MOTime dateFromDate:hour:](MOTime, "dateFromDate:hour:", v3, 12);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithStartDate:duration:", v12, 21600.0);
  v14 = -[MOTimeTagInterval initWithTimeTag:dateInterval:](v10, "initWithTimeTag:dateInterval:", 4, v13);
  objc_msgSend(v4, "addObject:", v14);

  v15 = [MOTimeTagInterval alloc];
  v16 = objc_alloc(MEMORY[0x1E0CB3588]);
  +[MOTime dateFromDate:hour:](MOTime, "dateFromDate:hour:", v3, 18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithStartDate:duration:", v17, 10800.0);
  v19 = -[MOTimeTagInterval initWithTimeTag:dateInterval:](v15, "initWithTimeTag:dateInterval:", 6, v18);
  objc_msgSend(v4, "addObject:", v19);

  v20 = [MOTimeTagInterval alloc];
  v21 = objc_alloc(MEMORY[0x1E0CB3588]);
  +[MOTime dateFromDate:hour:](MOTime, "dateFromDate:hour:", v3, 21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v21, "initWithStartDate:duration:", v22, 21600.0);
  v24 = -[MOTimeTagInterval initWithTimeTag:dateInterval:](v20, "initWithTimeTag:dateInterval:", 7, v23);
  objc_msgSend(v4, "addObject:", v24);

  v25 = [MOTimeTagInterval alloc];
  v26 = objc_alloc(MEMORY[0x1E0CB3588]);
  +[MOTime dateFromDate:hour:](MOTime, "dateFromDate:hour:", v3, -3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = (void *)objc_msgSend(v26, "initWithStartDate:duration:", v27, 21600.0);
  v29 = -[MOTimeTagInterval initWithTimeTag:dateInterval:](v25, "initWithTimeTag:dateInterval:", 7, v28);
  objc_msgSend(v4, "addObject:", v29);

  v30 = (void *)objc_msgSend(v4, "copy");
  return v30;
}

+ (unint64_t)timetagFromStartDate:(id)a3 endDate:(id)a4
{
  id v5;
  id v6;
  double v7;
  NSObject *v8;
  unint64_t v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t v43[128];
  uint8_t buf[4];
  id v45;
  __int16 v46;
  id v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  double v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!v6
    || (objc_msgSend(v5, "isSameDayWithDate:", v6) & 1) != 0
    || (objc_msgSend(v6, "timeIntervalSinceDate:", v5), v7 <= 43200.0))
  {
    +[MOTime buildTimeTagIntervalsForDate:](MOTime, "buildTimeTagIntervalsForDate:", v5);
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v10 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
    if (v10)
    {
      v12 = v10;
      v13 = *(_QWORD *)v40;
      *(_QWORD *)&v11 = 138413058;
      v33 = v11;
LABEL_9:
      v14 = 0;
      while (1)
      {
        if (*(_QWORD *)v40 != v13)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v14);
        objc_msgSend(v15, "overlapsScoreForStartDate:endDate:", v5, v6, v33);
        v17 = v16;
        if (v16 > 0.0)
        {
          _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v33;
            v45 = v5;
            v46 = 2112;
            v47 = v6;
            v48 = 2112;
            v49 = (uint64_t)v15;
            v50 = 2048;
            v51 = v17;
            _os_log_debug_impl(&dword_1CAE42000, v18, OS_LOG_TYPE_DEBUG, "timeOfDay, startDate, %@, endDate, %@, interval, %@, score, %f", buf, 0x2Au);
          }

        }
        if (v17 > 0.7)
          break;
        if (v12 == ++v14)
        {
          v12 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
          if (v12)
            goto LABEL_9;
          goto LABEL_19;
        }
      }
      _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
      v28 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        goto LABEL_35;
      v29 = objc_msgSend(v15, "timetag");
      +[MOTime timeStringFromTimeTag:](MOTime, "timeStringFromTimeTag:", objc_msgSend(v15, "timetag"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = v33;
      v45 = v5;
      v46 = 2112;
      v47 = v6;
      v48 = 2048;
      v49 = v29;
      v50 = 2112;
      v51 = *(double *)&v30;
    }
    else
    {
LABEL_19:

      +[MOTime buildSimpleTimeTagIntervalsForDate:](MOTime, "buildSimpleTimeTagIntervalsForDate:", v5);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v8 = v19;
      v20 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
      if (!v20)
      {
LABEL_31:
        v9 = 0;
LABEL_36:

        goto LABEL_37;
      }
      v22 = v20;
      v23 = *(_QWORD *)v36;
      *(_QWORD *)&v21 = 138413058;
      v34 = v21;
LABEL_21:
      v24 = 0;
      while (1)
      {
        if (*(_QWORD *)v36 != v23)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v24);
        objc_msgSend(v15, "overlapsScoreForStartDate:endDate:", v5, v6, v34, (_QWORD)v35);
        v26 = v25;
        if (v25 > 0.0)
        {
          _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v34;
            v45 = v5;
            v46 = 2112;
            v47 = v6;
            v48 = 2112;
            v49 = (uint64_t)v15;
            v50 = 2048;
            v51 = v26;
            _os_log_debug_impl(&dword_1CAE42000, v27, OS_LOG_TYPE_DEBUG, "timeOfDay, startDate, %@, endDate, %@, interval, %@, score, %f", buf, 0x2Au);
          }

        }
        if (v26 > 0.7)
          break;
        if (v22 == ++v24)
        {
          v22 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
          if (v22)
            goto LABEL_21;
          goto LABEL_31;
        }
      }
      _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
      v28 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        goto LABEL_35;
      v32 = objc_msgSend(v15, "timetag");
      +[MOTime timeStringFromTimeTag:](MOTime, "timeStringFromTimeTag:", objc_msgSend(v15, "timetag"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = v34;
      v45 = v5;
      v46 = 2112;
      v47 = v6;
      v48 = 2048;
      v49 = v32;
      v50 = 2112;
      v51 = *(double *)&v30;
    }
    _os_log_debug_impl(&dword_1CAE42000, v28, OS_LOG_TYPE_DEBUG, "timeOfDay, startDate, %@, endDate, %@, timetag, %lu(%@)", buf, 0x2Au);

LABEL_35:
    v9 = objc_msgSend(v15, "timetag");
    goto LABEL_36;
  }
  _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    +[MOTime timetagFromStartDate:endDate:].cold.1();
  v9 = 0;
LABEL_37:

  return v9;
}

+ (unint64_t)simpleTimetagFromStartDate:(id)a3 endDate:(id)a4
{
  id v5;
  id v6;
  double v7;
  NSObject *v8;
  unint64_t v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  double v16;
  double v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  double v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!v6
    || (objc_msgSend(v5, "isSameDayWithDate:", v6) & 1) != 0
    || (objc_msgSend(v6, "timeIntervalSinceDate:", v5), v7 <= 43200.0))
  {
    +[MOTime buildSimpleTimeTagIntervalsForDate:](MOTime, "buildSimpleTimeTagIntervalsForDate:", v5);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v10 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
    if (v10)
    {
      v12 = v10;
      v13 = *(_QWORD *)v25;
      *(_QWORD *)&v11 = 138413058;
      v23 = v11;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v25 != v13)
            objc_enumerationMutation(v8);
          v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v15, "overlapsScoreForStartDate:endDate:", v5, v6, v23, (_QWORD)v24);
          v17 = v16;
          if (v16 > 0.0)
          {
            _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v23;
              v29 = v5;
              v30 = 2112;
              v31 = v6;
              v32 = 2112;
              v33 = (uint64_t)v15;
              v34 = 2048;
              v35 = v17;
              _os_log_debug_impl(&dword_1CAE42000, v18, OS_LOG_TYPE_DEBUG, "timeOfDay, startDate, %@, endDate, %@, interval, %@, score, %f", buf, 0x2Au);
            }

          }
          if (v17 > 0.7)
          {
            _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              v21 = objc_msgSend(v15, "timetag");
              +[MOTime timeStringFromTimeTag:](MOTime, "timeStringFromTimeTag:", objc_msgSend(v15, "timetag"));
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v23;
              v29 = v5;
              v30 = 2112;
              v31 = v6;
              v32 = 2048;
              v33 = v21;
              v34 = 2112;
              v35 = *(double *)&v22;
              _os_log_debug_impl(&dword_1CAE42000, v19, OS_LOG_TYPE_DEBUG, "timeOfDay, startDate, %@, endDate, %@, timetag, %lu(%@)", buf, 0x2Au);

            }
            v9 = objc_msgSend(v15, "timetag");
            goto LABEL_23;
          }
        }
        v12 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
        if (v12)
          continue;
        break;
      }
    }
    v9 = 0;
LABEL_23:

  }
  else
  {
    _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      +[MOTime timetagFromStartDate:endDate:].cold.1();
    v9 = 0;
  }

  return v9;
}

+ (id)buildSimpleMealTagIntervalsForDate:(id)a3
{
  id v3;
  void *v4;
  MOTimeTagInterval *v5;
  id v6;
  void *v7;
  void *v8;
  MOTimeTagInterval *v9;
  MOTimeTagInterval *v10;
  id v11;
  void *v12;
  void *v13;
  MOTimeTagInterval *v14;
  MOTimeTagInterval *v15;
  id v16;
  void *v17;
  void *v18;
  MOTimeTagInterval *v19;
  void *v20;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = [MOTimeTagInterval alloc];
  v6 = objc_alloc(MEMORY[0x1E0CB3588]);
  +[MOTime dateFromDate:hour:](MOTime, "dateFromDate:hour:", v3, 6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithStartDate:duration:", v7, 18000.0);
  v9 = -[MOTimeTagInterval initWithTimeTag:dateInterval:](v5, "initWithTimeTag:dateInterval:", 2000, v8);
  objc_msgSend(v4, "addObject:", v9);

  v10 = [MOTimeTagInterval alloc];
  v11 = objc_alloc(MEMORY[0x1E0CB3588]);
  +[MOTime dateFromDate:hour:](MOTime, "dateFromDate:hour:", v3, 11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithStartDate:duration:", v12, 10800.0);
  v14 = -[MOTimeTagInterval initWithTimeTag:dateInterval:](v10, "initWithTimeTag:dateInterval:", 2001, v13);
  objc_msgSend(v4, "addObject:", v14);

  v15 = [MOTimeTagInterval alloc];
  v16 = objc_alloc(MEMORY[0x1E0CB3588]);
  +[MOTime dateFromDate:hour:](MOTime, "dateFromDate:hour:", v3, 17);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)objc_msgSend(v16, "initWithStartDate:duration:", v17, 14400.0);
  v19 = -[MOTimeTagInterval initWithTimeTag:dateInterval:](v15, "initWithTimeTag:dateInterval:", 2002, v18);
  objc_msgSend(v4, "addObject:", v19);

  v20 = (void *)objc_msgSend(v4, "copy");
  return v20;
}

+ (unint64_t)mealtagFromStartDate:(id)a3 endDate:(id)a4
{
  id v5;
  id v6;
  double v7;
  unint64_t v8;
  id v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  double v16;
  double v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  double v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!v6
    || (objc_msgSend(v5, "isSameDayWithDate:", v6) & 1) != 0
    || (objc_msgSend(v6, "timeIntervalSinceDate:", v5), v7 <= 43200.0))
  {
    +[MOTime buildSimpleMealTagIntervalsForDate:](MOTime, "buildSimpleMealTagIntervalsForDate:", v5);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
    if (v10)
    {
      v12 = v10;
      v13 = *(_QWORD *)v25;
      *(_QWORD *)&v11 = 138413058;
      v23 = v11;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v25 != v13)
            objc_enumerationMutation(v9);
          v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v15, "overlapsScoreForStartDate:endDate:", v5, v6, v23, (_QWORD)v24);
          v17 = v16;
          if (v16 > 0.0)
          {
            _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v23;
              v29 = v5;
              v30 = 2112;
              v31 = v6;
              v32 = 2112;
              v33 = (uint64_t)v15;
              v34 = 2048;
              v35 = v17;
              _os_log_debug_impl(&dword_1CAE42000, v18, OS_LOG_TYPE_DEBUG, "mealType, startDate, %@, endDate, %@, interval, %@, score, %f", buf, 0x2Au);
            }

          }
          if (v17 > 0.7)
          {
            _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              v21 = objc_msgSend(v15, "timetag");
              +[MOTime timeStringFromTimeTag:](MOTime, "timeStringFromTimeTag:", objc_msgSend(v15, "timetag"));
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v23;
              v29 = v5;
              v30 = 2112;
              v31 = v6;
              v32 = 2048;
              v33 = v21;
              v34 = 2112;
              v35 = *(double *)&v22;
              _os_log_debug_impl(&dword_1CAE42000, v19, OS_LOG_TYPE_DEBUG, "mealType, startDate, %@, endDate, %@, timetag, %lu(%@)", buf, 0x2Au);

            }
            v8 = objc_msgSend(v15, "timetag");
            goto LABEL_21;
          }
        }
        v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
        if (v12)
          continue;
        break;
      }
    }
    v8 = 0;
LABEL_21:

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)timeOfDayPrefixFromDate:(id)a3
{
  return +[MOTime timeOfDayPrefixFromStartDate:endDate:](MOTime, "timeOfDayPrefixFromStartDate:endDate:", a3, 0);
}

+ (id)timeOfDayPrefixFromStartDate:(id)a3 endDate:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  NSObject *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  MOTime *v13;
  void *v14;
  void *v15;
  MOTime *v16;
  void *v18;
  int v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  unint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = +[MOTime timetagFromStartDate:endDate:](MOTime, "timetagFromStartDate:endDate:", v5, v6);
  _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    +[MOTime timeStringFromTimeTag:](MOTime, "timeStringFromTimeTag:", v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138413058;
    v20 = v5;
    v21 = 2112;
    v22 = v6;
    v23 = 2048;
    v24 = v7;
    v25 = 2112;
    v26 = v18;
    _os_log_debug_impl(&dword_1CAE42000, v8, OS_LOG_TYPE_DEBUG, "timeOfDay, startDate, %@, endDate, %@, timeTag, %lu(%@)", (uint8_t *)&v19, 0x2Au);

  }
  +[MOTime timeStringFromTimeTag:](MOTime, "timeStringFromTimeTag:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    v11 = v10;
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = [MOTime alloc];
    objc_msgSend(v12, "timeZone");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[MOTime initWithTimestamp:timeString:timeZone:timeTag:](v13, "initWithTimestamp:timeString:timeZone:timeTag:", v9, v15, v7, v11);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)dayOfWeekFromDate:(id)a3
{
  return +[MOTime dayOfWeekFromStartDate:endDate:timeZoneManager:](MOTime, "dayOfWeekFromStartDate:endDate:timeZoneManager:", a3, 0, 0);
}

+ (id)dayOfWeekFromStartDate:(id)a3 endDate:(id)a4 timeZoneManager:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  char v17;
  _BOOL4 v18;
  NSObject *v19;
  NSObject *v20;
  unint64_t v21;
  void *v22;
  double v23;
  double v24;
  MOTime *v25;
  void *v26;
  MOTime *v27;
  int v29;
  id v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      +[MOTime dayOfWeekFromStartDate:endDate:timeZoneManager:].cold.1();

    v18 = v8 != 0;
    goto LABEL_13;
  }
  objc_msgSend(v9, "timeZoneAtDate:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v29 = 138412802;
    v30 = v7;
    v31 = 2112;
    v32 = v11;
    v33 = 2112;
    v34 = v10;
    _os_log_debug_impl(&dword_1CAE42000, v12, OS_LOG_TYPE_DEBUG, "timeZone, startDate, %@, timeZone, %@, source, timeZoneManager, %@", (uint8_t *)&v29, 0x20u);
  }

  if (!v8)
  {
    v18 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v10, "timeZoneAtDate:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    +[MOTime dayOfWeekFromStartDate:endDate:timeZoneManager:].cold.3();

  objc_msgSend(v11, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "isEqualToString:", v16);

  if ((v17 & 1) != 0)
  {

    v18 = 1;
LABEL_13:
    +[MOTime localTimeOfDate:timeZone:](MOTime, "localTimeOfDate:timeZone:", v7, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      +[MOTime localTimeOfDate:timeZone:](MOTime, "localTimeOfDate:timeZone:", v8, v11);
      v20 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = 0;
    }
    v21 = +[MOTime dayOfWeekTagFromStartDate:endDate:](MOTime, "dayOfWeekTagFromStartDate:endDate:", v13, v20);
    +[MOTime timeStringFromTimeTag:](MOTime, "timeStringFromTimeTag:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_msgSend(v7, "timeIntervalSinceReferenceDate");
      v24 = v23;
      v25 = [MOTime alloc];
      objc_msgSend(v11, "name");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[MOTime initWithTimestamp:timeString:timeZone:timeTag:](v25, "initWithTimestamp:timeString:timeZone:timeTag:", v22, v26, v21, v24);

    }
    else
    {
      v27 = 0;
    }

    goto LABEL_20;
  }
  _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    +[MOTime dayOfWeekFromStartDate:endDate:timeZoneManager:].cold.2();
  v27 = 0;
LABEL_20:

  return v27;
}

+ (id)timeStringFromTimeTag:(unint64_t)a3
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  id result;

  if ((uint64_t)a3 <= 1999)
  {
    switch(a3)
    {
      case 'd':
        result = CFSTR("today");
        break;
      case 'e':
        result = CFSTR("yesterday");
        break;
      case 'f':
        result = CFSTR("Sunday");
        break;
      case 'g':
        result = CFSTR("Monday");
        break;
      case 'h':
        result = CFSTR("Tuesday");
        break;
      case 'i':
        result = CFSTR("Wednesday");
        break;
      case 'j':
        result = CFSTR("Thursday");
        break;
      case 'k':
        result = CFSTR("Friday");
        break;
      case 'l':
        result = CFSTR("Saturday");
        break;
      case 'm':
        result = CFSTR("this week");
        break;
      case 'n':
        result = CFSTR("last week");
        break;
      case 'o':
        result = CFSTR("this month");
        break;
      case 'p':
        result = CFSTR("last month");
        break;
      case 'q':
        result = CFSTR("this year");
        break;
      case 'r':
        result = CFSTR("last year");
        break;
      default:
        switch(a3)
        {
          case 2uLL:
            result = CFSTR("morning");
            break;
          case 3uLL:
            result = CFSTR("prenoon");
            break;
          case 4uLL:
            result = CFSTR("afternoon");
            break;
          case 5uLL:
            result = CFSTR("preevening");
            break;
          case 6uLL:
            result = CFSTR("evening");
            break;
          case 7uLL:
            result = CFSTR("night");
            break;
          case 8uLL:
            result = CFSTR("midnight");
            break;
          default:
            result = 0;
            break;
        }
        break;
    }
  }
  else
  {
    v3 = CFSTR("dinner");
    v4 = CFSTR("weekend");
    if (a3 != 10001)
      v4 = 0;
    if (a3 == 10000)
      v5 = CFSTR("weekday");
    else
      v5 = v4;
    if (a3 != 2002)
      v3 = v5;
    v6 = CFSTR("breakfast");
    v7 = CFSTR("lunch");
    if (a3 != 2001)
      v7 = 0;
    if (a3 != 2000)
      v6 = v7;
    if ((uint64_t)a3 <= 2001)
      return (id)v6;
    else
      return (id)v3;
  }
  return result;
}

+ (id)localizedDateStringFromDate:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:", a3, 2, 0);
}

+ (unint64_t)typeOfDayTagFromStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  NSObject *v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  void *v19;
  double v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  id v27;
  _BYTE buf[12];
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v7)
  {
    if (v8 && objc_msgSend(v8, "isBeforeDate:", v7))
    {
      _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v7;
        v29 = 2112;
        v30 = v8;
        v31 = 2112;
        v32 = v9;
        _os_log_impl(&dword_1CAE42000, v10, OS_LOG_TYPE_INFO, "typeOfDayTagFromStartDate, startDate, %@, endDate, %@, timeZone, %@, the timestamps are inverted.", buf, 0x20u);
      }

      v8 = 0;
    }
    if (v9)
    {
      +[MOTime localTimeOfDate:timeZone:](MOTime, "localTimeOfDate:timeZone:", v7, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
        goto LABEL_17;
      +[MOTime localTimeOfDate:timeZone:](MOTime, "localTimeOfDate:timeZone:", v8, v9);
      v12 = objc_claimAutoreleasedReturnValue();

      v8 = (id)v12;
      if (!v12)
        goto LABEL_17;
    }
    else
    {
      v11 = v7;
      if (!v8)
        goto LABEL_17;
    }
    if (objc_msgSend(v8, "isBeforeDate:", v11))
    {
      _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v11;
        v29 = 2112;
        v30 = v8;
        v31 = 2112;
        v32 = v9;
        _os_log_impl(&dword_1CAE42000, v14, OS_LOG_TYPE_INFO, "typeOfDayTagFromStartDate, startDate, %@, endDate, %@, timeZone, %@, the timestamps are inverted after time zone shifting.", buf, 0x20u);
      }

      v8 = 0;
    }
LABEL_17:
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    *(_QWORD *)buf = 0;
    v16 = objc_msgSend(v15, "rangeOfWeekendStartDate:interval:containingDate:", &v27, buf, v11);
    v17 = v27;
    v18 = v17;
    if (!v8)
    {
      if (v16)
        v13 = 10001;
      else
        v13 = 0;
      goto LABEL_34;
    }
    if (!v17)
    {
      v13 = 0;
LABEL_34:

      goto LABEL_35;
    }
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v11, v8);
    objc_msgSend(v19, "duration");
    if (v20 == 0.0)
    {
      v13 = 0;
LABEL_33:

      goto LABEL_34;
    }
    v21 = objc_alloc(MEMORY[0x1E0CB3588]);
    v22 = (void *)objc_msgSend(v21, "initWithStartDate:duration:", v18, *(double *)buf);
    if (objc_msgSend(v19, "intersectsDateInterval:", v22))
    {
      objc_msgSend(v19, "startDate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v22, "containsDate:", v23) & 1) != 0)
      {
        objc_msgSend(v19, "endDate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v22, "containsDate:", v24);

        if (v25)
          v13 = 10001;
        else
          v13 = 0;
        goto LABEL_32;
      }

    }
    v13 = 0;
LABEL_32:

    goto LABEL_33;
  }
  v13 = 0;
LABEL_35:

  return v13;
}

+ (unint64_t)dayOfWeekTagFromStartDate:(id)a3 endDate:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;

  v5 = a3;
  v6 = a4;
  if (v6 && !objc_msgSend(v5, "isSameDayWithDate:", v6))
    v7 = 0;
  else
    v7 = +[MOTime dayOfWeekTagFromDate:](MOTime, "dayOfWeekTagFromDate:", v5);

  return v7;
}

+ (unint64_t)dayOfWeekTagFromDate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  unint64_t v7;
  NSObject *v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFirstWeekday:", 1);
  objc_msgSend(v4, "components:fromDate:", 512, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    +[MOTime dayOfWeekTagFromDate:].cold.2((uint64_t)v3, v5, v6);

  if (objc_msgSend(v5, "weekday") == 1)
  {
    v7 = 102;
  }
  else if (objc_msgSend(v5, "weekday") == 2)
  {
    v7 = 103;
  }
  else if (objc_msgSend(v5, "weekday") == 3)
  {
    v7 = 104;
  }
  else if (objc_msgSend(v5, "weekday") == 4)
  {
    v7 = 105;
  }
  else if (objc_msgSend(v5, "weekday") == 5)
  {
    v7 = 106;
  }
  else if (objc_msgSend(v5, "weekday") == 6)
  {
    v7 = 107;
  }
  else if (objc_msgSend(v5, "weekday") == 7)
  {
    v7 = 108;
  }
  else
  {
    _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[MOTime dayOfWeekTagFromDate:].cold.1((uint64_t)v3, v5, v8);

    v7 = 0;
  }

  return v7;
}

+ (unint64_t)dateReferenceTagFromStartDate:(id)a3 endDate:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  unint64_t v9;

  v5 = (void *)MEMORY[0x1E0C99D68];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[MOTime dateReferenceTagFromStartDate:endDate:nowDate:timeZone:](MOTime, "dateReferenceTagFromStartDate:endDate:nowDate:timeZone:", v7, v6, v8, 0);

  return v9;
}

+ (unint64_t)dateReferenceTagFromStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  unint64_t v12;

  v7 = (void *)MEMORY[0x1E0C99D68];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v7, "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = +[MOTime dateReferenceTagFromStartDate:endDate:nowDate:timeZone:](MOTime, "dateReferenceTagFromStartDate:endDate:nowDate:timeZone:", v10, v9, v11, v8);

  return v12;
}

+ (unint64_t)dateReferenceTagFromStartDate:(id)a3 endDate:(id)a4 nowDate:(id)a5 timeZone:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void *v18;
  id v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = v12;
  if (v9 && v12)
  {
    +[MOTime localTimeOfDate:timeZone:](MOTime, "localTimeOfDate:timeZone:", v9, v12);
    v14 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v14;
  }
  if (v10 && v13)
  {
    +[MOTime localTimeOfDate:timeZone:](MOTime, "localTimeOfDate:timeZone:", v10, v13);
    v15 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v15;
  }
  if ((objc_msgSend(v11, "isBeforeDate:", v9) & 1) != 0)
    goto LABEL_10;
  if (!v10)
  {
    if ((objc_msgSend(v11, "isSameDayWithDate:", v9) & 1) != 0)
    {
LABEL_22:
      v16 = 100;
      goto LABEL_11;
    }
    if ((objc_msgSend(v11, "isFollowingDayAfterDate:", v9) & 1) != 0)
    {
LABEL_25:
      v16 = 101;
      goto LABEL_11;
    }
    if ((objc_msgSend(v11, "isSameWeekWithDate:", v9) & 1) != 0)
    {
LABEL_30:
      v16 = 109;
      goto LABEL_11;
    }
    if ((objc_msgSend(v11, "isFollowingWeekAfterDate:", v9) & 1) != 0)
    {
LABEL_33:
      v16 = 110;
      goto LABEL_11;
    }
    if ((objc_msgSend(v11, "isSameMonthWithDate:", v9) & 1) != 0)
    {
LABEL_38:
      v16 = 111;
      goto LABEL_11;
    }
    if ((objc_msgSend(v11, "isFollowingMonthAfterDate:", v9) & 1) != 0)
    {
LABEL_41:
      v16 = 112;
      goto LABEL_11;
    }
    if ((objc_msgSend(v11, "isSameYearWithDate:", v9) & 1) != 0)
    {
LABEL_46:
      v16 = 113;
      goto LABEL_11;
    }
    v18 = v11;
    v19 = v9;
LABEL_49:
    if ((objc_msgSend(v18, "isFollowingYearAfterDate:", v19) & 1) != 0)
    {
      v16 = 114;
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if ((objc_msgSend(v11, "isBeforeDate:", v10) & 1) == 0)
  {
    if (objc_msgSend(v11, "isSameDayWithDate:", v9)
      && (objc_msgSend(v11, "isSameDayWithDate:", v10) & 1) != 0)
    {
      goto LABEL_22;
    }
    if ((objc_msgSend(v11, "isFollowingDayAfterDate:", v9) & 1) != 0)
    {
      if ((objc_msgSend(v11, "isFollowingDayAfterDate:", v10) & 1) != 0)
        goto LABEL_25;
      if (!objc_msgSend(v11, "isSameWeekWithDate:", v9))
        goto LABEL_31;
    }
    else if ((objc_msgSend(v11, "isSameWeekWithDate:", v9) & 1) == 0)
    {
      goto LABEL_31;
    }
    if ((objc_msgSend(v11, "isSameWeekWithDate:", v10) & 1) != 0)
      goto LABEL_30;
LABEL_31:
    if ((objc_msgSend(v11, "isFollowingWeekAfterDate:", v9) & 1) != 0)
    {
      if ((objc_msgSend(v11, "isFollowingWeekAfterDate:", v10) & 1) != 0)
        goto LABEL_33;
      if (!objc_msgSend(v11, "isSameMonthWithDate:", v9))
        goto LABEL_39;
    }
    else if ((objc_msgSend(v11, "isSameMonthWithDate:", v9) & 1) == 0)
    {
      goto LABEL_39;
    }
    if ((objc_msgSend(v11, "isSameMonthWithDate:", v10) & 1) != 0)
      goto LABEL_38;
LABEL_39:
    if ((objc_msgSend(v11, "isFollowingMonthAfterDate:", v9) & 1) != 0)
    {
      if ((objc_msgSend(v11, "isFollowingMonthAfterDate:", v10) & 1) != 0)
        goto LABEL_41;
      if (objc_msgSend(v11, "isSameYearWithDate:", v9))
      {
LABEL_45:
        if ((objc_msgSend(v11, "isSameYearWithDate:", v10) & 1) != 0)
          goto LABEL_46;
      }
    }
    else if ((objc_msgSend(v11, "isSameYearWithDate:", v9) & 1) != 0)
    {
      goto LABEL_45;
    }
    if ((objc_msgSend(v11, "isFollowingYearAfterDate:", v9) & 1) == 0)
      goto LABEL_10;
    v18 = v11;
    v19 = v10;
    goto LABEL_49;
  }
LABEL_10:
  v16 = 1;
LABEL_11:

  return v16;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MOTime identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOTime timestamp](self, "timestamp");
  v6 = v5;
  -[MOTime timeString](self, "timeString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOTime timeZone](self, "timeZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOTime localTime](self, "localTime");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<MOTime identifier, %@, timestamp, %f, timeString, %@, timeZone, %@, localTime, %@, timeTag, %lu, dateReferenceTag, %lu>"), v4, v6, v7, v8, v9, -[MOTime timeTag](self, "timeTag"), -[MOTime dateReferenceTag](self, "dateReferenceTag"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MOTime)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  MOTime *v12;
  MOTime *v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timestamp"));
  v7 = v6;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeString"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeZone"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("timeTag"));
  v11 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("dateReferenceTag"));

  v12 = -[MOTime initWithIdentifier:timestamp:timeString:timeZone:timeTag:](self, "initWithIdentifier:timestamp:timeString:timeZone:timeTag:", v5, v8, v9, v10, v7);
  v13 = v12;
  if (v12)
    -[MOTime setDateReferenceTag:](v12, "setDateReferenceTag:", v11);

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("timestamp"), self->_timestamp);
  objc_msgSend(v5, "encodeObject:forKey:", self->_timeString, CFSTR("timeString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timeZone, CFSTR("timeZone"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_timeTag, CFSTR("timeTag"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_dateReferenceTag, CFSTR("dateReferenceTag"));

}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[MOTime identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  MOTime *v5;
  MOTime *v6;
  MOTime *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v5 = (MOTime *)a3;
  v6 = v5;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = v6;
        -[MOTime identifier](self, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8 || (-[MOTime identifier](v7, "identifier"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          -[MOTime identifier](self, "identifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[MOTime identifier](v7, "identifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v9, "isEqual:", v10);

          if (v8)
          {
LABEL_12:

            goto LABEL_13;
          }
        }
        else
        {
          v11 = 1;
        }

        goto LABEL_12;
      }
    }
    v11 = 0;
  }
LABEL_13:

  return v11;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (NSString)timeString
{
  return self->_timeString;
}

- (NSString)timeZone
{
  return self->_timeZone;
}

- (unint64_t)timeTag
{
  return self->_timeTag;
}

- (unint64_t)dateReferenceTag
{
  return self->_dateReferenceTag;
}

- (void)setDateReferenceTag:(unint64_t)a3
{
  self->_dateReferenceTag = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_timeString, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithIdentifier:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = 136315394;
  v2 = "-[MOTime initWithIdentifier:]";
  v3 = 1024;
  v4 = 102;
  _os_log_error_impl(&dword_1CAE42000, log, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier (in %s:%d)", (uint8_t *)&v1, 0x12u);
  OUTLINED_FUNCTION_2();
}

+ (void)timeFromStartDate:endDate:timeZoneManager:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1CAE42000, v0, v1, "timeZone, date, %@, timeZone, %@, source, system");
  OUTLINED_FUNCTION_2();
}

+ (void)timetagFromStartDate:endDate:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1CAE42000, v0, v1, "timeOfDay, startDate, %@, endDate, %@, skip");
  OUTLINED_FUNCTION_2();
}

+ (void)dayOfWeekFromStartDate:endDate:timeZoneManager:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1CAE42000, v0, v1, "timeZone, startDate, %@, timeZone, %@, source, system");
  OUTLINED_FUNCTION_2();
}

+ (void)dayOfWeekFromStartDate:endDate:timeZoneManager:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1CAE42000, v0, v1, "timeZone crossing, timeZone, %@, endTimeZone, %@");
  OUTLINED_FUNCTION_2();
}

+ (void)dayOfWeekFromStartDate:endDate:timeZoneManager:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1CAE42000, v0, v1, "timeZone, endDate, %@, timeZone, %@, source, system");
  OUTLINED_FUNCTION_2();
}

+ (void)dayOfWeekTagFromDate:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint8_t v4[24];

  OUTLINED_FUNCTION_5_0(a1, a2);
  OUTLINED_FUNCTION_3_0();
  _os_log_error_impl(&dword_1CAE42000, a3, OS_LOG_TYPE_ERROR, "dayOfWeekTagFromDate, cannot read weekday, date, %@, weekday, %lu", v4, 0x16u);
  OUTLINED_FUNCTION_4();
}

+ (void)dayOfWeekTagFromDate:(NSObject *)a3 .cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  uint8_t v4[24];

  OUTLINED_FUNCTION_5_0(a1, a2);
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_1CAE42000, a3, OS_LOG_TYPE_DEBUG, "dayOfWeekTagFromDate, date, %@, weekday, %lu", v4, 0x16u);
  OUTLINED_FUNCTION_4();
}

@end
