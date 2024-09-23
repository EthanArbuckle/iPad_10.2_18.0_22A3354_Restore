@implementation AMUIDefaultDateProvider

- (AMUIDefaultDateProvider)init
{
  AMUIDefaultDateProvider *v2;
  uint64_t v3;
  NSCalendar *calendar;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AMUIDefaultDateProvider;
  v2 = -[AMUIDefaultDateProvider init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "autoupdatingCurrentCalendar");
    v3 = objc_claimAutoreleasedReturnValue();
    calendar = v2->_calendar;
    v2->_calendar = (NSCalendar *)v3;

  }
  return v2;
}

- (id)date
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE60], "date");
}

- (id)observeMinuteUpdatesWithHandler:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *minuteHandlers;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (!self->_minuteHandlers)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    minuteHandlers = self->_minuteHandlers;
    self->_minuteHandlers = v5;

  }
  v7 = (void *)MEMORY[0x24BDD16E0];
  ++self->_nextToken;
  objc_msgSend(v7, "numberWithUnsignedInteger:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v4, "copy");
  v10 = (void *)MEMORY[0x23B7EA970]();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_minuteHandlers, "setObject:forKeyedSubscript:", v10, v8);

  -[AMUIDefaultDateProvider _updateMinuteTimer](self, "_updateMinuteTimer");
  return v8;
}

- (void)removeMinuteUpdateHandler:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_minuteHandlers, "removeObjectForKey:", a3);
  -[AMUIDefaultDateProvider _updateMinuteTimer](self, "_updateMinuteTimer");
}

- (void)_updateMinuteTimer
{
  uint64_t v3;
  NSTimer *minuteTimer;
  NSTimer *v5;

  v3 = -[NSMutableDictionary count](self->_minuteHandlers, "count");
  minuteTimer = self->_minuteTimer;
  if (v3)
  {
    if (!minuteTimer)
    {
      -[AMUIDefaultDateProvider _scheduleNextMinuteTimer](self, "_scheduleNextMinuteTimer");
      return;
    }
  }
  else if (!minuteTimer)
  {
    return;
  }
  if (!-[NSMutableDictionary count](self->_minuteHandlers, "count"))
  {
    -[NSTimer invalidate](self->_minuteTimer, "invalidate");
    v5 = self->_minuteTimer;
    self->_minuteTimer = 0;

  }
}

- (void)_scheduleNextMinuteTimer
{
  void *v3;
  double v4;
  void *v5;
  NSTimer *v6;
  NSTimer *minuteTimer;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  -[AMUIDefaultDateProvider date](self, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = 0;
  v9 = 0;
  v10 = 0;
  -[NSCalendar getHour:minute:second:nanosecond:fromDate:](self->_calendar, "getHour:minute:second:nanosecond:fromDate:", &v12, &v11, &v10, &v9, v3);
  v4 = 60.0 - ((double)v9 / 1000000000.0 + (double)v10);
  -[NSTimer invalidate](self->_minuteTimer, "invalidate");
  objc_msgSend(v3, "dateByAddingTimeInterval:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (NSTimer *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF40]), "initWithFireDate:interval:target:selector:userInfo:repeats:", v5, self, sel__minuteTimerFired, 0, 0, 0.0);
  minuteTimer = self->_minuteTimer;
  self->_minuteTimer = v6;

  objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addTimer:forMode:", self->_minuteTimer, *MEMORY[0x24BDBCB80]);

}

- (void)_minuteTimerFired
{
  void *v3;
  NSMutableDictionary *minuteHandlers;
  id v5;
  _QWORD v6[4];
  id v7;

  -[AMUIDefaultDateProvider date](self, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  minuteHandlers = self->_minuteHandlers;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __44__AMUIDefaultDateProvider__minuteTimerFired__block_invoke;
  v6[3] = &unk_250763A60;
  v7 = v3;
  v5 = v3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](minuteHandlers, "enumerateKeysAndObjectsUsingBlock:", v6);
  -[AMUIDefaultDateProvider _scheduleNextMinuteTimer](self, "_scheduleNextMinuteTimer");

}

uint64_t __44__AMUIDefaultDateProvider__minuteTimerFired__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a3 + 16))(a3, *(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_minuteTimer, 0);
  objc_storeStrong((id *)&self->_minuteHandlers, 0);
}

@end
