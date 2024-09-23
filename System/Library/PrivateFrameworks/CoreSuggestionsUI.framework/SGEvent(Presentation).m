@implementation SGEvent(Presentation)

- (id)timeZoneOrGMT
{
  void *v1;
  void *v2;
  id v3;
  void *v4;

  objc_msgSend(a1, "startTimeZone");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    v3 = v1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return v4;
}

- (id)formattedStartTime
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[SGUIDateFormatting singleDayTimeFormatter](SGUIDateFormatting, "singleDayTimeFormatter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "timeZoneOrGMT");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTimeZone:", v4);

  objc_msgSend(a1, "start");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFromDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setTimeZone:", v3);
  return v6;
}

- (id)formattedStartDate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[SGUIDateFormatting mediumDateFormatter](SGUIDateFormatting, "mediumDateFormatter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "timeZoneOrGMT");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTimeZone:", v4);

  objc_msgSend(a1, "start");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFromDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setTimeZone:", v3);
  return v6;
}

+ (uint64_t)sameDayEvents:()Presentation
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "count") >= 2)
  {
    objc_msgSend(v3, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeZoneOrGMT");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTimeZone:", v7);

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v8 = v3;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v9)
    {
      v10 = v9;
      v21 = v3;
      v11 = *(_QWORD *)v23;
      while (2)
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v23 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v12);
          if (v13 != v5)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v12), "timeZoneOrGMT");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "timeZone");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "isEqual:", v14);

            if (!v16)
            {

LABEL_16:
              v4 = 0;
              goto LABEL_17;
            }
            objc_msgSend(v5, "start");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "start");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v6, "isDate:inSameDayAsDate:", v17, v18);

            if (!v19)
              goto LABEL_16;
          }
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v10)
          continue;
        break;
      }
      v4 = 1;
LABEL_17:
      v3 = v21;
    }
    else
    {
      v4 = 1;
    }

  }
  else
  {
    v4 = 1;
  }

  return v4;
}

+ (id)formatEvents:()Presentation
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  if (v5)
  {
    if (v5 == 2)
    {
      if ((objc_msgSend(a1, "sameDayEvents:", v4) & 1) != 0)
      {
        objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "start");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "start");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v9, "isEqual:", v11);

        if (v12)
        {
          +[SGUIDateFormatting fullDayFormatter](SGUIDateFormatting, "fullDayFormatter");
          v6 = objc_claimAutoreleasedReturnValue();
          goto LABEL_9;
        }
        v24 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreSuggestionsUI"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("SuggestionsBannerTwoEventsSameDayFormat"), &stru_1E62D74E0, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "formattedStartDate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "formattedStartTime");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "formattedStartTime");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "localizedStringWithFormat:", v14, v21, v23, v26);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v20 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreSuggestionsUI"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("SuggestionsBannerTwoEventsDifferentDayFormat"), &stru_1E62D74E0, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "formattedStartDate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "formattedStartDate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "localizedStringWithFormat:", v14, v21, v23);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      if (v5 == 1)
      {
        +[SGUIDateFormatting mediumDateFormatter](SGUIDateFormatting, "mediumDateFormatter");
        v6 = objc_claimAutoreleasedReturnValue();
LABEL_9:
        v13 = (void *)v6;
        objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "start");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringFromDate:", v15);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:

        goto LABEL_19;
      }
      v16 = objc_msgSend(a1, "sameDayEvents:", v4);
      v17 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreSuggestionsUI"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v18;
      if (v16)
        v19 = CFSTR("SuggestionsBannerMultiEventsSameDayFormat");
      else
        v19 = CFSTR("SuggestionsBannerMultiEventsDifferentDayFormat");
      objc_msgSend(v18, "localizedStringForKey:value:table:", v19, &stru_1E62D74E0, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "formattedStartDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringWithFormat:", v14, v21);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_18;
  }
  v7 = 0;
LABEL_19:

  return v7;
}

@end
