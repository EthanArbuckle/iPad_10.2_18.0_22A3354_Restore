@implementation DateProvider

- (DateProvider)initWithDate:(id)a3 units:(unint64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  DateProvider *v10;

  v6 = (void *)MEMORY[0x24BDBCE48];
  v7 = a3;
  objc_msgSend(v6, "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[DateProvider initWithDate:units:calendar:locale:timeZone:](self, "initWithDate:units:calendar:locale:timeZone:", v7, a4, v8, v9, 0);

  return v10;
}

- (DateProvider)initWithDate:(id)a3 units:(unint64_t)a4 calendar:(id)a5 locale:(id)a6 timeZone:(id)a7
{
  id v13;
  DateProvider *v14;
  DateProvider *v15;
  objc_super v17;

  v13 = a3;
  v17.receiver = self;
  v17.super_class = (Class)DateProvider;
  v14 = -[BaseDateProvider initWithCalendar:locale:timeZone:](&v17, sel_initWithCalendar_locale_timeZone_, a5, a6, a7);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_date, a3);
    v15->_calendarUnits = a4;
  }

  return v15;
}

- (DateProvider)initWithDateFormat:(id)a3 calendar:(id)a4 locale:(id)a5 timeZone:(id)a6
{
  id v11;
  DateProvider *v12;
  uint64_t v13;
  NSDate *date;
  objc_super v16;

  v11 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DateProvider;
  v12 = -[BaseDateProvider initWithCalendar:locale:timeZone:](&v16, sel_initWithCalendar_locale_timeZone_, a4, a5, a6);
  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v13 = objc_claimAutoreleasedReturnValue();
    date = v12->_date;
    v12->_date = (NSDate *)v13;

    objc_storeStrong((id *)&v12->_dateFormat, a3);
    v12->_updateWallClockAlignment = -[DateProvider _minCalendarUnitFromFormat:](v12, "_minCalendarUnitFromFormat:", v11);
  }

  return v12;
}

- (DateProvider)initWithDateFormatTemplate:(id)a3 calendar:(id)a4 locale:(id)a5 timeZone:(id)a6
{
  id v11;
  DateProvider *v12;
  uint64_t v13;
  NSDate *date;
  objc_super v16;

  v11 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DateProvider;
  v12 = -[BaseDateProvider initWithCalendar:locale:timeZone:](&v16, sel_initWithCalendar_locale_timeZone_, a4, a5, a6);
  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v13 = objc_claimAutoreleasedReturnValue();
    date = v12->_date;
    v12->_date = (NSDate *)v13;

    objc_storeStrong((id *)&v12->_dateFormatTemplate, a3);
    v12->_updateWallClockAlignment = -[DateProvider _minCalendarUnitFromFormat:](v12, "_minCalendarUnitFromFormat:", v11);
  }

  return v12;
}

- (int64_t)updateType
{
  void *v3;
  int64_t v4;
  void *v5;

  -[DateProvider dateFormatTemplate](self, "dateFormatTemplate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

    return 1;
  }
  else
  {
    -[DateProvider dateFormat](self, "dateFormat");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

- (void)_startSessionWithDate:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_date, a3);
    v5 = v6;
  }

}

