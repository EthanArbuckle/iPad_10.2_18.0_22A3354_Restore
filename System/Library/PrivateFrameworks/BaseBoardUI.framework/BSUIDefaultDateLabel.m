@implementation BSUIDefaultDateLabel

+ (id)_currentCalendar
{
  objc_opt_self();
  if (qword_1ECEC3960 != -1)
    dispatch_once(&qword_1ECEC3960, &__block_literal_global_4);
  return (id)_MergedGlobals_1;
}

void __40__BSUIDefaultDateLabel__currentCalendar__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D48], "autoupdatingCurrentCalendar");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_1;
  _MergedGlobals_1 = v0;

}

- (BSUIDefaultDateLabel)init
{
  BSUIDefaultDateLabel *v2;
  NSDate *v3;
  NSDate *timeZoneRelativeStartDate;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BSUIDefaultDateLabel;
  v2 = -[BSUIDefaultDateLabel init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSDate *)objc_alloc_init(MEMORY[0x1E0C99D68]);
    timeZoneRelativeStartDate = v2->_timeZoneRelativeStartDate;
    v2->_timeZoneRelativeStartDate = v3;

    v2->_allDay = 0;
    v2->_effectiveAllDay = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__forceUpdate, *MEMORY[0x1E0D01188], 0);

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[BSUIDefaultDateLabel _invalidateTimer]((uint64_t)self);
  -[BSUIDefaultDateLabel _resetModelProperties]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)BSUIDefaultDateLabel;
  -[BSUIDefaultDateLabel dealloc](&v3, sel_dealloc);
}

- (void)_invalidateTimer
{
  void *v2;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 848), "invalidate");
    v2 = *(void **)(a1 + 848);
    *(_QWORD *)(a1 + 848) = 0;

  }
}

- (void)_resetModelProperties
{
  void *v2;
  void *v3;

  if (a1)
  {
    *(_BYTE *)(a1 + 856) = 0;
    *(_BYTE *)(a1 + 841) = 0;
    *(_BYTE *)(a1 + 842) = 0;
    v2 = *(void **)(a1 + 880);
    *(_QWORD *)(a1 + 880) = 0;

    v3 = *(void **)(a1 + 808);
    *(_QWORD *)(a1 + 808) = 0;

    -[BSUIDefaultDateLabel _resetEffectiveAllDayState:](a1);
  }
}

- (void)prepareForReuse
{
  __int128 v3;
  _OWORD v4[3];

  -[BSUIDefaultDateLabel removeFromSuperview](self, "removeFromSuperview");
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v4[0] = *MEMORY[0x1E0C9BAA8];
  v4[1] = v3;
  v4[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[BSUIDefaultDateLabel setTransform:](self, "setTransform:", v4);
  -[BSUIDefaultDateLabel setAlpha:](self, "setAlpha:", 1.0);
  -[BSUIDefaultDateLabel setHidden:](self, "setHidden:", 0);
  -[BSUIDefaultDateLabel setText:](self, "setText:", 0);
  -[BSUIDefaultDateLabel setDelegate:](self, "setDelegate:", 0);
  -[BSUIDefaultDateLabel _invalidateTimer]((uint64_t)self);
  -[BSUIDefaultDateLabel _resetModelProperties]((uint64_t)self);
}

- (void)setAllDay:(BOOL)a3
{
  if (self->_allDay != a3)
  {
    self->_allDay = a3;
    -[BSUIDefaultDateLabel update](self, "update");
  }
}

- (void)setIsTimestamp:(BOOL)a3
{
  if (self->_isTimestamp != a3)
  {
    self->_isTimestamp = a3;
    -[BSUIDefaultDateLabel update](self, "update");
  }
}

- (void)_configureTimer
{
  uint64_t v2;
  int *v3;
  double v4;
  double v5;
  id v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;
  id v11;
  __CFRunLoop *Main;
  const void *v13;
  _QWORD block[5];
  _QWORD v15[5];
  id v16;

  if (a1)
  {
    v2 = objc_opt_class();
    if (v2 == objc_opt_class())
    {
      v3 = &OBJC_IVAR___BSUIDefaultDateLabel__timeZoneRelativeStartDate;
      objc_msgSend(a1[110], "timeIntervalSinceNow");
      if (v4 <= 0.0
        && (v3 = &OBJC_IVAR___BSUIDefaultDateLabel__timeZoneRelativeEndDate,
            objc_msgSend(a1[101], "timeIntervalSinceNow"),
            v5 <= 0.0))
      {
        v6 = 0;
      }
      else
      {
        v6 = *(id *)((char *)a1 + *v3);
      }
      if (!objc_msgSend(a1[106], "isValid")
        || (objc_msgSend(a1[106], "fireDate"),
            v7 = (void *)objc_claimAutoreleasedReturnValue(),
            v8 = objc_msgSend(v7, "isAfterDate:", v6),
            v7,
            v8))
      {
        if (v6)
        {
          objc_msgSend(a1[106], "invalidate");
          v9 = a1[106];
          a1[106] = 0;

          v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E88]), "initWithFireDate:interval:target:selector:userInfo:repeats:", v6, a1, sel__updateTimerFired_, 0, 0, 0.0);
          v11 = a1[106];
          a1[106] = (id)v10;

          v15[0] = 0;
          v15[1] = v15;
          v15[2] = 0x3032000000;
          v15[3] = __Block_byref_object_copy__2;
          v15[4] = __Block_byref_object_dispose__2;
          v16 = a1[106];
          Main = CFRunLoopGetMain();
          v13 = (const void *)*MEMORY[0x1E0C9B280];
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __39__BSUIDefaultDateLabel__configureTimer__block_invoke;
          block[3] = &unk_1E43491E8;
          block[4] = v15;
          CFRunLoopPerformBlock(Main, v13, block);
          _Block_object_dispose(v15, 8);

        }
      }

    }
  }
}

