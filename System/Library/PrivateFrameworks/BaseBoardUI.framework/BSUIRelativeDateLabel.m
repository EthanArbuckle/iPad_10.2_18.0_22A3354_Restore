@implementation BSUIRelativeDateLabel

- (void)setTimeZoneRelativeStartDate:(id)a3 absoluteStartDate:(id)a4
{
  id v6;
  id v7;
  BSRelativeDateTimer *relativeDateTimer;
  BSRelativeDateTimer *v9;
  BSRelativeDateTimer *v10;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BSUIRelativeDateLabel;
  -[BSUIDefaultDateLabel setTimeZoneRelativeStartDate:absoluteStartDate:](&v11, sel_setTimeZoneRelativeStartDate_absoluteStartDate_, v6, v7);
  relativeDateTimer = self->_relativeDateTimer;
  if (v7 && !relativeDateTimer)
  {
    v9 = (BSRelativeDateTimer *)objc_alloc_init(MEMORY[0x1E0D01840]);
    v10 = self->_relativeDateTimer;
    self->_relativeDateTimer = v9;

    -[BSRelativeDateTimer setDelegate:](self->_relativeDateTimer, "setDelegate:", self);
    relativeDateTimer = self->_relativeDateTimer;
  }
  -[BSRelativeDateTimer setDate:](relativeDateTimer, "setDate:", v7);

}

- (void)dealloc
{
  objc_super v3;

  -[BSRelativeDateTimer setDelegate:](self->_relativeDateTimer, "setDelegate:", 0);
  -[BSRelativeDateTimer invalidate](self->_relativeDateTimer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)BSUIRelativeDateLabel;
  -[BSUIDefaultDateLabel dealloc](&v3, sel_dealloc);
}

- (void)prepareForReuse
{
  BSRelativeDateTimerFireInfo *overrideTimerFireInfo;
  objc_super v4;

  -[BSRelativeDateTimer invalidate](self->_relativeDateTimer, "invalidate");
  -[BSRelativeDateTimer setDate:](self->_relativeDateTimer, "setDate:", 0);
  self->_value = 0;
  self->_comparedToNow = 0;
  self->_resolution = 0;
  overrideTimerFireInfo = self->_overrideTimerFireInfo;
  self->_overrideTimerFireInfo = 0;

  self->_invalidateTimelineOnReuse = 1;
  v4.receiver = self;
  v4.super_class = (Class)BSUIRelativeDateLabel;
  -[BSUIDefaultDateLabel prepareForReuse](&v4, sel_prepareForReuse);
}

