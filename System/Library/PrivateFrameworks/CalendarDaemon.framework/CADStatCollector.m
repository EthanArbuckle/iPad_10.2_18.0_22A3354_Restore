@implementation CADStatCollector

+ (BOOL)enabled
{
  void *v2;
  char IsEventUsed;

  objc_msgSend(a1, "eventName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  IsEventUsed = CalAnalyticsIsEventUsed();

  return IsEventUsed;
}

- (BOOL)enabled
{
  void *v2;
  char IsEventUsed;

  -[CADStatCollector eventName](self, "eventName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  IsEventUsed = CalAnalyticsIsEventUsed();

  return IsEventUsed;
}

+ (id)eventName
{
  void *v2;
  NSObject *v3;
  id v4;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = (void *)CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
  {
    v3 = v2;
    v6 = 138412290;
    v7 = (id)objc_opt_class();
    v4 = v7;
    _os_log_impl(&dword_1B6A18000, v3, OS_LOG_TYPE_ERROR, "CADStat subclass %@ should override +eventName", (uint8_t *)&v6, 0xCu);

  }
  return 0;
}

- (id)eventName
{
  return (id)objc_msgSend((id)objc_opt_class(), "eventName");
}

- (BOOL)wantsStores
{
  return 0;
}

- (BOOL)wantsCalendars
{
  return 0;
}

- (BOOL)wantsOccurrences
{
  return 0;
}

- (BOOL)wantsEvents
{
  return 0;
}

- (id)desiredOccurrenceRange
{
  return 0;
}

- (id)eventDictionaries
{
  return (id)MEMORY[0x1E0C9AA60];
}

@end