void __39__BSUIDefaultDateLabel__configureTimer__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "isValid"))
  {
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addTimer:forMode:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *MEMORY[0x1E0C99860]);

  }
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

- (void)setTimeZoneRelativeStartDate:(id)a3 absoluteStartDate:(id)a4
{
  id v6;

  v6 = a3;
  if (!-[NSDate isEqualToDate:](self->_timeZoneRelativeStartDate, "isEqualToDate:"))
  {
    objc_storeStrong((id *)&self->_timeZoneRelativeStartDate, a3);
    -[BSUIDefaultDateLabel update](self, "update");
    -[BSUIDefaultDateLabel _configureTimer]((id *)&self->super.super.super.super.isa);
  }

}

- (void)setTimeZoneRelativeEndDate:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NSDate isEqualToDate:](self->_timeZoneRelativeEndDate, "isEqualToDate:"))
  {
    objc_storeStrong((id *)&self->_timeZoneRelativeEndDate, a3);
    -[BSUIDefaultDateLabel update](self, "update");
    -[BSUIDefaultDateLabel _configureTimer]((id *)&self->super.super.super.super.isa);
  }

}

- (void)setStartDate:(id)a3 withTimeZone:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (v6)
  {
    -[BSUIDefaultDateLabel _localDateForDate:inTimeZone:]((uint64_t)self, v9, v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v9;
  }
  v8 = v7;
  -[BSUIDefaultDateLabel setTimeZoneRelativeStartDate:absoluteStartDate:](self, "setTimeZoneRelativeStartDate:absoluteStartDate:", v7, v9);

}

- (id)_localDateForDate:(void *)a3 inTimeZone:
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v5 = a2;
  v6 = a3;
  v7 = 0;
  if (a1 && v5)
  {
    +[BSUIDefaultDateLabel _currentCalendar]();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTimeZone:", v6);
    objc_msgSend(v8, "components:fromDate:", 254, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTimeZone:", v10);

    objc_msgSend(v8, "dateFromComponents:", v9);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11)
      v13 = (void *)v11;
    else
      v13 = v5;
    v7 = v13;

  }
  return v7;
}

- (void)setEndDate:(id)a3 withTimeZone:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (v6)
  {
    -[BSUIDefaultDateLabel _localDateForDate:inTimeZone:]((uint64_t)self, v9, v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v9;
  }
  v8 = v7;
  -[BSUIDefaultDateLabel setTimeZoneRelativeEndDate:](self, "setTimeZoneRelativeEndDate:", v7);

}