- (id)constructLabelString
{
  BSRelativeDateTimerFireInfo *overrideTimerFireInfo;
  unint64_t value;
  unint64_t resolution;
  int64_t comparedToNow;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  objc_class *v26;
  void *v27;
  objc_super v28;
  objc_super v29;
  objc_super v30;
  objc_super v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  BSUIRelativeDateLabel *v37;
  __int16 v38;
  const __CFString *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  overrideTimerFireInfo = self->_overrideTimerFireInfo;
  if (overrideTimerFireInfo)
  {
    value = -[BSRelativeDateTimerFireInfo value](overrideTimerFireInfo, "value");
    resolution = -[BSRelativeDateTimerFireInfo resolution](self->_overrideTimerFireInfo, "resolution");
    comparedToNow = -[BSRelativeDateTimerFireInfo comparedToNow](self->_overrideTimerFireInfo, "comparedToNow");
  }
  else
  {
    value = self->_value;
    resolution = self->_resolution;
    comparedToNow = self->_comparedToNow;
  }
  -[BSUIDefaultDateLabel timeZoneRelativeStartDate](self, "timeZoneRelativeStartDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v31.receiver = self;
    v31.super_class = (Class)BSUIRelativeDateLabel;
    -[BSUIDefaultDateLabel constructLabelString](&v31, sel_constructLabelString);
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v10 = (void *)v9;
    if (!v9)
    {
LABEL_35:
      v22 = (void *)MEMORY[0x1E0CB3940];
      -[BSUIDefaultDateLabel timeZoneRelativeStartDate](self, "timeZoneRelativeStartDate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringWithFormat:", CFSTR("value=%llu resolution=%u comparedToNow=%i timeZoneRelativeStartDate=%@ isEffectiveAllDay=%{BOOL}i"), value, resolution, comparedToNow, v23, -[BSUIDefaultDateLabel isEffectiveAllDay](self, "isEffectiveAllDay"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v25 = (id)objc_claimAutoreleasedReturnValue();
        v26 = (objc_class *)objc_opt_class();
        NSStringFromClass(v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v33 = v25;
        v34 = 2114;
        v35 = v27;
        v36 = 2048;
        v37 = self;
        v38 = 2114;
        v39 = CFSTR("BSUIRelativeDateLabel.m");
        v40 = 1024;
        v41 = 137;
        v42 = 2114;
        v43 = v24;
        _os_log_error_impl(&dword_1A0234000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A0242154);
    }
    return v10;
  }
  if (-[BSUIDefaultDateLabel isEffectiveAllDay](self, "isEffectiveAllDay"))
  {
    v30.receiver = self;
    v30.super_class = (Class)BSUIRelativeDateLabel;
    -[BSUIDefaultDateLabel constructLabelString](&v30, sel_constructLabelString);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  switch(resolution)
  {
    case 0uLL:
      v11 = (void *)MEMORY[0x1E0CB3940];
      +[NSBundle bs_baseBoardUIBundle]();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (comparedToNow == 1)
        objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("RELATIVE_DATE_FUTURE_SECONDS"), &stru_1E4349708, &stru_1E4349708);
      else
        objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("RELATIVE_DATE_PAST_SECONDS"), &stru_1E4349708, &stru_1E4349708);
      goto LABEL_25;
    case 1uLL:
      v11 = (void *)MEMORY[0x1E0CB3940];
      +[NSBundle bs_baseBoardUIBundle]();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v17;
      if (comparedToNow == 1)
        objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("RELATIVE_DATE_FUTURE_MINUTES"), &stru_1E4349708, &stru_1E4349708);
      else
        objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("RELATIVE_DATE_PAST_MINUTES"), &stru_1E4349708, &stru_1E4349708);
      goto LABEL_25;
    case 2uLL:
      v14 = comparedToNow == 1 && value > 1;
      if (v14 || (comparedToNow != 1 ? (v15 = value >= 4) : (v15 = 0), v15))
      {
        v28.receiver = self;
        v28.super_class = (Class)BSUIRelativeDateLabel;
        -[BSUIDefaultDateLabel constructLabelString](&v28, sel_constructLabelString);
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
      v11 = (void *)MEMORY[0x1E0CB3940];
      +[NSBundle bs_baseBoardUIBundle]();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v16;
      if (comparedToNow == 1)
        objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("RELATIVE_DATE_FUTURE_HOURS"), &stru_1E4349708, &stru_1E4349708);
      else
        objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("RELATIVE_DATE_PAST_HOURS"), &stru_1E4349708, &stru_1E4349708);
LABEL_25:
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringWithFormat:", v18, value);
      v19 = objc_claimAutoreleasedReturnValue();
      goto LABEL_33;
    case 3uLL:
      if (comparedToNow == 1)
      {
        v29.receiver = self;
        v29.super_class = (Class)BSUIRelativeDateLabel;
        -[BSUIDefaultDateLabel constructLabelString](&v29, sel_constructLabelString);
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
      v20 = (void *)MEMORY[0x1E0CB3940];
      +[NSBundle bs_baseBoardUIBundle]();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("RELATIVE_DATE_PAST_DAYS"), &stru_1E4349708, &stru_1E4349708);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringWithFormat:", v18, value);
      v19 = objc_claimAutoreleasedReturnValue();
LABEL_33:
      v10 = (void *)v19;

      if (!v10)
        goto LABEL_35;
      break;
    default:
      goto LABEL_35;
  }
  return v10;
}

- (void)timerFiredWithValue:(unint64_t)a3 forResolution:(unint64_t)a4 comparedToNow:(int64_t)a5
{
  self->_value = a3;
  self->_resolution = a4;
  self->_comparedToNow = a5;
  -[BSUIDefaultDateLabel updateTextIfNecessary](self, "updateTextIfNecessary");
}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  id v5;

  -[BSUIRelativeDateLabel window](self, "window");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_alwaysOnEnvironment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:", self);

}

