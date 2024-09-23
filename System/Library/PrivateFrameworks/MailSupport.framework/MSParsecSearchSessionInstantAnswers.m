@implementation MSParsecSearchSessionInstantAnswers

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__MSParsecSearchSessionInstantAnswers_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_0 != -1)
    dispatch_once(&log_onceToken_0, block);
  return (id)log_log_0;
}

void __42__MSParsecSearchSessionInstantAnswers_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_0;
  log_log_0 = (uint64_t)v1;

}

+ (id)sfFlightStatusToString:(int)a3
{
  if ((a3 - 1) > 8)
    return CFSTR("unknown");
  else
    return off_1E716E088[a3 - 1];
}

+ (id)dictionaryFromTimezone:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("name"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "secondsFromGMT"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("secondsFromGMT"));

  return v4;
}

+ (id)formattedDate:(id)a3 withTimezone:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v16;

  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x1BCCCCE68]();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MSParsecSearchSessionInstantAnswers.m"), 78, CFSTR("Can't create formattedDate, date is nil"));

  }
  v10 = (void *)objc_opt_new();
  v11 = v10;
  if (v8)
  {
    objc_msgSend(v10, "setTimeZone:", v8);
    v12 = objc_msgSend(v11, "formatOptions") | 0x40;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTimeZone:", v13);

    v12 = objc_msgSend(v11, "formatOptions") & 0xFFFFFFFFFFFFFFBFLL;
  }
  objc_msgSend(v11, "setFormatOptions:", v12);
  objc_msgSend(v11, "stringFromDate:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v9);
  return v14;
}

+ (id)sfAirportToDictionnary:(id)a3
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

  v4 = a3;
  v5 = (void *)MEMORY[0x1BCCCCE68]();
  v6 = (void *)objc_opt_new();
  objc_msgSend(v4, "code");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("code"));
  if (!v7)

  objc_msgSend(v4, "timezone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dictionaryFromTimezone:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("timezone"));
  if (!v10)

  objc_msgSend(v4, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("name"));
  if (!v12)

  v14 = (void *)objc_msgSend(v6, "copy");
  objc_autoreleasePoolPop(v5);

  return v14;
}

