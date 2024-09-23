@implementation HKCalendarCache

- (HKCalendarCache)init
{
  HKCalendarCache *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *calendarsByTimeZoneName;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKCalendarCache;
  v2 = -[HKCalendarCache init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    calendarsByTimeZoneName = v2->_calendarsByTimeZoneName;
    v2->_calendarsByTimeZoneName = v3;

  }
  return v2;
}

- (id)calendarForTimeZone:(id)a3
{
  id v5;
  NSMutableDictionary *calendarsByTimeZoneName;
  void *v7;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;
  void *v13;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKCalendarCache.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("timeZone != nil"));

  }
  calendarsByTimeZoneName = self->_calendarsByTimeZoneName;
  objc_msgSend(v5, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](calendarsByTimeZoneName, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    _HKInitializeLogging();
    v9 = (void *)HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_DEBUG))
      -[HKCalendarCache calendarForTimeZone:].cold.1(v9, (uint64_t)self, (uint64_t)v5);
    objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTimeZone:", v5);
    v10 = self->_calendarsByTimeZoneName;
    objc_msgSend(v5, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v8, v11);

  }
  return v8;
}

- (id)currentCalendar
{
  NSCalendar *test_currentCalendar;
  NSCalendar *v3;
  void *v5;
  void *v6;

  test_currentCalendar = self->_test_currentCalendar;
  if (test_currentCalendar)
  {
    v3 = test_currentCalendar;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeZone");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKCalendarCache calendarForTimeZone:](self, "calendarForTimeZone:", v6);
    v3 = (NSCalendar *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

+ (id)earliestTimeZoneCalendar
{
  if (earliestTimeZoneCalendar_onceToken != -1)
    dispatch_once(&earliestTimeZoneCalendar_onceToken, &__block_literal_global_135);
  return (id)earliestTimeZoneCalendar_calendar;
}

void __43__HKCalendarCache_earliestTimeZoneCalendar__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendar");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)earliestTimeZoneCalendar_calendar;
  earliestTimeZoneCalendar_calendar = v0;

  v2 = (void *)earliestTimeZoneCalendar_calendar;
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", -43200);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTimeZone:", v3);

}

+ (id)latestTimeZoneCalendar
{
  if (latestTimeZoneCalendar_onceToken[0] != -1)
    dispatch_once(latestTimeZoneCalendar_onceToken, &__block_literal_global_13_3);
  return (id)latestTimeZoneCalendar_calendar;
}

void __41__HKCalendarCache_latestTimeZoneCalendar__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendar");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)latestTimeZoneCalendar_calendar;
  latestTimeZoneCalendar_calendar = v0;

  v2 = (void *)latestTimeZoneCalendar_calendar;
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 50400);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTimeZone:", v3);

}

- (void)_test_setCurrentCalendar:(id)a3
{
  objc_storeStrong((id *)&self->_test_currentCalendar, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_test_currentCalendar, 0);
  objc_storeStrong((id *)&self->_calendarsByTimeZoneName, 0);
}

- (void)calendarForTimeZone:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  NSObject *v5;
  id v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v7 = 138543874;
  v8 = (id)objc_opt_class();
  v9 = 2048;
  v10 = a2;
  v11 = 2114;
  v12 = a3;
  v6 = v8;
  _os_log_debug_impl(&dword_19A0E6000, v5, OS_LOG_TYPE_DEBUG, "[%{public}@.%p] Creating new calendar for time zone: %{public}@", (uint8_t *)&v7, 0x20u);

}

@end
