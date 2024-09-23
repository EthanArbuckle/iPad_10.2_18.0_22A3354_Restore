@implementation CUIKNotificationDescriptionGenerator

+ (id)sharedGenerator
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__CUIKNotificationDescriptionGenerator_sharedGenerator__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedGenerator_onceToken_3 != -1)
    dispatch_once(&sharedGenerator_onceToken_3, block);
  return (id)sharedGenerator___sharedInstance_3;
}

void __55__CUIKNotificationDescriptionGenerator_sharedGenerator__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedGenerator___sharedInstance_3;
  sharedGenerator___sharedInstance_3 = (uint64_t)v1;

}

- (id)_sharedNumberFormatter
{
  NSNumberFormatter *numberFormatter;
  NSNumberFormatter *v4;
  NSNumberFormatter *v5;
  NSNumberFormatter *v6;
  void *v7;

  numberFormatter = self->_numberFormatter;
  if (!numberFormatter)
  {
    v4 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
    v5 = self->_numberFormatter;
    self->_numberFormatter = v4;

    -[NSNumberFormatter setNumberStyle:](self->_numberFormatter, "setNumberStyle:", 1);
    v6 = self->_numberFormatter;
    objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSNumberFormatter setLocale:](v6, "setLocale:", v7);

    numberFormatter = self->_numberFormatter;
  }
  return numberFormatter;
}

- (id)_sharedDateFormatter
{
  NSDateFormatter *dateFormatter;
  NSDateFormatter *v4;
  NSDateFormatter *v5;
  NSDateFormatter *v6;
  void *v7;

  dateFormatter = self->_dateFormatter;
  if (!dateFormatter)
  {
    v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    v5 = self->_dateFormatter;
    self->_dateFormatter = v4;

    -[NSDateFormatter setDateStyle:](self->_dateFormatter, "setDateStyle:", 2);
    -[NSDateFormatter setTimeStyle:](self->_dateFormatter, "setTimeStyle:", 0);
    v6 = self->_dateFormatter;
    objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setLocale:](v6, "setLocale:", v7);

    dateFormatter = self->_dateFormatter;
  }
  return dateFormatter;
}

- (id)_sharedTimeFormatter
{
  NSDateFormatter *timeFormatter;
  NSDateFormatter *v4;
  NSDateFormatter *v5;
  NSDateFormatter *v6;
  void *v7;

  timeFormatter = self->_timeFormatter;
  if (!timeFormatter)
  {
    v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    v5 = self->_timeFormatter;
    self->_timeFormatter = v4;

    -[NSDateFormatter setDateStyle:](self->_timeFormatter, "setDateStyle:", 0);
    -[NSDateFormatter setTimeStyle:](self->_timeFormatter, "setTimeStyle:", 1);
    v6 = self->_timeFormatter;
    objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setLocale:](v6, "setLocale:", v7);

    timeFormatter = self->_timeFormatter;
  }
  return timeFormatter;
}

- (id)_sharedDateTimeFormatter
{
  NSDateFormatter *dateTimeFormatter;
  NSDateFormatter *v4;
  NSDateFormatter *v5;
  NSDateFormatter *v6;
  void *v7;

  dateTimeFormatter = self->_dateTimeFormatter;
  if (!dateTimeFormatter)
  {
    v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    v5 = self->_dateTimeFormatter;
    self->_dateTimeFormatter = v4;

    -[NSDateFormatter setDateStyle:](self->_dateTimeFormatter, "setDateStyle:", 1);
    -[NSDateFormatter setTimeStyle:](self->_dateTimeFormatter, "setTimeStyle:", 1);
    v6 = self->_dateTimeFormatter;
    objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setLocale:](v6, "setLocale:", v7);

    dateTimeFormatter = self->_dateTimeFormatter;
  }
  return dateTimeFormatter;
}

