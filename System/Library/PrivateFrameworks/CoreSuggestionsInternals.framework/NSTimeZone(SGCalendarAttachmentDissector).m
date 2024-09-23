@implementation NSTimeZone(SGCalendarAttachmentDissector)

+ (id)systemTimeZoneWithWindowsName:()SGCalendarAttachmentDissector
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
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;

  v3 = a3;
  if (!v3)
  {
    v18 = 0;
LABEL_11:
    v17 = v18;
    goto LABEL_12;
  }
  v4 = (void *)MEMORY[0x1C3BD4F6C]();
  __75__NSTimeZone_SGCalendarAttachmentDissector__systemTimeZoneWithWindowsName___block_invoke(v3, (uint64_t)CFSTR("/"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  __75__NSTimeZone_SGCalendarAttachmentDissector__systemTimeZoneWithWindowsName___block_invoke(v5, (uint64_t)CFSTR("\\"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  __75__NSTimeZone_SGCalendarAttachmentDissector__systemTimeZoneWithWindowsName___block_invoke(v6, (uint64_t)CFSTR(", "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  __75__NSTimeZone_SGCalendarAttachmentDissector__systemTimeZoneWithWindowsName___block_invoke(v7, (uint64_t)CFSTR("; "));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  __75__NSTimeZone_SGCalendarAttachmentDissector__systemTimeZoneWithWindowsName___block_invoke(v8, (uint64_t)CFSTR("- "));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  __75__NSTimeZone_SGCalendarAttachmentDissector__systemTimeZoneWithWindowsName___block_invoke(v9, (uint64_t)CFSTR(": "));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByTrimmingCharactersInSet:", v11);
  v3 = (id)objc_claimAutoreleasedReturnValue();

  __75__NSTimeZone_SGCalendarAttachmentDissector__systemTimeZoneWithWindowsName___block_invoke_2((uint64_t)v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    goto LABEL_9;
  v13 = objc_msgSend(v3, "rangeOfString:", CFSTR(")"));
  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = v13;
    if (v13 < objc_msgSend(v3, "length") - 3)
    {
      objc_msgSend(v3, "substringFromIndex:", v14 + 2);
      v15 = objc_claimAutoreleasedReturnValue();

      v3 = (id)v15;
    }
  }
  __75__NSTimeZone_SGCalendarAttachmentDissector__systemTimeZoneWithWindowsName___block_invoke_2((uint64_t)v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    goto LABEL_9;
  __75__NSTimeZone_SGCalendarAttachmentDissector__systemTimeZoneWithWindowsName___block_invoke(v3, (uint64_t)CFSTR(" ("));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  __75__NSTimeZone_SGCalendarAttachmentDissector__systemTimeZoneWithWindowsName___block_invoke_2((uint64_t)v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    __75__NSTimeZone_SGCalendarAttachmentDissector__systemTimeZoneWithWindowsName___block_invoke(v16, (uint64_t)CFSTR(" Standard Time"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    __75__NSTimeZone_SGCalendarAttachmentDissector__systemTimeZoneWithWindowsName___block_invoke(v20, (uint64_t)CFSTR(" Daylight Time"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    __75__NSTimeZone_SGCalendarAttachmentDissector__systemTimeZoneWithWindowsName___block_invoke(v21, (uint64_t)CFSTR(" Summer Time"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    __75__NSTimeZone_SGCalendarAttachmentDissector__systemTimeZoneWithWindowsName___block_invoke(v22, (uint64_t)CFSTR(" Time"));
    v3 = (id)objc_claimAutoreleasedReturnValue();

    __75__NSTimeZone_SGCalendarAttachmentDissector__systemTimeZoneWithWindowsName___block_invoke_2((uint64_t)v3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v4);
    goto LABEL_11;
  }
  v3 = v16;
LABEL_9:
  v17 = v12;
  objc_autoreleasePoolPop(v4);
LABEL_12:

  return v17;
}

+ (id)systemTimeZoneFromString:()SGCalendarAttachmentDissector
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;

  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    v9 = 0;
LABEL_12:
    objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZoneWithWindowsName:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  v5 = v3;
  while (1)
  {
    v6 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "rangeOfString:", CFSTR("/"));
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
      break;
    objc_msgSend(v5, "substringFromIndex:", v8 + 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v6);
    if (v7)
      v10 = 1;
    else
      v10 = v9 == 0;
    v5 = v9;
    if (v10)
    {
      if (v7)
        goto LABEL_16;
      goto LABEL_12;
    }
  }
  if (v7
    || (objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithAbbreviation:", v5),
        (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

    objc_autoreleasePoolPop(v6);
    v9 = 0;
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZoneWithWindowsName:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v6);
  v9 = 0;
  if (!v7)
    goto LABEL_12;
LABEL_16:

  return v7;
}

+ (id)gmtOffsetTimeZoneWithHour:()SGCalendarAttachmentDissector withMinute:forDate:
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  uint64_t v32;
  void *context;
  void *v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = v8;
  if (a3 >= 0)
    v10 = a4;
  else
    v10 = -a4;
  v11 = v10 + 60 * a3;
  v12 = 60 * v11;
  objc_msgSend(v8, "dateByAddingTimeInterval:", (double)(-60 * v11));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "secondsFromGMTForDate:", v13);

  if (v12 == v15)
  {
    objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a4)
    {
      v32 = a1;
      v34 = v9;
      context = (void *)MEMORY[0x1C3BD4F6C]();
      objc_msgSend(MEMORY[0x1E0C99E80], "knownTimeZoneNames");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(&unk_1E7E105F0, "arrayByAddingObjectsFromArray:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v19 = v18;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v37;
        while (2)
        {
          v23 = 0;
          do
          {
            if (*(_QWORD *)v37 != v22)
              objc_enumerationMutation(v19);
            objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v23));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (v12 == objc_msgSend(v16, "secondsFromGMTForDate:", v13))
            {

              objc_autoreleasePoolPop(context);
              v9 = v34;
              goto LABEL_22;
            }

            ++v23;
          }
          while (v21 != v23);
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
          if (v21)
            continue;
          break;
        }
      }

      objc_autoreleasePoolPop(context);
      v9 = v34;
      a1 = v32;
    }
    v16 = 0;
    if ((unint64_t)(a3 + 12) <= 0x1A && !v10)
    {
      v24 = (void *)MEMORY[0x1C3BD4F6C]();
      v25 = (void *)objc_opt_new();
      objc_msgSend(v25, "setNumberStyle:", 1);
      objc_msgSend(v25, "setMaximumFractionDigits:", 0);
      objc_msgSend(v25, "setPositivePrefix:", CFSTR("+"));
      objc_msgSend(v25, "setNegativePrefix:", CFSTR("-"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -a3);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "stringFromNumber:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v27)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGCalendarAttachmentDissector.m"), 404, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("hourString"));

      }
      v28 = (void *)MEMORY[0x1E0C99E80];
      objc_msgSend(CFSTR("Etc/GMT"), "stringByAppendingString:", v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "timeZoneWithName:", v29);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(v24);
    }
  }
LABEL_22:

  return v16;
}

+ (id)gmtOffsetTimeZoneFromString:()SGCalendarAttachmentDissector forDate:
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    v7 = (void *)MEMORY[0x1C3BD4F6C]();
    v8 = objc_msgSend(v5, "rangeOfString:", CFSTR("GMT"));
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v8 = objc_msgSend(v5, "rangeOfString:", CFSTR("UTC"));
      if (v8 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v9 = 0;
LABEL_19:
        objc_autoreleasePoolPop(v7);
        goto LABEL_20;
      }
    }
    if (v8 + 4 < (unint64_t)objc_msgSend(v5, "length"))
    {
      v10 = objc_msgSend(v5, "characterAtIndex:", v8 + 3);
      if (v10 == 45 || v10 == 43)
      {
        v11 = objc_msgSend(v5, "length");
        v12 = (void *)MEMORY[0x1C3BD4F6C]();
        if (v8 + 8 >= v11)
        {
          if (v8 + 5 >= (unint64_t)objc_msgSend(v5, "length"))
            v18 = 2;
          else
            v18 = 3;
          objc_msgSend(v5, "substringWithRange:", v8 + 3, v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "integerValue");

          objc_msgSend(MEMORY[0x1E0C99E80], "gmtOffsetTimeZoneWithHour:withMinute:forDate:", v20, 0, v6);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v5, "substringWithRange:", v8 + 3, 3);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "integerValue");

          objc_msgSend(v5, "substringWithRange:", v8 + 7, 2);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "integerValue");

          objc_msgSend(MEMORY[0x1E0C99E80], "gmtOffsetTimeZoneWithHour:withMinute:forDate:", v14, v16, v6);
          v17 = objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            v9 = (void *)v17;
            objc_autoreleasePoolPop(v12);
            goto LABEL_19;
          }
          v21 = (void *)MEMORY[0x1E0C99E80];
          objc_msgSend(v5, "substringWithRange:", v8, 9);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "timeZoneWithName:", v22);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

        }
        objc_autoreleasePoolPop(v12);
        if (v9)
          goto LABEL_19;
      }
    }
    objc_msgSend(MEMORY[0x1E0C99E80], "gmtOffsetTimeZoneWithHour:withMinute:forDate:", 0, 0, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  v9 = 0;
LABEL_20:

  return v9;
}

@end
