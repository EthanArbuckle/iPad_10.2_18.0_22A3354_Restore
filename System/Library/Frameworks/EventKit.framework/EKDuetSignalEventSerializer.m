@implementation EKDuetSignalEventSerializer

+ (id)serializedEventWithEvent:(id)a3
{
  id v3;
  void *v4;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t i;
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
  uint64_t j;
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
  uint64_t v51;
  void *v52;
  const __CFString *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v59;
  id v60;
  id obj;
  id obja;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _QWORD v77[4];
  id v78;
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("title"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "isAllDay"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("isAllDay"));

  objc_msgSend(v3, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v3, "startDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startTimeZone");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "componentsForDate:inTimeZone:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("startDate"));

  }
  objc_msgSend(v3, "endDateUnadjustedForLegacyClients");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v3, "endDateUnadjustedForLegacyClients");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endTimeZone");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "componentsForDate:inTimeZone:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("endDate"));

  }
  objc_msgSend(v3, "location");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v3, "location");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("location"));

  }
  objc_msgSend(v3, "attendees");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v3, "attendees");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "arrayWithCapacity:", objc_msgSend(v20, "count"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "attendees");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v77[0] = MEMORY[0x1E0C809B0];
    v77[1] = 3221225472;
    v77[2] = __56__EKDuetSignalEventSerializer_serializedEventWithEvent___block_invoke;
    v77[3] = &unk_1E4787770;
    v78 = v21;
    v23 = v21;
    objc_msgSend(v22, "enumerateObjectsUsingBlock:", v77);

    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("attendees"));
  }
  objc_msgSend(v3, "recurrenceRules");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v68 = v4;
  v59 = v3;
  if (v24)
  {
    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    objc_msgSend(v3, "recurrenceRules");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v80, 16);
    if (v66)
    {
      v25 = 0;
      v64 = *(_QWORD *)v74;
      do
      {
        for (i = 0; i != v66; ++i)
        {
          if (*(_QWORD *)v74 != v64)
            objc_enumerationMutation(obj);
          v27 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rrule_%d_frequency"), v25 + i);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rrule_%d_interval"), v25 + i);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rrule_%d_end"), v25 + i);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v27, "frequency"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "setObject:forKey:", v31, v28);

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v27, "interval"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "setObject:forKey:", v32, v29);

          v33 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v27, "recurrenceEnd");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "numberWithInt:", v34 == 0);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "setObject:forKey:", v35, v30);

        }
        v25 = (v25 + i);
        v66 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v80, 16);
      }
      while (v66);
    }

    v4 = v68;
    v3 = v59;
  }
  objc_msgSend(v3, "alarms");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    objc_msgSend(v3, "alarms");
    v60 = (id)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v69, v79, 16);
    if (v65)
    {
      v67 = 0;
      obja = *(id *)v70;
      do
      {
        for (j = 0; j != v65; ++j)
        {
          if (*(id *)v70 != obja)
            objc_enumerationMutation(v60);
          v38 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * j);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("alarm_%d_absoluteDate"), v67 + j);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("alarm_%d_relativeOffset"), v67 + j);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("alarm_%d_locationTitle"), v67 + j);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("alarm_%d_proximity"), v67 + j);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "absoluteDate");
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          if (v43)
            objc_msgSend(v38, "absoluteDate");
          else
            objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "componentsForDate:inTimeZone:", v44, v45);
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          v4 = v68;
          objc_msgSend(v68, "setObject:forKey:", v46, v39);
          v47 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v38, "relativeOffset");
          objc_msgSend(v47, "numberWithDouble:");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "setObject:forKey:", v48, v40);

          objc_msgSend(v38, "structuredLocation");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          if (v49)
          {
            objc_msgSend(v38, "structuredLocation");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "title");
            v51 = objc_claimAutoreleasedReturnValue();
            v52 = (void *)v51;
            if (v51)
              v53 = (const __CFString *)v51;
            else
              v53 = &stru_1E4789A58;
            objc_msgSend(v68, "setObject:forKey:", v53, v41);

            v4 = v68;
          }
          else
          {
            objc_msgSend(v68, "setObject:forKey:", &stru_1E4789A58, v41);
          }

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v38, "proximity"));
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKey:", v54, v42);

        }
        v65 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v69, v79, 16);
        v67 = (v67 + j);
      }
      while (v65);
    }

    v3 = v59;
  }
  objc_msgSend(v3, "calendar");
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  if (v55)
  {
    objc_msgSend(v3, "calendar");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "calendarIdentifier");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v57, CFSTR("calendar"));

  }
  return v4;
}

void __56__EKDuetSignalEventSerializer_serializedEventWithEvent___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "absoluteString");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v5;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    v4 = v5;
  }

}

+ (id)componentsForDate:(id)a3 inTimeZone:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v5 = (objc_class *)MEMORY[0x1E0C99D48];
  v6 = a4;
  v7 = a3;
  v8 = [v5 alloc];
  v9 = (void *)objc_msgSend(v8, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  objc_msgSend(v9, "setTimeZone:", v6);

  objc_msgSend(v9, "components:fromDate:", 3145854, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
