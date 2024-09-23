@implementation ATXUserNotificationLoggingEvent(TimedEvent)

- (uint64_t)eventTime
{
  void *v1;

  v1 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(a1, "timestamp");
  return objc_msgSend(v1, "dateWithTimeIntervalSinceReferenceDate:");
}

@end
