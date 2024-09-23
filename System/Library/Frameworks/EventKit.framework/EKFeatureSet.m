@implementation EKFeatureSet

+ (BOOL)mustDisplaySplashScreenToUser
{
  void *v3;
  char v4;
  BOOL v5;
  void *v6;
  unint64_t v7;

  +[EKPreferences shared](EKPreferences, "shared");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "bypassSplashScreen");

  if ((v4 & 1) != 0)
    return 0;
  +[EKPreferences shared](EKPreferences, "shared");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "lastConfirmedSplashScreenVersion");
  v5 = v7 < objc_msgSend(a1, "_currentSplashScreenVersion");

  return v5;
}

+ (unint64_t)_currentSplashScreenVersion
{
  return 5;
}

+ (BOOL)isContinuitySupported
{
  return MGGetBoolAnswer();
}

+ (BOOL)areApplicationBadgesSupported
{
  return 1;
}

+ (BOOL)isTravelAdvisorySupported
{
  return MGGetBoolAnswer() ^ 1;
}

+ (BOOL)isConservativeEntryEnabled
{
  return MGGetBoolAnswer() ^ 1;
}

+ (BOOL)areVehicleTriggersEnabled
{
  return MGGetBoolAnswer() ^ 1;
}

+ (BOOL)areQuickActionsSupported
{
  return MGGetBoolAnswer();
}

+ (BOOL)isSuggestionsEnabled
{
  return MGGetBoolAnswer() ^ 1;
}

+ (BOOL)areContextualRemindersSupported
{
  return MGGetBoolAnswer() ^ 1;
}

+ (void)userAcknowledgedSplashScreen
{
  uint64_t v2;
  void *v3;
  __CFNotificationCenter *DarwinNotifyCenter;

  v2 = objc_msgSend(a1, "_currentSplashScreenVersion");
  +[EKPreferences shared](EKPreferences, "shared");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLastConfirmedSplashScreenVersion:", v2);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("EKFeatureSetDidChangeNotification"), 0, 0, 1u);
}

+ (BOOL)automaticGeocodingEnabled
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_opt_new();
  v3 = (unint64_t)objc_msgSend(v2, "lastConfirmedSplashScreenVersion") > 2;

  return v3;
}

+ (BOOL)eventsFoundInAppsEnabled
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_opt_new();
  v3 = (unint64_t)objc_msgSend(v2, "lastConfirmedSplashScreenVersion") > 3;

  return v3;
}

@end
