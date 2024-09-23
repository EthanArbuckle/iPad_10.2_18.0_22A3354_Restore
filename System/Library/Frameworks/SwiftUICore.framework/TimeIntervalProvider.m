@implementation TimeIntervalProvider

- (TimeIntervalProvider)initWithStartDate:(id)a3 endDate:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  TimeIntervalProvider *v11;

  v6 = (void *)MEMORY[0x24BDBCE48];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "currentCalendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[TimeIntervalProvider initWithStartDate:endDate:calendar:locale:timeZone:](self, "initWithStartDate:endDate:calendar:locale:timeZone:", v8, v7, v9, v10, 0);

  return v11;
}

- (TimeIntervalProvider)initWithStartDate:(id)a3 endDate:(id)a4 calendar:(id)a5 locale:(id)a6 timeZone:(id)a7
{
  id v13;
  id v14;
  TimeIntervalProvider *v15;
  TimeIntervalProvider *v16;
  objc_super v18;

  v13 = a3;
  v14 = a4;
  v18.receiver = self;
  v18.super_class = (Class)TimeIntervalProvider;
  v15 = -[BaseDateProvider initWithCalendar:locale:timeZone:](&v18, sel_initWithCalendar_locale_timeZone_, a5, a6, a7);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_startDate, a3);
    objc_storeStrong((id *)&v16->_endDate, a4);
  }

  return v16;
}

- (id)_sessionTextForIndex:(int64_t)a3 context:(id)a4
{
  id v6;
  NSDateFormatter *v7;
  NSDateFormatter *dateFormatter;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSArray *fallbackSequence;
  NSArray *v14;
  NSArray *v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v6 = a4;
  if (!self->_startDate || !self->_endDate)
    goto LABEL_11;
  if (!self->_dateFormatter)
  {
    v7 = (NSDateFormatter *)objc_opt_new();
    dateFormatter = self->_dateFormatter;
    self->_dateFormatter = v7;

    -[BaseDateProvider timeZone](self, "timeZone");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[BaseDateProvider timeZone](self, "timeZone");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDateFormatter setTimeZone:](self->_dateFormatter, "setTimeZone:", v10);

    }
    -[BaseDateProvider calendar](self, "calendar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setCalendar:](self->_dateFormatter, "setCalendar:", v11);

    -[BaseDateProvider locale](self, "locale");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setLocale:](self->_dateFormatter, "setLocale:", v12);

  }
  fallbackSequence = self->_fallbackSequence;
  if (!fallbackSequence)
  {
    -[TimeIntervalProvider _fallbackSequence](self, "_fallbackSequence");
    v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v15 = self->_fallbackSequence;
    self->_fallbackSequence = v14;

    fallbackSequence = self->_fallbackSequence;
  }
  if (-[NSArray count](fallbackSequence, "count") > a3)
  {
    -[NSArray objectAtIndex:](self->_fallbackSequence, "objectAtIndex:", a3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "integerValue");

    -[TimeIntervalProvider _textForSequenceItem:](self, "_textForSequenceItem:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_11:
    v18 = 0;
  }

  return v18;
}

- (_NSRange)_rangeOfDesignatorInAnnotatedTime:(id)a3
{
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  v3 = -[TimeIntervalProvider _rangeOfAnnontatedTime:matchingPattern:](self, "_rangeOfAnnontatedTime:matchingPattern:", a3, &__block_literal_global_2);
  result.length = v4;
  result.location = v3;
  return result;
}

uint64_t __58__TimeIntervalProvider__rangeOfDesignatorInAnnotatedTime___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasPrefix:", CFSTR("a"));
}

- (_NSRange)_rangeOfHoursInAnnotatedTime:(id)a3
{
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  v3 = -[TimeIntervalProvider _rangeOfAnnontatedTime:matchingPattern:](self, "_rangeOfAnnontatedTime:matchingPattern:", a3, &__block_literal_global_8);
  result.length = v4;
  result.location = v3;
  return result;
}

uint64_t __53__TimeIntervalProvider__rangeOfHoursInAnnotatedTime___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_msgSend(v2, "hasPrefix:", CFSTR("H")) & 1) != 0
    || (objc_msgSend(v2, "hasPrefix:", CFSTR("h")) & 1) != 0
    || (objc_msgSend(v2, "hasPrefix:", CFSTR("K")) & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    v3 = objc_msgSend(v2, "hasPrefix:", CFSTR("k"));
  }

  return v3;
}

- (_NSRange)_rangeOfAnnontatedTime:(id)a3 matchingPattern:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  const char *v19;
  __int128 v20;
  _NSRange result;

  v5 = a3;
  v6 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3010000000;
  v19 = "";
  v20 = xmmword_235260E60;
  v7 = objc_msgSend(v5, "length");
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __63__TimeIntervalProvider__rangeOfAnnontatedTime_matchingPattern___block_invoke;
  v13[3] = &unk_2506567B0;
  v8 = v6;
  v14 = v8;
  v15 = &v16;
  objc_msgSend(v5, "enumerateAttributesInRange:options:usingBlock:", 0, v7, 0, v13);
  v9 = v17[4];
  v10 = v17[5];

  _Block_object_dispose(&v16, 8);
  v11 = v9;
  v12 = v10;
  result.length = v12;
  result.location = v11;
  return result;
}

