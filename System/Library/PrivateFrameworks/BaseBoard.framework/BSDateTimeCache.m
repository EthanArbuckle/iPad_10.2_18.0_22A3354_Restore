@implementation BSDateTimeCache

- (BSDateTimeCache)init
{
  BSDateTimeCache *v2;
  BSDateTimeCache *v3;
  void *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BSDateTimeCache;
  v2 = -[BSDateTimeCache init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[BSDateTimeCache _resetAndConfigureAndPostNotification:]((uint64_t)v2, 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__resetAndConfigure, *MEMORY[0x1E0C99720], 0);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)_BSHandleSignificantTimeChange, CFSTR("SignificantTimeChangeNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);

  }
  return v3;
}

- (void)_resetAndConfigureAndPostNotification:(uint64_t)a1
{
  __CFCalendar *v4;
  double Current;
  double v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  double v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a1 && !*(_BYTE *)(a1 + 80))
  {
    *(_BYTE *)(a1 + 80) = 1;
    v4 = CFCalendarCopyCurrent();
    Current = CFAbsoluteTimeGetCurrent();
    v6 = Current;
    if (v4)
    {
      *(_QWORD *)(a1 + 16) = 0;
      CFCalendarGetTimeRangeOfUnit(v4, 0x10uLL, Current, (CFAbsoluteTime *)(a1 + 16), 0);
      *(_QWORD *)(a1 + 8) = *(_QWORD *)(a1 + 16);
      CFCalendarAddComponents(v4, (CFAbsoluteTime *)(a1 + 8), 0, "d", 0xFFFFFFFFLL);
      *(_QWORD *)(a1 + 24) = *(_QWORD *)(a1 + 16);
      CFCalendarAddComponents(v4, (CFAbsoluteTime *)(a1 + 24), 0, "d", 1);
      *(_QWORD *)(a1 + 32) = *(_QWORD *)(a1 + 16);
      CFCalendarAddComponents(v4, (CFAbsoluteTime *)(a1 + 32), 0, "d", 2);
      *(_QWORD *)(a1 + 48) = *(_QWORD *)(a1 + 16);
      CFCalendarAddComponents(v4, (CFAbsoluteTime *)(a1 + 48), 0, "d", 4294967289);
      *(_QWORD *)(a1 + 40) = *(_QWORD *)(a1 + 16);
      CFCalendarAddComponents(v4, (CFAbsoluteTime *)(a1 + 40), 0, "d", 4294967290);
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(a1 + 16);
      CFCalendarAddComponents(v4, (CFAbsoluteTime *)(a1 + 56), 0, "d", 7);
      if (a2)
      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "postNotificationName:object:", CFSTR("BSDateTimeCacheChangedNotification"), a1);

      }
      CFRelease(v4);
      *(double *)(a1 + 72) = v6;
      BSLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        v9 = (void *)objc_opt_class();
        v10 = *(_QWORD *)(a1 + 16);
        v11 = *(_QWORD *)(a1 + 24);
        *(_DWORD *)buf = 138544130;
        v15 = v9;
        v16 = 2048;
        v17 = v6;
        v18 = 2048;
        v19 = v10;
        v20 = 2048;
        v21 = v11;
        v12 = v9;
        _os_log_debug_impl(&dword_18A184000, v8, OS_LOG_TYPE_DEBUG, "Updated %{public}@ now=%f 'today'=%f 'tomorrow'=%f", buf, 0x2Au);

      }
    }
    else
    {
      BSLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v15 = (id)objc_opt_class();
        v16 = 2112;
        v17 = 0.0;
        v13 = v15;
        _os_log_error_impl(&dword_18A184000, v8, OS_LOG_TYPE_ERROR, "Couldn't update %{public}@ because we don't have a current calendar -> %@", buf, 0x16u);

      }
    }

    *(double *)(a1 + 64) = v6;
    *(_BYTE *)(a1 + 80) = 0;
  }
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v4;
  objc_super v5;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("SignificantTimeChangeNotification"), 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)BSDateTimeCache;
  -[BSDateTimeCache dealloc](&v5, sel_dealloc);
}