- (void)_resetEffectiveAllDayState:(uint64_t)a1
{
  void *v2;
  void *v3;
  void *v4;

  *(_BYTE *)(a1 + 840) = 0;
  v2 = *(void **)(a1 + 816);
  *(_QWORD *)(a1 + 816) = 0;

  v3 = *(void **)(a1 + 832);
  *(_QWORD *)(a1 + 832) = 0;

  v4 = *(void **)(a1 + 824);
  *(_QWORD *)(a1 + 824) = 0;

}

- (BOOL)isDateWithinEffectiveAllDayRange:(id)a3
{
  id v5;
  double v6;
  double v7;
  double v8;
  BOOL v9;
  double v10;
  void *v12;
  void *v13;

  v5 = a3;
  if (!self->_effectiveAllDayStartDate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSUIDefaultDateLabel.m"), 284, CFSTR("Effective all-day start date was nil."));

  }
  if (!self->_effectiveAllDayEndDate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSUIDefaultDateLabel.m"), 285, CFSTR("Effective all-day end date was nil."));

  }
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v7 = v6;
  -[NSDate timeIntervalSinceReferenceDate](self->_effectiveAllDayStartDate, "timeIntervalSinceReferenceDate");
  if (v7 >= v8)
  {
    -[NSDate timeIntervalSinceReferenceDate](self->_effectiveAllDayEndDate, "timeIntervalSinceReferenceDate");
    v9 = v7 < v10;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isEffectiveAllDay
{
  return self->_effectiveAllDay;
}

- (id)_constructNonAllDayLabelStringWithDate:(char)a3 startTime:(int)a4 startIsToday:(int)a5 sameDayDates:(void *)a6 eventOngoing:(int)a7 withCurrentDate:(double)a8 forStartLabel:
{
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  uint64_t v23;
  double v24;
  double v25;

  v15 = a2;
  v16 = a6;
  if (!a1)
  {
    v21 = 0;
    goto LABEL_37;
  }
  objc_msgSend(MEMORY[0x1E0D01738], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D01740], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if ((a3 & 1) == 0 && !a5)
  {
    if (objc_msgSend(v18, "isTomorrow:", a8))
    {
      if ((a7 & 1) != 0)
      {
LABEL_17:
        objc_msgSend(v17, "formatDateAsRelativeDateAndTimeStyle:", v15);
        v23 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      }
LABEL_35:
      v21 = 0;
      goto LABEL_36;
    }
    if (objc_msgSend(v19, "isWithinNextWeek:", a8))
    {
      if ((a7 & 1) == 0)
        goto LABEL_35;
    }
    else
    {
      objc_msgSend(v16, "timeIntervalSinceReferenceDate");
      if (v25 < a8)
      {
        if (a7)
        {
          objc_msgSend(v17, "formatDateAsShortDayMonthWithTimeStyle:", v15);
          v23 = objc_claimAutoreleasedReturnValue();
          goto LABEL_29;
        }
        goto LABEL_35;
      }
      if (objc_msgSend(v19, "isYesterday:", a8))
      {
        if (a7)
        {
          if (*(_BYTE *)(a1 + 857))
          {
            objc_msgSend(v17, "formatDateAsRelativeDateStyle:", v15);
            v23 = objc_claimAutoreleasedReturnValue();
            goto LABEL_29;
          }
          goto LABEL_17;
        }
        goto LABEL_35;
      }
      if (!objc_msgSend(v19, "isWithinPrevWeek:includeToday:", 1, a8))
      {
        if (a7)
        {
          objc_msgSend(v17, "formatDateAsDayMonthYearStyle:", v15);
          v23 = objc_claimAutoreleasedReturnValue();
          goto LABEL_29;
        }
        goto LABEL_35;
      }
      if (!a7)
        goto LABEL_35;
    }
    objc_msgSend(v17, "formatDateAsAbbreviatedDayOfWeekWithTime:", v15);
    v23 = objc_claimAutoreleasedReturnValue();
LABEL_29:
    v21 = (void *)v23;
    goto LABEL_36;
  }
  if (!a7)
  {
    objc_msgSend(v15, "timeIntervalSinceReferenceDate");
    if (!a4)
    {
      v24 = v22;
      if (!objc_msgSend(v19, "isTomorrow:"))
      {
        if (objc_msgSend(v19, "isWithinNextWeek:", v24))
          objc_msgSend(v17, "formatDateAsAbbreviatedDayOfWeekWithTime:", v15);
        else
          objc_msgSend(v17, "formatDateAsShortDayMonthWithTimeStyle:", v15);
        v23 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      }
      goto LABEL_17;
    }
    goto LABEL_11;
  }
  if (!a5)
  {
LABEL_11:
    objc_msgSend(v17, "formatDateAsTimeStyle:", v15);
    v23 = objc_claimAutoreleasedReturnValue();
    goto LABEL_29;
  }
  +[NSBundle bs_baseBoardUIBundle]();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("NOW"), &stru_1E4349708, &stru_1E4349708);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_36:
LABEL_37:

  return v21;
}

- (id)constructLabelString
{
  int64_t labelType;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void **p_timeZoneRelativeStartDate;
  double v19;
  double v20;
  char v21;
  int v22;
  int v23;
  void *v24;
  void *v25;
  __CFString *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  int v39;
  NSDate *effectiveAllDayLastValidDate;
  int v41;
  NSDate *v42;
  void *v43;

  labelType = self->_labelType;
  if (labelType == 2)
  {
    if (!self->_timeZoneRelativeStartDate)
      return &stru_1E4349708;
    goto LABEL_6;
  }
  if (labelType == 1)
  {
LABEL_6:
    v4 = 808;
    goto LABEL_7;
  }
  if (labelType)
    goto LABEL_8;
  v4 = 880;
LABEL_7:
  if (!*(Class *)((char *)&self->super.super.super.super.isa + v4))
    return &stru_1E4349708;
LABEL_8:
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[BSUIDefaultDateLabel _currentCalendar]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D01740], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D01738], "sharedInstance");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = self->_labelType;
  if (!self->_effectiveAllDay)
  {
    p_timeZoneRelativeStartDate = (void **)&self->_timeZoneRelativeStartDate;
    -[NSDate timeIntervalSinceReferenceDate](self->_timeZoneRelativeStartDate, "timeIntervalSinceReferenceDate");
    v20 = v19;
    v21 = objc_msgSend(v7, "isToday:");
    if (self->_timeZoneRelativeStartDate && self->_timeZoneRelativeEndDate)
    {
      v22 = objc_msgSend(v6, "date:isSameDayAsDate:");
      if (objc_msgSend(v5, "isAfterDate:", *p_timeZoneRelativeStartDate))
      {
        v23 = objc_msgSend(v5, "isBeforeDate:", self->_timeZoneRelativeEndDate);
LABEL_25:
        if (v8 == 2)
        {
          -[BSUIDefaultDateLabel _constructNonAllDayLabelStringWithDate:startTime:startIsToday:sameDayDates:eventOngoing:withCurrentDate:forStartLabel:]((uint64_t)self, *p_timeZoneRelativeStartDate, v21, v22, v23, v5, 1, v20);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[BSUIDefaultDateLabel _constructNonAllDayLabelStringWithDate:startTime:startIsToday:sameDayDates:eventOngoing:withCurrentDate:forStartLabel:]((uint64_t)self, self->_timeZoneRelativeEndDate, v21, v22, v23, v5, 0, v20);
          v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v25 = (void *)MEMORY[0x1E0CB3940];
          +[NSBundle bs_baseBoardUIBundle]();
          v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
          -[__CFString localizedStringForKey:value:table:](v26, "localizedStringForKey:value:table:", CFSTR("DATE_RANGE_FORMAT_NEW"), &stru_1E4349708, &stru_1E4349708);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "stringWithFormat:", v27, v24, v15);
          v28 = objc_claimAutoreleasedReturnValue();

          v13 = 0;
        }
        else
        {
          if (v8)
            p_timeZoneRelativeStartDate = (void **)&self->_timeZoneRelativeEndDate;
          v13 = *p_timeZoneRelativeStartDate;
          if (v13)
          {
            -[BSUIDefaultDateLabel _constructNonAllDayLabelStringWithDate:startTime:startIsToday:sameDayDates:eventOngoing:withCurrentDate:forStartLabel:]((uint64_t)self, v13, v21, v22, v23, v5, v8 == 0, v20);
            v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v26 = &stru_1E4349708;
          }
          if (v8 != 1)
            goto LABEL_75;
          v35 = (void *)MEMORY[0x1E0CB3940];
          +[NSBundle bs_baseBoardUIBundle]();
          v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
          -[__CFString localizedStringForKey:value:table:](v15, "localizedStringForKey:value:table:", CFSTR("TO_TIME_FORMAT"), &stru_1E4349708, &stru_1E4349708);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "stringWithFormat:", v24, v26);
          v28 = objc_claimAutoreleasedReturnValue();
        }

        v26 = (__CFString *)v28;
LABEL_74:

LABEL_75:
        goto LABEL_76;
      }
    }
    else
    {
      v22 = 0;
    }
    v23 = 0;
    goto LABEL_25;
  }
  -[NSDate timeIntervalSinceReferenceDate](self->_effectiveAllDayStartDate, "timeIntervalSinceReferenceDate");
  v10 = v9;
  -[NSDate timeIntervalSinceReferenceDate](self->_effectiveAllDayLastValidDate, "timeIntervalSinceReferenceDate");
  v12 = v11;
  if ((unint64_t)(v8 - 1) > 1
    || (objc_msgSend(v7, "isToday:", v11) & 1) != 0
    || (objc_msgSend(v6, "date:isSameDayAsDate:", self->_effectiveAllDayStartDate, self->_effectiveAllDayLastValidDate) & 1) != 0)
  {
    v13 = 0;
  }
  else if (objc_msgSend(v7, "isTomorrow:", v12))
  {
    +[NSBundle bs_baseBoardUIBundle]();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("TOMORROW"), &stru_1E4349708, &stru_1E4349708);
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v39 = objc_msgSend(v7, "isWithinNextWeek:", v12);
    effectiveAllDayLastValidDate = self->_effectiveAllDayLastValidDate;
    if (v39)
      objc_msgSend(v43, "formatDateAsDayOfWeek:", effectiveAllDayLastValidDate);
    else
      objc_msgSend(v43, "formatDateAsAbbreviatedDayMonthStyle:", effectiveAllDayLastValidDate);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  if ((v8 | 2) == 2)
  {
    if (-[BSUIDefaultDateLabel isDateWithinEffectiveAllDayRange:](self, "isDateWithinEffectiveAllDayRange:", v5))
    {
      +[NSBundle bs_baseBoardUIBundle]();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("TODAY"), &stru_1E4349708, &stru_1E4349708);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v16 = (void *)MEMORY[0x1E0CB3940];
        +[NSBundle bs_baseBoardUIBundle]();
        if (v8 != 2)
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("TODAY_TO_DATE_FORMAT"), &stru_1E4349708, &stru_1E4349708);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "stringWithFormat:", v36, v13);
LABEL_53:
          v38 = objc_claimAutoreleasedReturnValue();