void __63__TimeIntervalProvider__rangeOfAnnontatedTime_matchingPattern___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v9;
  id v10;

  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x24BDBCA78]);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    *(_QWORD *)(v9 + 32) = a3;
    *(_QWORD *)(v9 + 40) = a4;
    *a5 = 1;
  }

}

- (id)_stringByRemovingDesignatorRange:(_NSRange)a3 fromString:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a4, "stringByReplacingCharactersInRange:withString:", a3.location, a3.length, &stru_250677B70);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_fallbackSequence
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  -[BaseDateProvider calendar](self, "calendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BaseDateProvider timeZone](self, "timeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[BaseDateProvider timeZone](self, "timeZone");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTimeZone:", v5);

  }
  objc_msgSend(v3, "components:fromDate:toDate:options:", 16, self->_startDate, self->_endDate, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "day");

  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", &unk_250688078);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v3, "component:fromDate:", 64, self->_startDate);
    if (v9 | objc_msgSend(v3, "component:fromDate:", 64, self->_endDate))
    {
      objc_msgSend(v8, "addObject:", &unk_2506880A8);
      if (v9)
        goto LABEL_9;
    }
    else
    {
      objc_msgSend(v8, "addObject:", &unk_250688090);
      objc_msgSend(v8, "addObject:", &unk_2506880A8);
    }
    objc_msgSend(v8, "addObject:", &unk_2506880C0);
    goto LABEL_9;
  }
  v8 = &unk_250688118;
LABEL_9:

  return v8;
}