+ (id)sharedInstance
{
  if (qword_1ECD39918 != -1)
    dispatch_once(&qword_1ECD39918, &__block_literal_global_16);
  return (id)_MergedGlobals_18;
}

void __33__BSDateTimeCache_sharedInstance__block_invoke()
{
  BSDateTimeCache *v0;
  void *v1;

  v0 = objc_alloc_init(BSDateTimeCache);
  v1 = (void *)_MergedGlobals_18;
  _MergedGlobals_18 = (uint64_t)v0;

}

- (double)today
{
  -[BSDateTimeCache _resetAndConfigureIfNecessary]((double *)self);
  return self->_today;
}

- (void)_resetAndConfigureIfNecessary
{
  double Current;

  if (a1)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (a1[2] > Current || a1[3] <= Current)
      objc_msgSend(a1, "_resetAndConfigure");
  }
}

- (double)tomorrow
{
  -[BSDateTimeCache _resetAndConfigureIfNecessary]((double *)self);
  return self->_tomorrow;
}

- (double)yesterday
{
  -[BSDateTimeCache _resetAndConfigureIfNecessary]((double *)self);
  return self->_yesterday;
}

- (double)prevWeek
{
  -[BSDateTimeCache _resetAndConfigureIfNecessary]((double *)self);
  return self->_prevWeek;
}

- (double)nextWeek
{
  -[BSDateTimeCache _resetAndConfigureIfNecessary]((double *)self);
  return self->_nextWeek;
}

- (BOOL)isToday:(double)a3
{
  -[BSDateTimeCache _resetAndConfigureIfNecessary]((double *)self);
  return self && self->_today <= a3 && self->_tomorrow > a3;
}

- (BOOL)isTomorrow:(double)a3
{
  -[BSDateTimeCache _resetAndConfigureIfNecessary]((double *)self);
  return self->_tomorrow <= a3 && self->_2daysFromNow > a3;
}

- (BOOL)isYesterday:(double)a3
{
  -[BSDateTimeCache _resetAndConfigureIfNecessary]((double *)self);
  return self->_yesterday <= a3 && self->_today > a3;
}

- (BOOL)isWithinPrevWeek:(double)a3
{
  return -[BSDateTimeCache isWithinPrevWeek:includeToday:](self, "isWithinPrevWeek:includeToday:", 0, a3);
}

- (BOOL)isWithinPrevWeek:(double)a3 includeToday:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v7;

  v4 = a4;
  -[BSDateTimeCache _resetAndConfigureIfNecessary]((double *)self);
  if (v4)
  {
    if (self->_tomorrow > a3)
    {
      v7 = 40;
      return *(double *)((char *)&self->super.isa + v7) <= a3;
    }
  }
  else if (self->_today > a3)
  {
    v7 = 48;
    return *(double *)((char *)&self->super.isa + v7) <= a3;
  }
  return 0;
}

- (BOOL)isWithinNextWeek:(double)a3
{
  -[BSDateTimeCache _resetAndConfigureIfNecessary]((double *)self);
  return self->_tomorrow <= a3 && self->_nextWeek > a3;
}

- (void)_resetAndConfigure
{
  -[BSDateTimeCache _resetAndConfigureAndPostNotification:]((uint64_t)self, 1);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_lastAttemptedResetTime=%f"), *(_QWORD *)&self->_lastAttemptedResetTime);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_lastSuccessfulResetTime=%f"), *(_QWORD *)&self->_lastSuccessfulResetTime);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_yesterday=%f"), *(_QWORD *)&self->_yesterday);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_today=%f"), *(_QWORD *)&self->_today);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_tomorrow=%f"), *(_QWORD *)&self->_tomorrow);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v8);

  objc_msgSend(v3, "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
