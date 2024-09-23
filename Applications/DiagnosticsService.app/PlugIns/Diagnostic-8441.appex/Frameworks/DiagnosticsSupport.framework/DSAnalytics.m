@implementation DSAnalytics

+ (void)sendAnalyticsWithEvent:(unint64_t)a3
{
  +[DSAnalytics sendAnalyticsWithEvent:payloadDict:](DSAnalytics, "sendAnalyticsWithEvent:payloadDict:", a3, &__NSDictionary0__struct);
}

+ (void)sendAnalyticsWithEvent:(unint64_t)a3 error:(id)a4
{
  id v5;
  __CFString *v6;
  _UNKNOWN **v7;
  __CFString *v8;
  void *v9;
  _QWORD v10[3];
  _QWORD v11[3];

  if (a4)
  {
    v5 = a4;
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domain"));
    v7 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v5, "code")));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedDescription"));

  }
  else
  {
    v7 = &off_1C068;
    v8 = &stru_18E68;
    v6 = &stru_18E68;
  }
  v10[0] = CFSTR("errorDomain");
  v10[1] = CFSTR("errorCode");
  v11[0] = v6;
  v11[1] = v7;
  v10[2] = CFSTR("errorMessage");
  v11[2] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 3));
  +[DSAnalytics sendAnalyticsWithEvent:payloadDict:](DSAnalytics, "sendAnalyticsWithEvent:payloadDict:", a3, v9);

}

+ (void)sendAnalyticsWithEvent:(unint64_t)a3 payloadDict:(id)a4
{
  __CFString *v4;
  __CFString *v5;
  id v6;

  if (a3 > 0x12)
  {
    v4 = 0;
    v5 = 0;
  }
  else
  {
    v4 = off_18740[a3];
    v5 = off_187D8[a3];
  }
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", a4));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v4, CFSTR("type"));
  AnalyticsSendEvent(v5, v6);

}

@end