+ (id)sfFlightsToDictionary:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const char *v10;
  id v11;
  void *v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
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
  void *v43;
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
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  id v61;
  id obj;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *context;
  uint64_t v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  void *v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _BYTE v99[128];
  _BYTE v100[128];
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  v61 = a3;
  v67 = (void *)objc_opt_new();
  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  obj = v61;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v100, 16, v61);
  if (v3)
  {
    v66 = *(_QWORD *)v96;
    do
    {
      v4 = 0;
      v65 = v3;
      do
      {
        if (*(_QWORD *)v96 != v66)
          objc_enumerationMutation(obj);
        v70 = v4;
        v5 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * v4);
        context = (void *)MEMORY[0x1BCCCCE68]();
        v71 = (void *)objc_opt_new();
        objc_msgSend(v5, "flightNumber");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        if (!v6)
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = v64;
        }
        objc_msgSend(v71, "setObject:forKeyedSubscript:", v7, CFSTR("flightNumber"));
        if (!v6)

        objc_msgSend(v5, "carrierCode");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (!v8)
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = v63;
        }
        objc_msgSend(v71, "setObject:forKeyedSubscript:", v9, CFSTR("carrierCode"));
        if (!v8)

        v10 = NSSelectorFromString(CFSTR("carrierWebsite"));
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v5, v10);
          v11 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v11 = 0;
        }
        v88 = (void *)objc_opt_new();
        v93 = 0u;
        v94 = 0u;
        v91 = 0u;
        v92 = 0u;
        objc_msgSend(v5, "legs");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v89 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v91, v99, 16);
        if (v89)
        {
          v87 = *(_QWORD *)v92;
          v72 = v12;
          do
          {
            for (i = 0; i != v89; ++i)
            {
              if (*(_QWORD *)v92 != v87)
                objc_enumerationMutation(v72);
              v14 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * i);
              v15 = (void *)objc_opt_new();
              +[MSParsecSearchSessionInstantAnswers sfFlightStatusToString:](MSParsecSearchSessionInstantAnswers, "sfFlightStatusToString:", objc_msgSend(v14, "status"));
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = v16;
              if (!v16)
              {
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v85 = (void *)objc_claimAutoreleasedReturnValue();
                v17 = v85;
              }
              objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, CFSTR("status"));
              if (!v16)

              objc_msgSend(v14, "title");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = v18;
              if (!v18)
              {
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v84 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = v84;
              }
              objc_msgSend(v15, "setObject:forKeyedSubscript:", v19, CFSTR("title"));
              if (!v18)

              objc_msgSend(v14, "departurePublishedTime");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "departureAirport");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "timezone");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              +[MSParsecSearchSessionInstantAnswers formattedDate:withTimezone:](MSParsecSearchSessionInstantAnswers, "formattedDate:withTimezone:", v20, v22);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = v23;
              if (!v23)
              {
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v83 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = v83;
              }
              objc_msgSend(v15, "setObject:forKeyedSubscript:", v24, CFSTR("departurePublishedTime"));
              if (!v23)

              objc_msgSend(v14, "departureActualTime");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "departureAirport");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "timezone");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              +[MSParsecSearchSessionInstantAnswers formattedDate:withTimezone:](MSParsecSearchSessionInstantAnswers, "formattedDate:withTimezone:", v25, v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = v28;
              if (!v28)
              {
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v82 = (void *)objc_claimAutoreleasedReturnValue();
                v29 = v82;
              }
              objc_msgSend(v15, "setObject:forKeyedSubscript:", v29, CFSTR("departureActualTime"));
              if (!v28)

              objc_msgSend(v14, "departureTerminal");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = v30;
              if (!v30)
              {
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v81 = (void *)objc_claimAutoreleasedReturnValue();
                v31 = v81;
              }
              objc_msgSend(v15, "setObject:forKeyedSubscript:", v31, CFSTR("departureTerminal"));
              if (!v30)

              objc_msgSend(v14, "departureGate");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = v32;
              if (!v32)
              {
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v80 = (void *)objc_claimAutoreleasedReturnValue();
                v33 = v80;
              }
              objc_msgSend(v15, "setObject:forKeyedSubscript:", v33, CFSTR("departureGate"));
              if (!v32)

              objc_msgSend(v14, "arrivalPublishedTime");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "arrivalAirport");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "timezone");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              +[MSParsecSearchSessionInstantAnswers formattedDate:withTimezone:](MSParsecSearchSessionInstantAnswers, "formattedDate:withTimezone:", v34, v36);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = v37;
              if (!v37)
              {
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v79 = (void *)objc_claimAutoreleasedReturnValue();
                v38 = v79;
              }
              objc_msgSend(v15, "setObject:forKeyedSubscript:", v38, CFSTR("arrivalPublishedTime"));
              if (!v37)

              objc_msgSend(v14, "arrivalActualTime");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "arrivalAirport");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "timezone");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              +[MSParsecSearchSessionInstantAnswers formattedDate:withTimezone:](MSParsecSearchSessionInstantAnswers, "formattedDate:withTimezone:", v39, v41);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = v42;
              if (!v42)
              {
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v78 = (void *)objc_claimAutoreleasedReturnValue();
                v43 = v78;
              }
              objc_msgSend(v15, "setObject:forKeyedSubscript:", v43, CFSTR("arrivalActualTime"));
              if (!v42)

              objc_msgSend(v14, "arrivalTerminal");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              v45 = v44;
              if (!v44)
              {
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v77 = (void *)objc_claimAutoreleasedReturnValue();
                v45 = v77;
              }
              objc_msgSend(v15, "setObject:forKeyedSubscript:", v45, CFSTR("arrivalTerminal"));
              if (!v44)

              objc_msgSend(v14, "arrivalGate");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              v47 = v46;
              if (!v46)
              {
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                v47 = v76;
              }
              objc_msgSend(v15, "setObject:forKeyedSubscript:", v47, CFSTR("arrivalGate"));
              if (!v46)

              objc_msgSend(v14, "departureAirport");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              +[MSParsecSearchSessionInstantAnswers sfAirportToDictionnary:](MSParsecSearchSessionInstantAnswers, "sfAirportToDictionnary:", v48);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              v50 = v49;
              if (!v49)
              {
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                v50 = v75;
              }
              objc_msgSend(v15, "setObject:forKeyedSubscript:", v50, CFSTR("departureAirport"));
              if (!v49)

              objc_msgSend(v14, "arrivalAirport");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              +[MSParsecSearchSessionInstantAnswers sfAirportToDictionnary:](MSParsecSearchSessionInstantAnswers, "sfAirportToDictionnary:", v51);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              v53 = v52;
              if (!v52)
              {
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                v53 = v74;
              }
              objc_msgSend(v15, "setObject:forKeyedSubscript:", v53, CFSTR("arrivalAirport"));
              if (!v52)

              objc_msgSend(v14, "divertedAirport");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(a1, "sfAirportToDictionnary:", v54);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              v56 = v55;
              if (!v55)
              {
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                v56 = v73;
              }
              objc_msgSend(v15, "setObject:forKeyedSubscript:", v56, CFSTR("divertedAirport"));
              if (!v55)

              v57 = v11;
              if (!v11)
              {
                objc_msgSend(MEMORY[0x1E0C99E38], "null", 0);
                v90 = (void *)objc_claimAutoreleasedReturnValue();
                v57 = v90;
              }
              objc_msgSend(v15, "setObject:forKeyedSubscript:", v57, CFSTR("carrierWebsite"));
              if (!v11)

              objc_msgSend(v88, "addObject:", v15);
            }
            v12 = v72;
            v89 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v91, v99, 16);
          }
          while (v89);
        }

        v58 = v88;
        if (!v88)
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = v68;
        }
        objc_msgSend(v71, "setObject:forKeyedSubscript:", v58, CFSTR("legs"));
        if (!v88)

        objc_msgSend(v67, "addObject:", v71);
        objc_autoreleasePoolPop(context);
        v4 = v70 + 1;
      }
      while (v70 + 1 != v65);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v100, 16);
    }
    while (v3);
  }

  v59 = (void *)objc_msgSend(v67, "copy");
  return v59;
}

