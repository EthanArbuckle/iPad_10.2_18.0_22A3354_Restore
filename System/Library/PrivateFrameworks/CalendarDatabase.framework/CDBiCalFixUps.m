@implementation CDBiCalFixUps

+ (BOOL)fixEndDates:(id)a3
{
  int v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  id obj;
  uint64_t v20;
  id v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v21 = a3;
  objc_msgSend(v21, "componentKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  v4 = 0;
  if (v22)
  {
    v20 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v28 != v20)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v21, "componentForKey:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v8 = v7;
        else
          v8 = 0;
        v9 = v8;
        objc_msgSend(v21, "componentOccurrencesForKey:", v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_5);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "filteredArrayUsingPredicate:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
          v4 |= objc_msgSend(a1, "_fixEndDateForEvent:withOriginalEvent:detachments:", v9, v9, v12);
        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        v13 = v12;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v24;
          do
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v24 != v16)
                objc_enumerationMutation(v13);
              v4 |= objc_msgSend(a1, "_fixEndDateForEvent:withOriginalEvent:detachments:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j), v9, v13);
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          }
          while (v15);
        }

      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v22);
  }

  return v4 & 1;
}

uint64_t __29__CDBiCalFixUps_fixEndDates___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (BOOL)_fixEndDateForEvent:(id)a3 withOriginalEvent:(id)a4 detachments:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  BOOL v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  double v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  double v32;
  double v33;
  unint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  __CFString *v54;
  const __CFString *v55;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  void *v63;
  void *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint8_t buf[4];
  void *v74;
  __int16 v75;
  const __CFString *v76;
  __int16 v77;
  __CFString *v78;
  __int16 v79;
  void *v80;
  __int16 v81;
  void *v82;
  __int16 v83;
  void *v84;
  _BYTE v85[128];
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "dtend");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v8, "dtstart");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12 || (objc_msgSend(a1, "_durationForEvent:", v8), v13 >= 0.0))
    {
      v16 = 0;
LABEL_49:

      goto LABEL_50;
    }
    v61 = v10;
    v62 = v9;
    v64 = v12;
    if (v8 == v9 || !v9)
    {
      v17 = objc_alloc_init(MEMORY[0x1E0CB3550]);
      v69 = 0u;
      v70 = 0u;
      v71 = 0u;
      v72 = 0u;
      v18 = v10;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v69, v86, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v70;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v70 != v21)
              objc_enumerationMutation(v18);
            objc_msgSend(a1, "_durationForEvent:", *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * i));
            if (v23 >= 0.0)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "addObject:", v24);

            }
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v69, v86, 16);
        }
        while (v20);
      }

      v67 = 0u;
      v68 = 0u;
      v65 = 0u;
      v66 = 0u;
      v25 = v17;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v65, v85, 16);
      if (v26)
      {
        v27 = v26;
        v28 = 0;
        v29 = *(_QWORD *)v66;
        v15 = 3600.0;
        do
        {
          for (j = 0; j != v27; ++j)
          {
            if (*(_QWORD *)v66 != v29)
              objc_enumerationMutation(v25);
            v31 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * j);
            objc_msgSend(v31, "doubleValue");
            v33 = v32;
            v34 = objc_msgSend(v25, "countForObject:", v31);
            if (v34 > v28)
            {
              v28 = v34;
              v15 = v33;
            }
          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v65, v85, 16);
        }
        while (v27);
      }
      else
      {
        v15 = 3600.0;
      }

      v10 = v61;
      v12 = v64;
    }
    else
    {
      objc_msgSend(a1, "_durationForEvent:", v9);
      v15 = v14;
    }
    objc_msgSend(v12, "tzid");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      v36 = (void *)MEMORY[0x1E0C99E80];
      objc_msgSend(v12, "tzid");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "timeZoneWithName:", v37);
      v38 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v38 = 0;
    }
    objc_msgSend(v11, "tzid");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v60 = (void *)v38;
    if (v39)
    {
      v40 = (void *)MEMORY[0x1E0C99E80];
      objc_msgSend(v11, "tzid");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "timeZoneWithName:", v41);
      v42 = objc_claimAutoreleasedReturnValue();

      v63 = (void *)v42;
      if (v38 && v42)
      {
        objc_msgSend(MEMORY[0x1E0C99D48], "CalGregorianCalendarForTimeZone:", v38);
        v43 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D48], "CalGregorianCalendarForTimeZone:", v42);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_39:
        objc_msgSend(v12, "components");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = v43;
        objc_msgSend(v43, "dateFromComponents:", v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        v58 = v48;
        objc_msgSend(v48, "dateByAddingTimeInterval:", v15);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "components:fromDate:", 252);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDB800]), "initWithYear:month:day:hour:minute:second:timeZone:", objc_msgSend(v49, "year"), objc_msgSend(v49, "month"), objc_msgSend(v49, "day"), objc_msgSend(v49, "hour"), objc_msgSend(v49, "minute"), objc_msgSend(v49, "second"), v63);
        objc_msgSend(v8, "recurrence_id");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = (id)CDBLogHandle;
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v8, "uid");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = &stru_1E4F941C0;
          if (v51)
            v55 = CFSTR("/");
          else
            v55 = &stru_1E4F941C0;
          if (v51)
          {
            objc_msgSend(v51, "description");
            v54 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          *(_DWORD *)buf = 138413570;
          v74 = v53;
          v75 = 2114;
          v76 = v55;
          v77 = 2114;
          v78 = v54;
          v79 = 2114;
          v80 = v11;
          v81 = 2114;
          v82 = v64;
          v83 = 2114;
          v84 = v50;
          _os_log_impl(&dword_1A5CCB000, v52, OS_LOG_TYPE_ERROR, "End date for component %@%{public}@%{public}@ is invalid; DTEND:%{public}@ is before DTSTART:%{public}@. Set"
            "ting DTEND to %{public}@ instead.",
            buf,
            0x3Eu);
          if (v51)

          v10 = v61;
        }

        objc_msgSend(v8, "setDtend:", v50);
        v16 = 1;
        v9 = v62;
        v12 = v64;
        goto LABEL_49;
      }
    }
    else
    {
      v63 = 0;
    }
    v45 = (void *)MEMORY[0x1E0C99D48];
    v46 = (void *)CalCopyTimeZone();
    objc_msgSend(v45, "CalGregorianCalendarForTimeZone:", v46);
    v43 = (id)objc_claimAutoreleasedReturnValue();

    v44 = v43;
    goto LABEL_39;
  }
  v16 = 0;
