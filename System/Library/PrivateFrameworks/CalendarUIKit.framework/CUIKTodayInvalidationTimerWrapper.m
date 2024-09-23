@implementation CUIKTodayInvalidationTimerWrapper

- (CUIKTodayInvalidationTimerWrapper)initWithCalendar:(id)a3
{
  id v4;
  CUIKTodayInvalidationTimerWrapper *v5;
  CUIKTodayInvalidationTimerWrapper *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CUIKTodayInvalidationTimerWrapper;
  v5 = -[CUIKTodayInvalidationTimerWrapper init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[CUIKTodayInvalidationTimerWrapper _setupTimeZoneTimerWithCalendar:](v5, "_setupTimeZoneTimerWithCalendar:", v4);

  return v6;
}

- (void)_setupTimeZoneTimerWithCalendar:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E80], "calendarTimeZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEquivalentTo:", v6);

  if ((v7 & 1) != 0)
  {
    -[CUIKTodayInvalidationTimerWrapper _killTimeZoneTimer](self, "_killTimeZoneTimer");
  }
  else
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v8, "setDay:", 1);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateByAddingComponents:toDate:options:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "components:fromDate:", 30, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateFromComponents:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __69__CUIKTodayInvalidationTimerWrapper__setupTimeZoneTimerWithCalendar___block_invoke;
    v14[3] = &unk_1E6EB6170;
    v14[4] = self;
    v15 = v12;
    v13 = v12;
    dispatch_async(MEMORY[0x1E0C80D38], v14);

  }
}

- (void)_killTimeZoneTimer
{
  NSTimer *tzSupportDayRolloverTimer;
  NSTimer *v4;

  tzSupportDayRolloverTimer = self->_tzSupportDayRolloverTimer;
  if (tzSupportDayRolloverTimer)
  {
    -[NSTimer invalidate](tzSupportDayRolloverTimer, "invalidate");
    v4 = self->_tzSupportDayRolloverTimer;
    self->_tzSupportDayRolloverTimer = 0;

  }
}

- (void)dealloc
{
  objc_super v3;

  -[CUIKTodayInvalidationTimerWrapper _killTimeZoneTimer](self, "_killTimeZoneTimer");
  v3.receiver = self;
  v3.super_class = (Class)CUIKTodayInvalidationTimerWrapper;
  -[CUIKTodayInvalidationTimerWrapper dealloc](&v3, sel_dealloc);
}

void __69__CUIKTodayInvalidationTimerWrapper__setupTimeZoneTimerWithCalendar___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_killTimeZoneTimer");
  v2 = (void *)MEMORY[0x1E0C99E88];
  v3 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v7);
  objc_msgSend(v2, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", *(_QWORD *)(a1 + 32), sel_invalidateTodayAndNotifyIfChanged, 0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v4;

}

- (BOOL)todayChangedAfterInvalidation
{
  void *v3;
  void *v4;
  void *v5;
  int v6;

  CUIKTodayDate();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CUIKInvalidateToday();
  CUIKCalendar();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUIKTodayInvalidationTimerWrapper _setupTimeZoneTimerWithCalendar:](self, "_setupTimeZoneTimerWithCalendar:", v4);
  if (v3)
  {
    CUIKTodayDate();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "isEqualToDate:", v5) ^ 1;

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (void)invalidateTodayAndNotifyIfChanged
{
  id v2;

  if (-[CUIKTodayInvalidationTimerWrapper todayChangedAfterInvalidation](self, "todayChangedAfterInvalidation"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "postNotificationName:object:", CFSTR("CalTodayChangedNotification"), 0);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tzSupportDayRolloverTimer, 0);
}

@end