- (id)_sessionTextForIndex:(int64_t)a3 context:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSString *dateFormat;
  id v12;
  void *v13;
  NSArray *templateSeries;
  NSArray *v15;
  NSArray *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  v6 = a4;
  if (!self->_date)
    goto LABEL_14;
  -[DateProvider dateFormatter](self, "dateFormatter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDateFormat:", 0);

  -[DateProvider dateFormatTemplate](self, "dateFormatTemplate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    dateFormat = self->_dateFormat;
    if (dateFormat)
    {
      -[DateProvider dateFormatter](self, "dateFormatter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setDateFormat:", dateFormat);
      goto LABEL_6;
    }
    templateSeries = self->_templateSeries;
    if (!templateSeries)
    {
      -[DateProvider _completeDateTemplateSeries](self, "_completeDateTemplateSeries");
      v15 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v16 = self->_templateSeries;
      self->_templateSeries = v15;

      templateSeries = self->_templateSeries;
    }
    if (-[NSArray count](templateSeries, "count") > a3)
    {
      -[NSArray objectAtIndex:](self->_templateSeries, "objectAtIndex:", a3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[BaseDateProvider locale](self, "locale");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v17;
      v20 = v18;
      if (objc_msgSend(v19, "isEqualToString:", CFSTR("d")))
      {
        if (LocaleIsCJK(v20))
        {

LABEL_18:
          -[DateProvider dateFormatter](self, "dateFormatter");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setDateFormat:", v19);
          goto LABEL_21;
        }
      }
      else if ((_isWeekdayDayTemplate(v19) & 1) != 0)
      {
        objc_msgSend(v20, "objectForKey:", *MEMORY[0x24BDBCB20]);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("en"));

        if (v23)
          goto LABEL_18;
LABEL_20:
        -[DateProvider dateFormatter](self, "dateFormatter");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setLocalizedDateFormatFromTemplate:", v19);
LABEL_21:

        -[DateProvider dateFormatter](self, "dateFormatter");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "stringFromDate:", self->_date);
        v26 = (id)objc_claimAutoreleasedReturnValue();

        -[BaseDateProvider locale](self, "locale");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v19;
        objc_msgSend(CFSTR("MMMMM"), "stringByAppendingString:", CFSTR("d"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v12, "isEqualToString:", v28);

        if (v29 && (LocaleIsCJK(v27) & 1) != 0)
        {

          -[DateProvider dateFormatter](self, "dateFormatter");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "stringFromDate:", self->_date);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {

          -[BaseDateProvider locale](self, "locale");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = v26;
          v33 = v32;
          if (_isWeekdayDayTemplate(v12))
          {
            v33 = v32;
            if (RemovesPunctuationFromWeekdayDay(v31))
            {
              if (!_removePunctuationIfNecessaryFromTextForTemplate_punctuationExceptDash)
              {
                objc_msgSend(MEMORY[0x24BDD1690], "punctuationCharacterSet");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "removeCharactersInString:", CFSTR("-"));
                v35 = (void *)_removePunctuationIfNecessaryFromTextForTemplate_punctuationExceptDash;
                _removePunctuationIfNecessaryFromTextForTemplate_punctuationExceptDash = (uint64_t)v34;

              }
              objc_msgSend(v32, "componentsSeparatedByCharactersInSet:");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "componentsJoinedByString:", &stru_250677B70);
              v33 = (void *)objc_claimAutoreleasedReturnValue();

            }
          }

          v26 = v33;
          v13 = v26;
        }

        goto LABEL_7;
      }

      goto LABEL_20;
    }
LABEL_14:
    v13 = 0;
    goto LABEL_15;
  }
  -[DateProvider dateFormatter](self, "dateFormatter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DateProvider dateFormatTemplate](self, "dateFormatTemplate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLocalizedDateFormatFromTemplate:", v10);

LABEL_6:
  -[DateProvider dateFormatter](self, "dateFormatter");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringFromDate:", self->_date);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

LABEL_15:
  return v13;
}

- (NSDateFormatter)dateFormatter
{
  NSDateFormatter *v3;
  NSDateFormatter *dateFormatter;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (!self->_dateFormatter)
  {
    v3 = (NSDateFormatter *)objc_opt_new();
    dateFormatter = self->_dateFormatter;
    self->_dateFormatter = v3;

    -[NSDateFormatter setFormattingContext:](self->_dateFormatter, "setFormattingContext:", 2);
    -[BaseDateProvider calendar](self, "calendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setCalendar:](self->_dateFormatter, "setCalendar:", v5);

    -[BaseDateProvider locale](self, "locale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setLocale:](self->_dateFormatter, "setLocale:", v6);

    -[BaseDateProvider timeZone](self, "timeZone");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[BaseDateProvider timeZone](self, "timeZone");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDateFormatter setTimeZone:](self->_dateFormatter, "setTimeZone:", v8);

    }
  }
  return self->_dateFormatter;
}

