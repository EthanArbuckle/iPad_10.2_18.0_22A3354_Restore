@implementation SRUIDSurveyEnablementUtility

+ (id)userDefaults
{
  if (qword_1001503A8 != -1)
    dispatch_once(&qword_1001503A8, &stru_100122CB0);
  return (id)qword_1001503A0;
}

+ (BOOL)shouldAllowSurveyByDefault
{
  return 0;
}

+ (BOOL)shouldEnableCoreAnalyticEvent
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "userDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "enableCoreAnalyticEventKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", v4));

  if (v5)
    v6 = objc_msgSend(v5, "BOOLValue");
  else
    v6 = 1;

  return v6;
}

+ (BOOL)isSurveyEnabled
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  BOOL v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "userDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "internalSurveyEnabledKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", v4));

  if (v5)
    v6 = objc_msgSend(v5, "BOOLValue");
  else
    v6 = objc_msgSend(a1, "shouldAllowSurveyByDefault");
  v7 = v6;

  return v7;
}

+ (void)disableInternalUIDSurveyNotifications
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "userDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "internalSurveyEnabledKey"));
  objc_msgSend(v4, "setObject:forKey:", &__kCFBooleanFalse, v3);

}

+ (void)recordDateOfSurveyInteraction
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "userDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "lastSurveyReportKey"));
  objc_msgSend(v5, "setObject:forKey:", v3, v4);

}

+ (id)internalSurveyEnabledKey
{
  return CFSTR("allowInternalUIDSurvey");
}

+ (id)surveySampleRateKey
{
  return CFSTR("internalUIDSurveySampleRate");
}

+ (id)lastSurveyReportKey
{
  return CFSTR("lastSurveyReport");
}

+ (id)enableCoreAnalyticEventKey
{
  return CFSTR("enableCoreAnalyticsEvent");
}

+ (BOOL)meetsThresholdForPresenting
{
  if (arc4random_uniform((uint32_t)objc_msgSend(a1, "_sampleRate")))
    return 0;
  else
    return _objc_msgSend(a1, "minimumTimeBetweenLastReportHasElapsed");
}

+ (BOOL)minimumTimeBetweenLastReportHasElapsed
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_dateOfLastReport"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "dateByAddingTimeInterval:", 2419200.0));
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v5 = objc_msgSend(v4, "compare:", v3) == (id)1;

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

+ (id)_dateOfLastReport
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "userDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "lastSurveyReportKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", v4));

  return v5;
}

+ (unsigned)_sampleRate
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "userDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "surveySampleRateKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", v4));

  if (v5)
    v6 = objc_msgSend(v5, "intValue");
  else
    v6 = 10;

  return v6;
}

@end
