@implementation EKUIAccountErrorsAnalyticsTracker

+ (void)trackRootUIDisplayedError
{
  CalAnalyticsSendEvent();
}

+ (void)trackRootUIInteractedWithError
{
  CalAnalyticsSendEvent();
}

+ (void)trackCalendarListDisplayedActionableError
{
  objc_msgSend(a1, "_trackErrorShown:", 0);
}

+ (void)trackCalendarListDisplayedUnknownError
{
  objc_msgSend(a1, "_trackErrorShown:", 1);
}

+ (void)trackCalendarListDisplayedOfflineError
{
  objc_msgSend(a1, "_trackErrorShown:", 2);
}

+ (void)trackCalendarListDisplayedOtherError
{
  objc_msgSend(a1, "_trackErrorShown:", 3);
}

+ (void)_trackErrorShown:(unint64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("ErrorType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  CalAnalyticsSendEvent();
}

+ (void)trackCalendarListInteractedWithError
{
  CalAnalyticsSendEvent();
}

@end