LABEL_72:
          v26 = (__CFString *)v38;

          goto LABEL_73;
        }
LABEL_52:
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("DATE_RANGE_FORMAT_NEW"), &stru_1E4349708, &stru_1E4349708);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringWithFormat:", v36, v15, v13);
        goto LABEL_53;
      }
      goto LABEL_68;
    }
    if (objc_msgSend(v7, "isTomorrow:", v10))
    {
      +[NSBundle bs_baseBoardUIBundle]();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("TOMORROW"), &stru_1E4349708, &stru_1E4349708);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v16 = (void *)MEMORY[0x1E0CB3940];
        +[NSBundle bs_baseBoardUIBundle]();
        if (v8 != 2)
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("TOMORROW_TO_DATE_FORMAT"), &stru_1E4349708, &stru_1E4349708);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "stringWithFormat:", v36, v13);
          goto LABEL_53;
        }
        goto LABEL_52;
      }
      goto LABEL_68;
    }
    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    if (v10 <= v32)
    {
      if (objc_msgSend(v7, "isYesterday:", v12))
      {
        +[NSBundle bs_baseBoardUIBundle]();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("YESTERDAY"), &stru_1E4349708, &stru_1E4349708);
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          v16 = (void *)MEMORY[0x1E0CB3940];
          +[NSBundle bs_baseBoardUIBundle]();
          if (v8 != 2)
          {
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("YESTERDAY_TO_DATE_FORMAT"), &stru_1E4349708, &stru_1E4349708);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "stringWithFormat:", v36, v13);
            goto LABEL_53;
          }
          goto LABEL_52;
        }
        goto LABEL_68;
      }
      v41 = objc_msgSend(v7, "isWithinPrevWeek:includeToday:", 1, v12);
      v42 = self->_effectiveAllDayLastValidDate;
      if (v41)
      {
        objc_msgSend(v43, "formatDateAsDayOfWeek:", v42);
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v33 = (void *)MEMORY[0x1E0CB3940];
          +[NSBundle bs_baseBoardUIBundle]();
          if (v8 != 2)
          {
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("DAYOFWEEK_TO_DATE_FORMAT"), &stru_1E4349708, &stru_1E4349708);
            goto LABEL_67;
          }
          goto LABEL_66;
        }
      }
      else
      {
        objc_msgSend(v43, "formatDateAsDayMonthYearStyle:", v42);
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v33 = (void *)MEMORY[0x1E0CB3940];
          +[NSBundle bs_baseBoardUIBundle]();
          if (v8 != 2)
          {
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("DAYMONTHYEAR_TO_DATE_FORMAT"), &stru_1E4349708, &stru_1E4349708);
            goto LABEL_67;
          }
          goto LABEL_66;
        }
      }
    }
    else
    {
      objc_msgSend(v43, "formatDateAsAbbreviatedDayMonthStyle:", self->_effectiveAllDayStartDate);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v33 = (void *)MEMORY[0x1E0CB3940];
        +[NSBundle bs_baseBoardUIBundle]();
        if (v8 != 2)
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("DAYMONTH_TO_DATE_FORMAT"), &stru_1E4349708, &stru_1E4349708);
LABEL_67:
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "stringWithFormat:", v36, v15, v13);
          v38 = objc_claimAutoreleasedReturnValue();
          goto LABEL_72;
        }