LABEL_50:

  return v16;
}

+ (double)_durationForEvent:(id)a3
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
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;

  v3 = a3;
  objc_msgSend(v3, "dtend");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "dtstart");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "tzid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = (void *)MEMORY[0x1E0C99E80];
      objc_msgSend(v5, "tzid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "timeZoneWithName:", v8);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v4, "tzid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9
      && (v10 = (void *)MEMORY[0x1E0C99E80],
          objc_msgSend(v4, "tzid"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v10, "timeZoneWithName:", v11),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v11,
          v6)
      && v9)
    {
      objc_msgSend(MEMORY[0x1E0C99D48], "CalGregorianCalendarForTimeZone:", v6);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D48], "CalGregorianCalendarForTimeZone:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = (void *)MEMORY[0x1E0C99D48];
      v15 = (void *)CalCopyTimeZone();
      objc_msgSend(v14, "CalGregorianCalendarForTimeZone:", v15);
      v12 = (id)objc_claimAutoreleasedReturnValue();

      v13 = v12;
    }
    objc_msgSend(v5, "components");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dateFromComponents:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "components");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dateFromComponents:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "timeIntervalSinceDate:", v17);
    v21 = v20;

  }
  else
  {
    objc_msgSend(v3, "duration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "timeInterval");
    v21 = v22;
  }

  return v21;
}

@end
