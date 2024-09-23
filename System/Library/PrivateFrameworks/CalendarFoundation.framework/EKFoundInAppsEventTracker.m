@implementation EKFoundInAppsEventTracker

+ (void)trackPseudoEventDateChanged
{
  CalAnalyticsSendEvent((uint64_t)CFSTR("CalendarEventFoundInApps.eventDateChanged"), 0);
}

+ (void)trackPseudoEventDetailsOpened
{
  CalAnalyticsSendEvent((uint64_t)CFSTR("CalendarEventFoundInApps.eventDetailsOpened"), 0);
}

+ (void)trackPseudoEventsExpired:(int)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (a3 >= 1)
  {
    v5 = CFSTR("count");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    CalAnalyticsSendEvent((uint64_t)CFSTR("CalendarEventFoundInApps.eventsExpired"), v4);
  }
}

+ (void)trackPseudoEventInitialTimeToLeaveFired
{
  CalAnalyticsSendEvent((uint64_t)CFSTR("CalendarEventFoundInApps.eventInitialTimeToLeaveFired"), 0);
}

@end
