@implementation HUCalendarScrubberDataSource

- (HUCalendarScrubberDataSource)initWithCameraClipManager:(id)a3 datesWithClips:(id)a4
{
  id v6;
  id v7;
  HUCalendarScrubberDataSource *v8;
  HUCalendarScrubberDataSource *v9;
  NSSet *v10;
  NSSet *datesWithClips;
  uint64_t v12;
  NSHashTable *changeObservers;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HUCalendarScrubberDataSource;
  v8 = -[HUCalendarScrubberDataSource init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_clipManager, v6);
    if (v7)
    {
      v10 = (NSSet *)v7;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v10 = (NSSet *)objc_claimAutoreleasedReturnValue();
    }
    datesWithClips = v9->_datesWithClips;
    v9->_datesWithClips = v10;

    -[HUCalendarScrubberDataSource reloadDates](v9, "reloadDates");
    -[HUCalendarScrubberDataSource _updateDateBoundariesIfNeeded](v9, "_updateDateBoundariesIfNeeded");
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v12 = objc_claimAutoreleasedReturnValue();
    changeObservers = v9->_changeObservers;
    v9->_changeObservers = (NSHashTable *)v12;

  }
  return v9;
}

- (HUCalendarScrubberDataSource)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithCameraClipManager_datesWithClips_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUCalendarScrubberDataSource.m"), 46, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUCalendarScrubberDataSource init]",
    v5);

  return 0;
}

- (void)_updateDateBoundariesIfNeeded
{
  void *v3;
  NSDate *v4;
  NSDate *startDate;
  NSDate *v6;
  NSDate *endDate;
  id v8;

  if (!self->_startDate)
  {
    -[NSArray firstObject](self->_dates, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "hf_startOfWeek");
    v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
    startDate = self->_startDate;
    self->_startDate = v4;

  }
  if (!self->_endDate)
  {
    -[NSArray lastObject](self->_dates, "lastObject");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hf_endOfWeek");
    v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
    endDate = self->_endDate;
    self->_endDate = v6;

  }
}

- (BOOL)eventExistsForItemAtIndexPath:(id)a3
{
  HUCalendarScrubberDataSource *v3;
  void *v4;

  v3 = self;
  -[HUCalendarScrubberDataSource dateAtIndexPath:](self, "dateAtIndexPath:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = -[HUCalendarScrubberDataSource eventExistsOnDate:](v3, "eventExistsOnDate:", v4);

  return (char)v3;
}

- (id)indexPathForDate:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  -[HUCalendarScrubberDataSource startDate](self, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "hf_daysBetweenDates:endDate:", v6, v5);

  return (id)objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v7 % 7);
}

- (id)dateAtIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "section");
  v6 = objc_msgSend(v4, "item");

  v7 = v6 - v5 + 8 * v5;
  objc_msgSend(MEMORY[0x1E0C99D68], "hf_sharedCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCalendarScrubberDataSource startDate](self, "startDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateByAddingUnit:value:toDate:options:", 16, v7, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)eventExistsOnDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HUCalendarScrubberDataSource datesWithClips](self, "datesWithClips");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_startOfDay");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "containsObject:", v6);
  return (char)v4;
}

- (unint64_t)totalNumberOfWeeks
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[HUCalendarScrubberDataSource startDate](self, "startDate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[HUCalendarScrubberDataSource endDate](self, "endDate"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    v6 = (void *)MEMORY[0x1E0C99D68];
    -[HUCalendarScrubberDataSource startDate](self, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCalendarScrubberDataSource endDate](self, "endDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "hf_daysBetweenDates:endDate:", v7, v8);

    if (v9 % 7)
      return v9 / 7 + 1;
    else
      return v9 / 7;
  }
  else
  {
    HFLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      -[HUCalendarScrubberDataSource dates](self, "dates");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 134217984;
      v14 = objc_msgSend(v12, "count");
      _os_log_debug_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEBUG, "A request to layout the calendar has been made before there are any dates (count:%lu). The calendar will remain hidden.", (uint8_t *)&v13, 0xCu);

    }
    return 0;
  }
}

- (id)dayOfWeekForItemAtIndexPath:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0C99D68];
  v4 = a3;
  objc_msgSend(v3, "hf_sharedCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "item");

  v7 = (v6 + objc_msgSend(v5, "firstWeekday") - 1) % 7uLL;
  objc_msgSend(v5, "veryShortStandaloneWeekdaySymbols");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (int64_t)dayOfMonthForItemAtIndexPath:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  -[HUCalendarScrubberDataSource dateAtIndexPath:](self, "dateAtIndexPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "hf_sharedCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "component:fromDate:", 16, v3);

  return v5;
}