- (id)_completeDateTemplateSeries
{
  unint64_t calendarUnits;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  calendarUnits = self->_calendarUnits;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((calendarUnits & 0x21C) != 0)
    v5 = calendarUnits & 0x21C;
  else
    v5 = 16;
  do
  {
    -[DateProvider _partialDateTemplateSeriesForUnits:](self, "_partialDateTemplateSeriesForUnits:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v6);

    if ((v5 & 8) != 0)
      v7 = -9;
    else
      v7 = -17;
    if ((v5 & 0x200) != 0)
      v7 = -513;
    if ((v5 & 4) != 0)
      v7 = -5;
    v5 &= v7;
  }
  while (v5);
  return v4;
}

- (id)_partialDateTemplateSeriesForUnits:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v7;
  const __CFString *v8;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _QWORD v23[4];

  v23[3] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_opt_new();
  v5 = v4;
  if (a3 == 528)
  {
    objc_msgSend(v4, "addObject:", CFSTR("EEEE d"));
    objc_msgSend(v5, "addObject:", CFSTR("EEE d"));
    return v5;
  }
  if ((~(_DWORD)a3 & 0x208) != 0)
  {
    if ((a3 & 8) != 0)
    {
      objc_msgSend(v4, "addObject:", CFSTR("MMMM"));
      v8 = CFSTR("MMM");
    }
    else if ((a3 & 0x200) != 0)
    {
      objc_msgSend(v4, "addObject:", CFSTR("EEEE"));
      v8 = CFSTR("EEE");
    }
    else
    {
      v8 = &stru_250677B70;
    }
  }
  else
  {
    v23[0] = CFSTR("MMMMEEEE");
    v23[1] = CFSTR("MMMMEEE");
    v23[2] = CFSTR("MMMEEEE");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v7);

    v8 = CFSTR("MMMEEE");
  }
  objc_msgSend(v5, "addObject:", v8);
  if ((a3 & 0x10) == 0)
  {
    v9 = &stru_250677B70;
    if ((a3 & 4) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
  objc_msgSend(&stru_250677B70, "stringByAppendingString:", CFSTR("d"));
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ((a3 & 4) != 0)
  {
LABEL_14:
    -[__CFString stringByAppendingString:](v9, "stringByAppendingString:", CFSTR("y"));
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (__CFString *)v10;
  }
LABEL_15:
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v12 = v5;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v16), "stringByAppendingString:", v9, (_QWORD)v18);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v14);
  }

  return v11;
}

- (unint64_t)_minCalendarUnitFromFormat:(id)a3
{
  id v4;
  unint64_t SkeletonFromTemplate;
  void *v6;
  uint64_t UnitsFromDateFormat;
  uint64_t v8;

  v4 = a3;
  if (!objc_msgSend(v4, "length"))
    goto LABEL_9;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("a")) & 1) != 0)
  {
    SkeletonFromTemplate = 32;
    goto LABEL_10;
  }
  -[BaseDateProvider locale](self, "locale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SkeletonFromTemplate = _CFDateFormatterCreateSkeletonFromTemplate();

  if (!SkeletonFromTemplate)
    goto LABEL_10;
  UnitsFromDateFormat = _CFCalendarGetUnitsFromDateFormat();
  if (!UnitsFromDateFormat)
  {
LABEL_9:
    SkeletonFromTemplate = 0;
    goto LABEL_10;
  }
  v8 = 0;
  while (1)
  {
    SkeletonFromTemplate = qword_235260B20[v8];
    if ((SkeletonFromTemplate & UnitsFromDateFormat) != 0)
      break;
    if (++v8 == 14)
      goto LABEL_9;
  }
LABEL_10:

  return SkeletonFromTemplate;
}

- (unint64_t)updateWallClockAlignment
{
  return self->_updateWallClockAlignment;
}

- (void)setUpdateWallClockAlignment:(unint64_t)a3
{
  self->_updateWallClockAlignment = a3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (unint64_t)calendarUnits
{
  return self->_calendarUnits;
}

- (void)setCalendarUnits:(unint64_t)a3
{
  self->_calendarUnits = a3;
}

- (BOOL)uppercase
{
  return self->_uppercase;
}

- (void)setUppercase:(BOOL)a3
{
  self->_uppercase = a3;
}

- (NSString)dateFormat
{
  return self->_dateFormat;
}

- (void)setDateFormat:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)dateFormatTemplate
{
  return self->_dateFormatTemplate;
}

- (void)setDateFormatTemplate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setDateFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_dateFormatter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_dateFormatTemplate, 0);
  objc_storeStrong((id *)&self->_dateFormat, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_templateSeries, 0);
}

@end