- (id)_textForSequenceItem:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  switch(a3)
  {
    case 0:
      -[TimeIntervalProvider _timeIntervalFullText](self, "_timeIntervalFullText", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      -[TimeIntervalProvider _timeIntervalDropMinutesText](self, "_timeIntervalDropMinutesText", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      -[TimeIntervalProvider _startTimeFullText](self, "_startTimeFullText", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      -[TimeIntervalProvider _startTimeDropMinutesText](self, "_startTimeDropMinutesText", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      -[TimeIntervalProvider _dateIntervalWideText](self, "_dateIntervalWideText", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      -[TimeIntervalProvider _dateIntervalNarrowText](self, "_dateIntervalNarrowText", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (id)_timeIntervalFullText
{
  return -[TimeIntervalProvider _timeIntervalTextWithDropMinutes:onlyStartDate:](self, "_timeIntervalTextWithDropMinutes:onlyStartDate:", 0, 0);
}

- (id)_timeIntervalDropMinutesText
{
  return -[TimeIntervalProvider _timeIntervalTextWithDropMinutes:onlyStartDate:](self, "_timeIntervalTextWithDropMinutes:onlyStartDate:", 1, 0);
}

- (id)_startTimeFullText
{
  return -[TimeIntervalProvider _timeIntervalTextWithDropMinutes:onlyStartDate:](self, "_timeIntervalTextWithDropMinutes:onlyStartDate:", 0, 1);
}

- (id)_startTimeDropMinutesText
{
  return -[TimeIntervalProvider _timeIntervalTextWithDropMinutes:onlyStartDate:](self, "_timeIntervalTextWithDropMinutes:onlyStartDate:", 1, 1);
}

- (id)_dateIntervalWideText
{
  return -[TimeIntervalProvider _dateIntervalTextWithNarrow:](self, "_dateIntervalTextWithNarrow:", 0);
}

- (id)_dateIntervalNarrowText
{
  return -[TimeIntervalProvider _dateIntervalTextWithNarrow:](self, "_dateIntervalTextWithNarrow:", 1);
}

- (id)_timeIntervalTextWithDropMinutes:(BOOL)a3 onlyStartDate:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  __CFString **v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
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
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v43;
  _BOOL4 v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  char v50;

  v4 = a4;
  v6 = (void *)MEMORY[0x24BDD1500];
  v7 = _StandardTimeFormatTemplate;
  if (a3)
    v7 = &_NoMinutesTimeFormatTemplate;
  v8 = *v7;
  -[BaseDateProvider locale](self, "locale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateFormatFromTemplate:options:locale:", v8, 0, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v50 = 0;
  -[BaseDateProvider _timeFormatByRemovingWhitespaceAroundDesignatorOfTimeFormat:designatorExists:](self, "_timeFormatByRemovingWhitespaceAroundDesignatorOfTimeFormat:designatorExists:", v10, &v50);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSDateFormatter setDateFormat:](self->_dateFormatter, "setDateFormat:", v11);
  -[NSDateFormatter _attributedStringWithFieldsFromDate:](self->_dateFormatter, "_attributedStringWithFieldsFromDate:", self->_startDate);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "string");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v15 = -[TimeIntervalProvider _rangeOfDesignatorInAnnotatedTime:](self, "_rangeOfDesignatorInAnnotatedTime:", v12);
    v16 = v14;
    if (v15 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v17 = 0;
      if (!v4)
      {
LABEL_6:
        -[NSDateFormatter _attributedStringWithFieldsFromDate:](self->_dateFormatter, "_attributedStringWithFieldsFromDate:", self->_endDate);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "string");
        v13 = (id)objc_claimAutoreleasedReturnValue();

        if (!v13)
        {
LABEL_28:

          goto LABEL_29;
        }
        v19 = -[TimeIntervalProvider _rangeOfDesignatorInAnnotatedTime:](self, "_rangeOfDesignatorInAnnotatedTime:", v18);
        v21 = 0x7FFFFFFFFFFFFFFFLL;
        v49 = v11;
        v46 = v20;
        v47 = v16;
        if (v19 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v22 = v18;
          v23 = (unint64_t)v17;
          v24 = 0;
        }
        else
        {
          v26 = v19;
          v27 = v18;
          v23 = (unint64_t)v17;
          v22 = v27;
          objc_msgSend(v27, "attributedSubstringFromRange:", v26, v20);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "string");
          v24 = objc_claimAutoreleasedReturnValue();

          v21 = v26;
        }
LABEL_12:
        -[BaseDateProvider locale](self, "locale");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        LocalizedString(CFSTR("INTERVAL_HYPHEN_NARROW"), v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = (void *)v23;
        if (!(v23 | v24))
        {
          if (v4)
          {
            objc_msgSend(v12, "string");
            v13 = (id)objc_claimAutoreleasedReturnValue();
            v18 = v22;
          }
          else
          {
            v33 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(v12, "string");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = v22;
            objc_msgSend(v22, "string");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "stringWithFormat:", CFSTR("%@%@%@"), v34, v30, v35);
            v13 = (id)objc_claimAutoreleasedReturnValue();

          }
          v11 = v49;
          goto LABEL_27;
        }
        v48 = (void *)v23;
        objc_msgSend(v12, "string");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v31;
        if (v4)
        {
          v13 = v31;
          v32 = v13;
          v18 = v22;
          v11 = v49;
LABEL_26:

          v17 = v48;
LABEL_27:

          goto LABEL_28;
        }
        v18 = v22;
        objc_msgSend(v22, "string");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = v30;
        if (v24 && objc_msgSend(v48, "isEqualToString:", v24))
        {
          v43 = v36;
          -[BaseDateProvider locale](self, "locale");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = DropLeftRedundantDesignator(v37);

          if (v44)
          {
            v11 = v49;
            v36 = v43;
            if (v15 != 0x7FFFFFFFFFFFFFFFLL)
            {
              objc_msgSend(v12, "string");
              v38 = objc_claimAutoreleasedReturnValue();
              v39 = v15;
              v40 = (void *)v38;
              -[TimeIntervalProvider _stringByRemovingDesignatorRange:fromString:](self, "_stringByRemovingDesignatorRange:fromString:", v39, v47, v38);
              v41 = v32;
              v32 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_32:

            }
          }
          else
          {
            v11 = v49;
            v36 = v43;
            if (v21 != 0x7FFFFFFFFFFFFFFFLL)
            {
              objc_msgSend(v18, "string");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              -[TimeIntervalProvider _stringByRemovingDesignatorRange:fromString:](self, "_stringByRemovingDesignatorRange:fromString:", v21, v46, v40);
              v41 = v43;
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_32;
            }
          }
        }
        else
        {
          v11 = v49;
        }
        v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", v32);
        objc_msgSend(v13, "appendString:", v45);
        objc_msgSend(v13, "appendString:", v36);

        goto LABEL_26;
      }
    }
    else
    {
      objc_msgSend(v12, "attributedSubstringFromRange:", v15, v14);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "string");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v4)
        goto LABEL_6;
    }
    v46 = 0;
    v47 = v16;
    v49 = v11;
    v23 = (unint64_t)v17;
    v24 = 0;
    v22 = 0;
    v21 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_12;
  }
LABEL_29:

  return v13;
}

- (id)_dateIntervalTextWithNarrow:(BOOL)a3
{
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (a3)
    v4 = CFSTR("M/d");
  else
    v4 = CFSTR("MMM d");
  -[NSDateFormatter setLocalizedDateFormatFromTemplate:](self->_dateFormatter, "setLocalizedDateFormatFromTemplate:", v4);
  -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", self->_startDate);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", self->_endDate);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD17C8];
  -[BaseDateProvider locale](self, "locale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LocalizedString(CFSTR("INTERVAL_HYPHEN_WIDE"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@%@%@"), v5, v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_fallbackSequence, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
}

@end