LABEL_66:
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("DATE_RANGE_FORMAT_NEW"), &stru_1E4349708, &stru_1E4349708);
        goto LABEL_67;
      }
    }
LABEL_68:
    v15 = v15;
    v26 = v15;
    goto LABEL_74;
  }
  if (v13)
  {
    v29 = (void *)MEMORY[0x1E0CB3940];
    +[NSBundle bs_baseBoardUIBundle]();
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[__CFString localizedStringForKey:value:table:](v15, "localizedStringForKey:value:table:", CFSTR("TO_DATE_FORMAT"), &stru_1E4349708, &stru_1E4349708);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringWithFormat:", v30, v13);
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_73:

    goto LABEL_74;
  }
  v26 = &stru_1E4349708;
LABEL_76:

  return v26;
}

- (void)updateTextIfNecessary:(uint64_t)a1
{
  void *v3;
  char v4;
  id WeakRetained;
  void *v6;
  id v7;

  if (a1)
  {
    if ((a2 & 1) != 0 || !*(_BYTE *)(a1 + 841))
    {
      objc_msgSend((id)a1, "constructLabelString");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)a1, "text");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v7, "isEqual:", v3);

      if ((v4 & 1) == 0)
      {
        objc_msgSend((id)a1, "setText:", v7);
        objc_msgSend((id)a1, "setNeedsDisplay");
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 864));
        v6 = WeakRetained;
        if (WeakRetained)
          objc_msgSend(WeakRetained, "dateLabelDidChange:", a1);

      }
    }
    else
    {
      *(_BYTE *)(a1 + 842) = 1;
    }
  }
}