- (id)timePeriodForTimeInterval:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;

  v3 = a3;
  objc_msgSend(v3, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceNow");
  v6 = v5;

  objc_msgSend(v3, "duration");
  v8 = v7;

  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setAllowedUnits:", 4108);
  objc_msgSend(v9, "setMaximumUnitCount:", 1);
  objc_msgSend(v9, "setAllowsFractionalUnits:", 0);
  objc_msgSend(v9, "setUnitsStyle:", 4);
  objc_msgSend(v9, "stringFromTimeInterval:", v6 + v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_adjustedTitle:(id)a3 maxLength:(unint64_t)a4
{
  id v5;
  unint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v5 = a3;
  objc_msgSend(v5, "rangeOfComposedCharacterSequencesForRange:", 0, objc_msgSend(v5, "length"));
  if (v6 <= a4)
  {
    v7 = v5;
  }
  else
  {
    v7 = (id)objc_opt_new();
    v8 = objc_msgSend(v5, "rangeOfComposedCharacterSequenceAtIndex:", a4);
    objc_msgSend(v5, "substringToIndex:", v8 + v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendString:", v10);

    objc_msgSend(MEMORY[0x1E0CB3940], "ellipsisString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendString:", v11);

  }
  return v7;
}

- (id)conflictStringForConflictDetails:(id)a3 descriptions:(id)a4
{
  return -[CUIKNotificationDescriptionGenerator conflictStringForConflictDetails:maxTitleLength:descriptions:](self, "conflictStringForConflictDetails:maxTitleLength:descriptions:", a3, -1, a4);
}

- (id)conflictStringForConflictDetails:(id)a3 maxTitleLength:(unint64_t)a4
{
  return -[CUIKNotificationDescriptionGenerator conflictStringForConflictDetails:maxTitleLength:descriptions:](self, "conflictStringForConflictDetails:maxTitleLength:descriptions:", a3, a4, 0);
}

- (id)conflictStringForConflictDetails:(id)a3 maxTitleLength:(unint64_t)a4 descriptions:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  const __CFString *v55;
  void *v56;
  void *v57;
  uint64_t v59;

  v8 = a3;
  v9 = a5;
  v10 = objc_msgSend(v8, "totalConflictingEvents");
  v11 = objc_msgSend(v8, "totalNeedsActionEvents");
  if ((unint64_t)objc_msgSend(v8, "totalOccurrencesInSeries") >= 2 && objc_msgSend(v8, "totalConflictsInSeries"))
  {
    v12 = objc_msgSend(v8, "totalConflictsInSeries");
    objc_msgSend(v8, "conflictPeriodForSeries");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = (void *)MEMORY[0x1E0CB3940];
      CUIKBundle();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v12 == 1)
      {
        objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Conflict: One out of the next %ld occurrences"), &stru_1E6EBAE30, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "localizedStringWithFormat:", v17, objc_msgSend(v8, "totalOccurrencesInSeries"), v59);
LABEL_37:
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_38;
      }
      objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Conflicts: %ld out of next %ld occurrences"), &stru_1E6EBAE30, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend(v8, "totalOccurrencesInSeries");
LABEL_32:
      objc_msgSend(v14, "localizedStringWithFormat:", v17, v12, v59);
      goto LABEL_37;
    }
    if (v12 != 1
      || (objc_msgSend(v8, "needsActionEvents"),
          v42 = (void *)objc_claimAutoreleasedReturnValue(),
          v43 = objc_msgSend(v42, "count"),
          v42,
          !v43))
    {
      v14 = (void *)MEMORY[0x1E0CB3940];
      CUIKBundle();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Conflicts with %ld events"), &stru_1E6EBAE30, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    }
    if (a4)
    {
      objc_msgSend(v8, "conflictingEvents");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "firstObject");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "title");
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      -[CUIKNotificationDescriptionGenerator _adjustedTitle:maxLength:](self, "_adjustedTitle:maxLength:", v46, a4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v47 = (void *)MEMORY[0x1E0CB3940];
      CUIKBundle();
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "localizedStringForKey:value:table:", CFSTR("Conflicts with %@"), &stru_1E6EBAE30, 0);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "localizedStringWithFormat:", v49, v16);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
        goto LABEL_39;
      goto LABEL_27;
    }
    v53 = (void *)MEMORY[0x1E0CB3940];
    CUIKBundle();
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v54;
    v55 = CFSTR("Conflicts with an event");
LABEL_36:
    objc_msgSend(v54, "localizedStringForKey:value:table:", v55, &stru_1E6EBAE30, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "localizedStringWithFormat:", v17, 1, v59);
    goto LABEL_37;
  }
  v18 = v11 + v10;
  if (v11 + v10 < 1)
  {
    v27 = 0;
    if (!v9)
      goto LABEL_41;
    goto LABEL_40;
  }
  if (!objc_msgSend(v8, "totalConflictingEvents"))
  {
    if (objc_msgSend(v8, "totalNeedsActionEvents") == 1)
    {
      objc_msgSend(v8, "needsActionEvents");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "count");

      if (v32)
      {
        objc_msgSend(v8, "needsActionEvents");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "firstObject");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "title");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!a4 || !v16)
        {
          v56 = (void *)MEMORY[0x1E0CB3940];
          CUIKBundle();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Another event is scheduled for this time"), &stru_1E6EBAE30, 0);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "localizedStringWithFormat:", v57, v18);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_38;
        }
        -[CUIKNotificationDescriptionGenerator _adjustedTitle:maxLength:](self, "_adjustedTitle:maxLength:", v16, a4);
        v35 = objc_claimAutoreleasedReturnValue();

        v36 = (void *)MEMORY[0x1E0CB3940];
        CUIKBundle();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("One invitation"), CFSTR("%@ is also scheduled for this time"), 0);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "localizedStringWithFormat:", v38, v35);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          v39 = (void *)MEMORY[0x1E0CB3B18];
          v40 = objc_msgSend(v27, "rangeOfString:", v35);
          objc_msgSend(v39, "valueWithRange:", v40, v41);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, CFSTR("ConflictEventRange"));
          v16 = (void *)v35;
