@implementation ATXWorkFocusModeEventProvider

- (ATXWorkFocusModeEventProvider)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ATXWorkFocusModeEventProvider;
  return -[ATXModeTransitionModeEventProvider initWithMode:](&v3, sel_initWithMode_, 2);
}

- (id)biomePublisherWithBookmark:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "dateBySettingHour:minute:second:ofDate:options:", 9, 0, 0, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_opt_new();
  objc_msgSend(v4, "dateBySettingHour:minute:second:ofDate:options:", 17, 0, 0, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[ATXModeTransitionModeEventProvider bmStoreEventsForLast61DaysWithStartDateToday:endDateToday:includeWeekends:includeHolidays:](self, "bmStoreEventsForLast61DaysWithStartDateToday:endDateToday:includeWeekends:includeHolidays:", v6, v8, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02478]), "initWithSequence:", v9);

  return v10;
}

@end