- (id)shortMonthNameForItemAtIndexPath:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "hf_sharedCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCalendarScrubberDataSource dateAtIndexPath:](self, "dateAtIndexPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v6, "component:fromDate:", 8, v7) - 1;
  objc_msgSend(v6, "shortStandaloneMonthSymbols");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "capitalizedString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)updateDatesWithClips:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  uint8_t v8[16];

  v4 = a3;
  -[HUCalendarScrubberDataSource datesWithClips](self, "datesWithClips");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToSet:", v4);

  -[HUCalendarScrubberDataSource setDatesWithClips:](self, "setDatesWithClips:", v4);
  if ((v6 & 1) == 0)
  {
    HFLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "Requesting a calendar refresh after event update.", v8, 2u);
    }

    -[HUCalendarScrubberDataSource reloadDates](self, "reloadDates");
  }
}

- (void)reloadDates
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  -[HUCalendarScrubberDataSource datesWithClips](self, "datesWithClips");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_74);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCalendarScrubberDataSource setDates:](self, "setDates:", v5);

  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[HUCalendarScrubberDataSource dates](self, "dates");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v37 = v7;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "Reloading dates containing clips:%@", buf, 0xCu);

  }
  -[HUCalendarScrubberDataSource dates](self, "dates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUCalendarScrubberDataSource dates](self, "dates");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUCalendarScrubberDataSource _updateDateBoundariesIfNeeded](self, "_updateDateBoundariesIfNeeded");
  -[HUCalendarScrubberDataSource startDate](self, "startDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "earlierDate:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToDate:", v9);

  if (v14)
  {
    HFLogForCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      -[HUCalendarScrubberDataSource startDate](self, "startDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "hf_startOfWeek");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v37 = v16;
      v38 = 2112;
      v39 = v17;
      _os_log_impl(&dword_1B8E1E000, v15, OS_LOG_TYPE_DEFAULT, "Updating calendar start date from:%@ to:%@", buf, 0x16u);

    }
    objc_msgSend(v9, "hf_startOfWeek");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCalendarScrubberDataSource setStartDate:](self, "setStartDate:", v18);

  }
  -[HUCalendarScrubberDataSource endDate](self, "endDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "laterDate:", v11);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isEqualToDate:", v11);

  if (v21)
  {
    HFLogForCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      -[HUCalendarScrubberDataSource endDate](self, "endDate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "hf_endOfWeek");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v37 = v23;
      v38 = 2112;
      v39 = v24;
      _os_log_impl(&dword_1B8E1E000, v22, OS_LOG_TYPE_DEFAULT, "Updating calendar end date from:%@ to:%@", buf, 0x16u);

    }
    objc_msgSend(v11, "hf_endOfWeek");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCalendarScrubberDataSource setEndDate:](self, "setEndDate:", v25);

  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[HUCalendarScrubberDataSource changeObservers](self, "changeObservers", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v32;
    do
    {
      v30 = 0;
      do
      {
        if (*(_QWORD *)v32 != v29)
          objc_enumerationMutation(v26);
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v30++), "scrubberDataSourceDidReload:", self);
      }
      while (v28 != v30);
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v28);
  }

}

uint64_t __43__HUCalendarScrubberDataSource_reloadDates__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)addChangeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUCalendarScrubberDataSource changeObservers](self, "changeObservers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)removeChangeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUCalendarScrubberDataSource changeObservers](self, "changeObservers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (NSSet)datesWithClips
{
  return self->_datesWithClips;
}

- (void)setDatesWithClips:(id)a3
{
  objc_storeStrong((id *)&self->_datesWithClips, a3);
}

- (NSArray)dates
{
  return self->_dates;
}

- (void)setDates:(id)a3
{
  objc_storeStrong((id *)&self->_dates, a3);
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

- (NSHashTable)changeObservers
{
  return self->_changeObservers;
}

- (void)setChangeObservers:(id)a3
{
  objc_storeStrong((id *)&self->_changeObservers, a3);
}

- (HMCameraClipManager)clipManager
{
  return (HMCameraClipManager *)objc_loadWeakRetained((id *)&self->_clipManager);
}

- (void)setClipManager:(id)a3
{
  objc_storeWeak((id *)&self->_clipManager, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_clipManager);
  objc_storeStrong((id *)&self->_changeObservers, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_dates, 0);
  objc_storeStrong((id *)&self->_datesWithClips, 0);
}

@end