+ (id)flightInformationWithAirlineCode:(id)a3 flightNumber:(id)a4 flightDate:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  const __CFString *v15;
  NSObject *v16;
  void *v17;
  dispatch_semaphore_t v18;
  dispatch_time_t v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  id v24;
  const char *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  _QWORD v40[4];
  NSObject *v41;
  uint64_t *v42;
  uint8_t *v43;
  uint8_t buf[8];
  uint8_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  _QWORD v56[3];
  _QWORD v57[3];
  void *v58;
  uint8_t v59[4];
  uint64_t v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy_;
  v54 = __Block_byref_object_dispose_;
  v55 = 0;
  if (!v9)
  {
    +[MSParsecSearchSessionInstantAnswers log](MSParsecSearchSessionInstantAnswers, "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      goto LABEL_22;
    *(_WORD *)buf = 0;
    v25 = "[instant answers][flights api] Can't get flightInformation, airlineCode is nil";
LABEL_21:
    _os_log_impl(&dword_1B9D1A000, v13, OS_LOG_TYPE_DEFAULT, v25, buf, 2u);
    goto LABEL_22;
  }
  if (!v10)
  {
    +[MSParsecSearchSessionInstantAnswers log](MSParsecSearchSessionInstantAnswers, "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      goto LABEL_22;
    *(_WORD *)buf = 0;
    v25 = "[instant answers][flights api] Can't get flightInformation, flightNumber is nil";
    goto LABEL_21;
  }
  if (!v11)
  {
    +[MSParsecSearchSessionInstantAnswers log](MSParsecSearchSessionInstantAnswers, "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v25 = "[instant answers][flights api] Can't get flightInformation, flightDate is nil";
      goto LABEL_21;
    }
LABEL_22:
    v24 = 0;
    goto LABEL_34;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v9, v10);
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bundleIdentifier");
    v15 = (const __CFString *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      +[MSParsecSearchSessionInstantAnswers log](MSParsecSearchSessionInstantAnswers, "log");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B9D1A000, v16, OS_LOG_TYPE_DEFAULT, "[instant answers][flights api] bundleIdentifier is undefined.", buf, 2u);
      }

      v15 = CFSTR("com.apple.undefined");
    }
    v38 = v15;
    objc_msgSend(MEMORY[0x1E0D177B0], "flightRequestForQuery:date:appBundleId:", v13, v12, v15);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v39)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MSParsecSearchSessionInstantAnswers.m"), 164, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request"));

    }
    v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D177E0]), "initWithId:userAgent:", CFSTR("com.apple.mail"), CFSTR("mail/1"));
    objc_msgSend(v37, "setParsecEnabled:", 1);
    objc_msgSend(v37, "setDontPreloadImages:", 1);
    objc_msgSend(MEMORY[0x1E0D177D8], "sessionWithConfiguration:", v37);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    v45 = buf;
    v46 = 0x3032000000;
    v47 = __Block_byref_object_copy_;
    v48 = __Block_byref_object_dispose_;
    v49 = 0;
    v18 = dispatch_semaphore_create(0);
    v19 = dispatch_time(0, 500000000);
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __96__MSParsecSearchSessionInstantAnswers_flightInformationWithAirlineCode_flightNumber_flightDate___block_invoke;
    v40[3] = &unk_1E716E068;
    v42 = &v50;
    v43 = buf;
    v20 = v18;
    v41 = v20;
    v36 = v17;
    objc_msgSend(v17, "taskWithRequest:completion:", v39, v40);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v38;
    objc_msgSend(v21, "resume");
    if (dispatch_semaphore_wait(v20, v19))
    {
      +[MSParsecSearchSessionInstantAnswers log](MSParsecSearchSessionInstantAnswers, "log");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v59 = 67109120;
        LODWORD(v60) = 500;
        _os_log_impl(&dword_1B9D1A000, v23, OS_LOG_TYPE_DEFAULT, "[instant answers][flights api] coreparsec request timed out (timeout = %d ms)", v59, 8u);
      }

      v24 = (id)MEMORY[0x1E0C9AA60];
    }
    else
    {
      +[MSParsecSearchSessionInstantAnswers log](MSParsecSearchSessionInstantAnswers, "log");
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = objc_msgSend((id)v51[5], "count");
        *(_DWORD *)v59 = 134217984;
        v60 = v27;
        _os_log_impl(&dword_1B9D1A000, v26, OS_LOG_TYPE_DEFAULT, "[instant answers][flights api] coreparsec results count = %lu", v59, 0xCu);
      }

      if (!objc_msgSend((id)v51[5], "count"))
      {
        v28 = (void *)*((_QWORD *)v45 + 5);
        if (v28)
        {
          v57[0] = CFSTR("error");
          v56[0] = CFSTR("type");
          v56[1] = CFSTR("errorCode");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v28, "code"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v57[1] = v29;
          v56[2] = CFSTR("userInfo");
          objc_msgSend(*((id *)v45 + 5), "userInfo");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v57[2] = v35;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56, 3);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = v30;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v58, 1);
          v31 = objc_claimAutoreleasedReturnValue();
          v32 = (void *)v51[5];
          v51[5] = v31;

        }
      }
      v24 = (id)v51[5];
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    +[MSParsecSearchSessionInstantAnswers log](MSParsecSearchSessionInstantAnswers, "log");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B9D1A000, v22, OS_LOG_TYPE_DEFAULT, "[instant answers][flights api] Can't get flightInformation, query is malformed", buf, 2u);
    }
    v24 = 0;
  }

LABEL_34:
  _Block_object_dispose(&v50, 8);

  return v24;
}

void __96__MSParsecSearchSessionInstantAnswers_flightInformationWithAirlineCode_flightNumber_flightDate___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "flightResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    +[MSParsecSearchSessionInstantAnswers log](MSParsecSearchSessionInstantAnswers, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1B9D1A000, v9, OS_LOG_TYPE_DEFAULT, "[instant answers][flights api] empty coreparsec response for flight", (uint8_t *)&v14, 2u);
    }

  }
  +[MSParsecSearchSessionInstantAnswers sfFlightsToDictionary:](MSParsecSearchSessionInstantAnswers, "sfFlightsToDictionary:", v8);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a4);
    +[MSParsecSearchSessionInstantAnswers log](MSParsecSearchSessionInstantAnswers, "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = v7;
      _os_log_impl(&dword_1B9D1A000, v13, OS_LOG_TYPE_DEFAULT, "[instant answers][flights api] error when calling coreparsec : %@", (uint8_t *)&v14, 0xCu);
    }

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

@end