- (void)willMoveToWindow:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  id v11;

  v11 = a3;
  -[BSUIRelativeDateLabel window](self, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_alwaysOnEnvironment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self);

  objc_msgSend(v11, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (self->_invalidateTimelineOnReuse && v7 != 0)
  {
    objc_msgSend(v7, "_backlightSceneEnvironment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "invalidateAllTimelinesForReason:", CFSTR("BSUIRelativeDateLabel Reuse"));

    self->_invalidateTimelineOnReuse = 0;
  }

}

- (id)_timelineIdentifier
{
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BSUIRelativeDateLabel: 0x%p"), a1);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (void)_setOverrideTimerFireInfo:(id)a3
{
  BSRelativeDateTimerFireInfo *v4;
  BSRelativeDateTimerFireInfo *overrideTimerFireInfo;
  BSRelativeDateTimerFireInfo *v6;

  v6 = (BSRelativeDateTimerFireInfo *)a3;
  if (self->_overrideTimerFireInfo != v6)
  {
    v4 = (BSRelativeDateTimerFireInfo *)-[BSRelativeDateTimerFireInfo copy](v6, "copy");
    overrideTimerFireInfo = self->_overrideTimerFireInfo;
    self->_overrideTimerFireInfo = v4;

    -[BSUIDefaultDateLabel updateTextIfNecessary](self, "updateTextIfNecessary");
  }

}

- (id)_timelinesForDateInterval:(id)a3
{
  id v4;
  BSRelativeDateTimer *relativeDateTimer;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BSRelativeDateTimer *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  relativeDateTimer = self->_relativeDateTimer;
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSRelativeDateTimer nextFireAfterDate:](relativeDateTimer, "nextFireAfterDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  while (1)
  {

    objc_msgSend(v7, "fireDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v4, "containsDate:", v9);

    if (!v10)
      break;
    -[BSUIRelativeDateLabel _setOverrideTimerFireInfo:](self, "_setOverrideTimerFireInfo:", v7);
    -[BSUIRelativeDateLabel text](self, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "isEqualToString:", v6);
    v12 = objc_msgSend(v6, "copy");

    if ((v11 & 1) == 0)
    {
      if (objc_msgSend(v7, "resolution"))
        v13 = 1;
      else
        v13 = 2;
      v14 = (void *)MEMORY[0x1E0D00F40];
      objc_msgSend(v7, "fireDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v7, "copy");
      objc_msgSend(v14, "entryForPresentationTime:withRequestedFidelity:animated:userObject:", v15, v13, 0, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v26, "addObject:", v17);
    }
    v18 = self->_relativeDateTimer;
    objc_msgSend(v7, "fireDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSRelativeDateTimer nextFireAfterDate:](v18, "nextFireAfterDate:", v19);
    v20 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v12;
    v7 = (void *)v20;
  }
  -[BSUIRelativeDateLabel _setOverrideTimerFireInfo:](self, "_setOverrideTimerFireInfo:", 0);
  v21 = (void *)MEMORY[0x1E0D00F38];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BSUIRelativeDateLabel: 0x%p"), self);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "timelineWithEntries:identifier:configure:", v26, v22, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v27[0] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (void)_timelinesForDateInterval:(id)a3 completion:(id)a4
{
  void *v6;
  void (**v7)(id, void *);

  v7 = (void (**)(id, void *))a4;
  -[BSUIRelativeDateLabel _timelinesForDateInterval:](self, "_timelinesForDateInterval:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v7[2](v7, v6);

}

- (void)_updateWithFrameSpecifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;

  v12 = a3;
  if (v12)
  {
    -[BSUIRelativeDateLabel _timelineIdentifier](self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "entrySpecifierForTimelineIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "timelineEntry");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "userObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_class();
    v9 = v7;
    if (v8)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = v9;
      else
        v10 = 0;
    }
    else
    {
      v10 = 0;
    }
    v11 = v10;

    -[BSUIRelativeDateLabel _setOverrideTimerFireInfo:](self, "_setOverrideTimerFireInfo:", v11);
  }
  else
  {
    -[BSUIRelativeDateLabel _setOverrideTimerFireInfo:](self, "_setOverrideTimerFireInfo:", 0);
  }

}

- (void)_updateWithFrameSpecifier:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  id v7;

  v7 = a3;
  v6 = (void (**)(_QWORD))a4;
  -[BSUIRelativeDateLabel _updateWithFrameSpecifier:](self, "_updateWithFrameSpecifier:", v7);
  if (v6)
    v6[2](v6);

}

- (BSRelativeDateTimerFireInfo)_overrideTimerFireInfo
{
  return self->_overrideTimerFireInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideTimerFireInfo, 0);
  objc_storeStrong((id *)&self->_relativeDateTimer, 0);
}

@end