- (void)_updateTimerFired:(id)a3
{
  -[BSUIDefaultDateLabel update](self, "update", a3);
  -[BSUIDefaultDateLabel _invalidateTimer]((uint64_t)self);
  -[BSUIDefaultDateLabel _configureTimer]((id *)&self->super.super.super.super.isa);
}

- (void)updateTextIfNecessary
{
  -[BSUIDefaultDateLabel updateTextIfNecessary:]((uint64_t)self, 0);
}

- (void)_forceUpdate
{
  NSDate *timeZoneRelativeStartDate;
  double v4;
  double v5;
  void *v6;
  double v7;
  NSDate *v8;
  void *effectiveAllDayEndDate;

  if (self)
  {
    -[BSUIDefaultDateLabel _resetEffectiveAllDayState:]((uint64_t)self);
    if (self->_allDay)
    {
      timeZoneRelativeStartDate = self->_timeZoneRelativeStartDate;
      if (timeZoneRelativeStartDate)
      {
        -[NSDate timeIntervalSinceReferenceDate](timeZoneRelativeStartDate, "timeIntervalSinceReferenceDate");
        v5 = v4;
        BSDateAtStartOfDay();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
        {
          if (!self->_timeZoneRelativeStartDate)
            goto LABEL_10;
          -[NSDate timeIntervalSinceReferenceDate](self->_timeZoneRelativeEndDate, "timeIntervalSinceReferenceDate");
          if (v7 >= v5)
          {
            BSDateAtStartOfDay();
            v8 = (NSDate *)objc_claimAutoreleasedReturnValue();
            if (!v8)
              goto LABEL_13;
            if ((objc_msgSend(v6, "isEqualToDate:", v8) & 1) == 0)
            {
              -[NSDate bs_dateByAddingDays:](v8, "bs_dateByAddingDays:", -1);
              effectiveAllDayEndDate = (void *)objc_claimAutoreleasedReturnValue();
              if (effectiveAllDayEndDate)
              {
                self->_effectiveAllDay = 1;
                objc_storeStrong((id *)&self->_effectiveAllDayStartDate, v6);
                objc_storeStrong((id *)&self->_effectiveAllDayLastValidDate, effectiveAllDayEndDate);
                objc_storeStrong((id *)&self->_effectiveAllDayEndDate, v8);
              }
              goto LABEL_12;
            }

LABEL_10:
            objc_msgSend(v6, "bs_dateByAddingDays:", 1);
            v8 = (NSDate *)objc_claimAutoreleasedReturnValue();
            if (v8)
            {
              self->_effectiveAllDay = 1;
              objc_storeStrong((id *)&self->_effectiveAllDayStartDate, v6);
              objc_storeStrong((id *)&self->_effectiveAllDayLastValidDate, v6);
              v8 = v8;
              effectiveAllDayEndDate = self->_effectiveAllDayEndDate;
              self->_effectiveAllDayEndDate = v8;
LABEL_12:

            }
LABEL_13:

          }
        }

      }
    }
  }
  -[BSUIDefaultDateLabel updateTextIfNecessary:]((uint64_t)self, 1);
}