LABEL_38:

          goto LABEL_39;
        }
        v16 = (void *)v35;
        goto LABEL_39;
      }
    }
    v28 = (void *)MEMORY[0x1E0CB3940];
    CUIKBundle();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v29;
    v30 = CFSTR("N invitations");
LABEL_29:
    objc_msgSend(v29, "localizedStringForKey:value:table:", v30, CFSTR("%ld other events are also scheduled for this time"), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "localizedStringWithFormat:", v17, v18, v59);
    goto LABEL_37;
  }
  if (v18 != 1
    || (objc_msgSend(v8, "conflictingEvents"),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        v20 = objc_msgSend(v19, "count"),
        v19,
        !v20))
  {
    v28 = (void *)MEMORY[0x1E0CB3940];
    CUIKBundle();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v29;
    v30 = CFSTR("N conflicts");
    goto LABEL_29;
  }
  if (!a4)
  {
    v53 = (void *)MEMORY[0x1E0CB3940];
    CUIKBundle();
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v54;
    v55 = CFSTR("Another event is scheduled for this time");
    goto LABEL_36;
  }
  objc_msgSend(v8, "conflictingEvents");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "firstObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "title");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[CUIKNotificationDescriptionGenerator _adjustedTitle:maxLength:](self, "_adjustedTitle:maxLength:", v23, a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (void *)MEMORY[0x1E0CB3940];
  CUIKBundle();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("One conflict"), CFSTR("%@ is also scheduled for this time"), 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "localizedStringWithFormat:", v26, v16);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && v16)
  {
LABEL_27:
    v50 = (void *)MEMORY[0x1E0CB3B18];
    v51 = objc_msgSend(v27, "rangeOfString:", v16);
    objc_msgSend(v50, "valueWithRange:", v51, v52);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, CFSTR("ConflictEventRange"));
    goto LABEL_38;
  }
LABEL_39:

  if (v9)
LABEL_40:
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v27, CFSTR("Conflict"));
LABEL_41:

  return v27;
}

+ (id)_autoCommentForProposedTime:(id)a3 timeZone:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0D0C2B0], "longStringForDateAndTime:inTimeZone:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  CUIKBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("%@Can we move this event to %@?"), &stru_1E6EBAE30, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "CalAutoCommentPrefix");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringWithFormat:", v7, v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)stringWithAutoCommentRemoved:(id)a3
{
  return (id)objc_msgSend(a3, "CalStringByRemovingAutoComment");
}

+ (id)stringWithOnlyAutoComment:(id)a3
{
  return (id)objc_msgSend(a3, "CalStringWithOnlyAutoComment");
}

+ (id)comment:(id)a3 withInsertedAutoCommentForDate:(id)a4 timeZone:(id)a5
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;

  v7 = a3;
  v8 = v7;
  if (a4)
  {
    +[CUIKNotificationDescriptionGenerator _autoCommentForProposedTime:timeZone:](CUIKNotificationDescriptionGenerator, "_autoCommentForProposedTime:timeZone:", a4, a5);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v8 && (objc_msgSend(v8, "CalHasAutoCommentPrefix") & 1) == 0)
    {
      objc_msgSend(v9, "stringByAppendingFormat:", CFSTR("\n%@"), v8);
      v10 = objc_claimAutoreleasedReturnValue();

      v9 = (id)v10;
    }
  }
  else
  {
    v9 = v7;
  }

  return v9;
}

+ (id)timeSensitiveString
{
  void *v2;
  void *v3;

  CUIKBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Time Sensitive"), &stru_1E6EBAE30, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateTimeFormatter, 0);
  objc_storeStrong((id *)&self->_timeFormatter, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_numberFormatter, 0);
}

@end
