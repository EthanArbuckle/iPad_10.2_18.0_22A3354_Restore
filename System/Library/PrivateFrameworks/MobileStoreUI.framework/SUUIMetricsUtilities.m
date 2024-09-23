@implementation SUUIMetricsUtilities

+ (BOOL)showEventNotifications
{
  if (showEventNotifications_onceToken != -1)
    dispatch_once(&showEventNotifications_onceToken, &__block_literal_global_31);
  return showEventNotifications_showEventNotifications;
}

uint64_t __46__SUUIMetricsUtilities_showEventNotifications__block_invoke()
{
  int AppBooleanValue;
  uint64_t result;
  char v2;

  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("SUUIMetricsShowEventNotifications"), (CFStringRef)*MEMORY[0x24BEB2C88], 0);
  result = MGGetBoolAnswer();
  if (AppBooleanValue)
    v2 = result;
  else
    v2 = 0;
  showEventNotifications_showEventNotifications = v2;
  return result;
}

+ (BOOL)trackAllEvents
{
  if (trackAllEvents_onceToken != -1)
    dispatch_once(&trackAllEvents_onceToken, &__block_literal_global_4_0);
  return trackAllEvents_trackAllEvents;
}

uint64_t __38__SUUIMetricsUtilities_trackAllEvents__block_invoke()
{
  int AppBooleanValue;
  uint64_t result;
  char v2;

  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("SUUIMetricsTrackAll"), (CFStringRef)*MEMORY[0x24BEB2C88], 0);
  result = MGGetBoolAnswer();
  if (AppBooleanValue)
    v2 = result;
  else
    v2 = 0;
  trackAllEvents_trackAllEvents = v2;
  return result;
}

+ (double)timeIntervalFromJSTime:(id)a3
{
  double v3;

  objc_msgSend(a3, "doubleValue");
  return v3 / 1000.0;
}

+ (id)jsTimeFromTimeInterval:(double)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", (uint64_t)(a3 * 1000.0));
}

+ (id)newErrorPageEvent
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x24BEB1F10]);
  objc_msgSend(v2, "setPageDescription:", CFSTR("Error"));
  return v2;
}

+ (id)newErrorRetryClickEvent
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x24BEB1EC8]);
  objc_msgSend(v2, "setPageDescription:", CFSTR("Error"));
  objc_msgSend(v2, "setActionType:", CFSTR("retry"));
  objc_msgSend(v2, "setTargetType:", *MEMORY[0x24BEB2968]);
  return v2;
}

@end