- (void)update
{
  if (self->_isCoalescingUpdates)
    self->_needsUpdateFromCoalesce = 1;
  else
    -[BSUIDefaultDateLabel _forceUpdate](self, "_forceUpdate");
}

- (void)startCoalescingUpdates
{
  self->_isCoalescingUpdates = 1;
}

- (void)stopCoalescingUpdates
{
  if (self->_isCoalescingUpdates)
  {
    self->_isCoalescingUpdates = 0;
    if (self->_needsUpdateFromCoalesce)
    {
      -[BSUIDefaultDateLabel _forceUpdate](self, "_forceUpdate");
      self->_needsUpdateFromCoalesce = 0;
    }
  }
}

- (BOOL)isAllDay
{
  return self->_allDay;
}

- (BSUIDateLabelDelegate)delegate
{
  return (BSUIDateLabelDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)labelType
{
  return self->_labelType;
}

- (void)setLabelType:(int64_t)a3
{
  self->_labelType = a3;
}

- (BOOL)isTimestamp
{
  return self->_isTimestamp;
}

- (NSDate)timeZoneRelativeStartDate
{
  return self->_timeZoneRelativeStartDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZoneRelativeStartDate, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_updateTimer, 0);
  objc_storeStrong((id *)&self->_effectiveAllDayEndDate, 0);
  objc_storeStrong((id *)&self->_effectiveAllDayLastValidDate, 0);
  objc_storeStrong((id *)&self->_effectiveAllDayStartDate, 0);
  objc_storeStrong((id *)&self->_timeZoneRelativeEndDate, 0);
}

@end
