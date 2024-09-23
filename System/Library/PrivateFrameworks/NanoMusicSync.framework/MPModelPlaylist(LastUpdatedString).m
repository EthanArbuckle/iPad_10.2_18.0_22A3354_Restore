@implementation MPModelPlaylist(LastUpdatedString)

- (id)nms_lastUpdatedString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a1, "lastModifiedDateComponents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "lastModifiedDateComponents");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "component:fromDate:", 512, v5);

    objc_msgSend(a1, "_stringForDayOfWeek:compact:", v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)nms_compactLastUpdatedString
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
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  objc_msgSend(a1, "lastModifiedDateComponents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "lastModifiedDateComponents");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dateFromComponents:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startOfDayForDate:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startOfDayForDate:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "nmu_dateWithDeltaDays:", -1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nmu_dateWithDeltaDays:", -7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "compare:", v9) == -1 && objc_msgSend(v6, "compare:", v10) == 1)
    {
      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "lastModifiedDateComponents");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v11, "component:fromDate:", 512, v13);

      objc_msgSend(a1, "_stringForDayOfWeek:compact:", v14, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v6, "nmu_displayStringWithOptions:", -1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "nanoMusicSyncBundle");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("LAST_UPDATED_SHORT_SUBTITLE"), CFSTR("Updated %@"), 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", v19, v16);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (BOOL)nms_shouldShowLastUpdatedString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;

  objc_msgSend(a1, "lastModifiedDateComponents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    return 0;
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "lastModifiedDateComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateFromComponents:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startOfDayForDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startOfDayForDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "nmu_dateWithDeltaDays:", -14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "compare:", v9) == 1;

  return v10;
}

- (id)_stringForDayOfWeek:()LastUpdatedString compact:
{
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;

  switch(a3)
  {
    case 1:
      objc_msgSend(MEMORY[0x24BDD1488], "nanoMusicSyncBundle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((a4 & 1) != 0)
      {
        v6 = CFSTR("COMPACT_LAST_UPDATED_SUBTITLE_SUNDAY");
        v7 = CFSTR("Updated Sun");
      }
      else
      {
        v6 = CFSTR("LAST_UPDATED_SUBTITLE_SUNDAY");
        v7 = CFSTR("Updated every Sunday");
      }
      goto LABEL_24;
    case 2:
      objc_msgSend(MEMORY[0x24BDD1488], "nanoMusicSyncBundle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((a4 & 1) != 0)
      {
        v6 = CFSTR("COMPACT_LAST_UPDATED_SUBTITLE_MONDAY");
        v7 = CFSTR("Updated Mon");
      }
      else
      {
        v6 = CFSTR("LAST_UPDATED_SUBTITLE_MONDAY");
        v7 = CFSTR("Updated every Monday");
      }
      goto LABEL_24;
    case 3:
      objc_msgSend(MEMORY[0x24BDD1488], "nanoMusicSyncBundle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((a4 & 1) != 0)
      {
        v6 = CFSTR("COMPACT_LAST_UPDATED_SUBTITLE_TUESDAY");
        v7 = CFSTR("Updated Tue");
      }
      else
      {
        v6 = CFSTR("LAST_UPDATED_SUBTITLE_TUESDAY");
        v7 = CFSTR("Updated every Tuesday");
      }
      goto LABEL_24;
    case 4:
      objc_msgSend(MEMORY[0x24BDD1488], "nanoMusicSyncBundle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((a4 & 1) != 0)
      {
        v6 = CFSTR("COMPACT_LAST_UPDATED_SUBTITLE_WEDNESDAY");
        v7 = CFSTR("Updated Wed");
      }
      else
      {
        v6 = CFSTR("LAST_UPDATED_SUBTITLE_WEDNESDAY");
        v7 = CFSTR("Updated every Wednesday");
      }
      goto LABEL_24;
    case 5:
      objc_msgSend(MEMORY[0x24BDD1488], "nanoMusicSyncBundle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((a4 & 1) != 0)
      {
        v6 = CFSTR("COMPACT_LAST_UPDATED_SUBTITLE_THURSDAY");
        v7 = CFSTR("Updated Thu");
      }
      else
      {
        v6 = CFSTR("LAST_UPDATED_SUBTITLE_THURSDAY");
        v7 = CFSTR("Updated every Thursday");
      }
      goto LABEL_24;
    case 6:
      objc_msgSend(MEMORY[0x24BDD1488], "nanoMusicSyncBundle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((a4 & 1) != 0)
      {
        v6 = CFSTR("COMPACT_LAST_UPDATED_SUBTITLE_FRIDAY");
        v7 = CFSTR("Updated Fri");
      }
      else
      {
        v6 = CFSTR("LAST_UPDATED_SUBTITLE_FRIDAY");
        v7 = CFSTR("Updated every Friday");
      }
      goto LABEL_24;
    case 7:
      objc_msgSend(MEMORY[0x24BDD1488], "nanoMusicSyncBundle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((a4 & 1) != 0)
      {
        v6 = CFSTR("COMPACT_LAST_UPDATED_SUBTITLE_SATURDAY");
        v7 = CFSTR("Updated Sat");
      }
      else
      {
        v6 = CFSTR("LAST_UPDATED_SUBTITLE_SATURDAY");
        v7 = CFSTR("Updated every Saturday");
      }
LABEL_24:
      objc_msgSend(v5, "localizedStringForKey:value:table:", v6, v7, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v8 = 0;
      break;
  }
  return v8;
}

@end
