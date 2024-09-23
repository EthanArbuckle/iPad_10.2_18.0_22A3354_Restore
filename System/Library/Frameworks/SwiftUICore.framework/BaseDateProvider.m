@implementation BaseDateProvider

- (BaseDateProvider)initWithCalendar:(id)a3 locale:(id)a4 timeZone:(id)a5
{
  id v9;
  id v10;
  id v11;
  BaseDateProvider *v12;
  BaseDateProvider *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BaseDateProvider;
  v12 = -[BaseDateProvider init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_calendar, a3);
    objc_storeStrong((id *)&v13->_locale, a4);
    objc_storeStrong((id *)&v13->_timeZone, a5);
  }

  return v13;
}

- (id)formattedString
{
  DateFormattingContext *v3;
  void *v4;

  v3 = objc_alloc_init(DateFormattingContext);
  -[BaseDateProvider formattedStringInContext:](self, "formattedStringInContext:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)formattedStringInContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "referenceDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BaseDateProvider _startSessionWithDate:](self, "_startSessionWithDate:", v5);

  -[BaseDateProvider _sessionTextForIndex:context:](self, "_sessionTextForIndex:context:", 0, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[BaseDateProvider _endSession](self, "_endSession");
  return v6;
}

- (int64_t)updateType
{
  return 0;
}

- (id)updateInterval
{
  int64_t v2;

  v2 = -[BaseDateProvider _updateFrequency](self, "_updateFrequency");
  if ((unint64_t)(v2 - 1) > 2)
    return 0;
  else
    return *(&off_250656840 + v2 - 1);
}

- (unint64_t)updateWallClockAlignment
{
  return 0;
}

- (NSDateInterval)timerInterval
{
  return 0;
}

- (NSDate)timerEndDate
{
  return 0;
}

- (id)_sessionTextForIndex:(int64_t)a3 context:(id)a4
{
  return &stru_250677B70;
}

- (int64_t)_updateFrequency
{
  return 0;
}

- (id)_timeFormatByRemovingWhitespaceAroundDesignatorOfTimeFormat:(id)a3 designatorExists:(BOOL *)a4
{
  return -[BaseDateProvider _timeFormatByRemovingWhitespaceAroundDesignatorOfTimeFormat:andRemovingDesignator:designatorExists:](self, "_timeFormatByRemovingWhitespaceAroundDesignatorOfTimeFormat:andRemovingDesignator:designatorExists:", a3, 0, a4);
}

- (id)_timeFormatByRemovingDesignatorOfTimeFormat:(id)a3
{
  return -[BaseDateProvider _timeFormatByRemovingWhitespaceAroundDesignatorOfTimeFormat:andRemovingDesignator:designatorExists:](self, "_timeFormatByRemovingWhitespaceAroundDesignatorOfTimeFormat:andRemovingDesignator:designatorExists:", a3, 1, 0);
}

- (id)_timeFormatByRemovingWhitespaceAroundDesignatorOfTimeFormat:(id)a3 andRemovingDesignator:(BOOL)a4 designatorExists:(BOOL *)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  _BOOL4 v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  id v38;
  BOOL *v40;
  BaseDateProvider *v41;
  _BOOL4 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v6 = a4;
  v48 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  objc_msgSend(MEMORY[0x24BDD1500], "_componentsFromFormatString:", v8);
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v10)
  {
    v11 = v10;
    v40 = a5;
    v41 = self;
    v42 = v6;
    v12 = *(_QWORD *)v44;
    v13 = *MEMORY[0x24BDBCA80];
    v14 = *MEMORY[0x24BDBCA88];
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v44 != v12)
          objc_enumerationMutation(v9);
        v16 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_msgSend(v16, "objectForKeyedSubscript:", v13, v40, v41);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v17, "BOOLValue") & 1) == 0)
        {
          objc_msgSend(v16, "objectForKeyedSubscript:", v14);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v18, "hasPrefix:", CFSTR("a")) & 1) != 0)
          {
            v19 = objc_msgSend(v9, "indexOfObject:", v16);

            goto LABEL_13;
          }

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      if (v11)
        continue;
      break;
    }
    v19 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_13:
    v6 = v42;
    a5 = v40;
    self = v41;
  }
  else
  {
    v19 = 0x7FFFFFFFFFFFFFFFLL;
  }

  if (a5)
    *a5 = v19 != 0x7FFFFFFFFFFFFFFFLL;
  if (v19 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[BaseDateProvider locale](self, "locale");

    if (v6)
    {
      if (v19)
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", v19 - 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x24BDBCA80]);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v21, "BOOLValue"))
        {
          objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x24BDBCA88]);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "stringByTrimmingCharactersInSet:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          v25 = objc_msgSend(v24, "length") == 0;
        }
        else
        {
          v25 = 0;
        }

      }
      else
      {
        v25 = 0;
      }
      if (v19 >= objc_msgSend(v9, "count") - 1)
      {
        v34 = (void *)objc_msgSend(v9, "mutableCopy");
      }
      else
      {
        v26 = v19 + 1;
        objc_msgSend(v9, "objectAtIndexedSubscript:", v19 + 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "objectForKeyedSubscript:", *MEMORY[0x24BDBCA80]);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v28, "BOOLValue"))
        {
          objc_msgSend(v27, "objectForKeyedSubscript:", *MEMORY[0x24BDBCA88]);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "stringByTrimmingCharactersInSet:", v30);
          v31 = v8;
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          v33 = objc_msgSend(v32, "length") == 0;
          v8 = v31;
          v26 = v19 + 1;
        }
        else
        {
          v33 = 0;
        }

        v35 = (void *)objc_msgSend(v9, "mutableCopy");
        v34 = v35;
        if (v33)
          objc_msgSend(v35, "removeObjectAtIndex:", v26);
      }
      objc_msgSend(v34, "removeObjectAtIndex:", v19);
      if (v25)
        objc_msgSend(v34, "removeObjectAtIndex:", v19 - 1);
      v36 = v34;

      objc_msgSend(MEMORY[0x24BDD1500], "_formatStringFromComponents:", v36);
      v37 = objc_claimAutoreleasedReturnValue();

      v8 = (id)v37;
      v9 = v36;
    }
  }
  v38 = v8;

  return v38;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
  objc_storeStrong((id *)&self->_calendar, a3);
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
  objc_storeStrong((id *)&self->_timeZone, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
}

@end
