@implementation DSAnalytics

+ (void)sendAnalyticsWithEvent:(unint64_t)a3
{
  +[DSAnalytics sendAnalyticsWithEvent:payloadDict:](DSAnalytics, "sendAnalyticsWithEvent:payloadDict:", a3, MEMORY[0x24BDBD1B8]);
}

+ (void)sendAnalyticsWithEvent:(unint64_t)a3 error:(id)a4
{
  id v5;
  __CFString *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x24BDAC8D0];
  if (a4)
  {
    v5 = a4;
    objc_msgSend(v5, "domain");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v5, "code"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedDescription");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = &unk_24E44DC48;
    v8 = &stru_24E44AA48;
    v6 = &stru_24E44AA48;
  }
  v10[0] = CFSTR("errorDomain");
  v10[1] = CFSTR("errorCode");
  v11[0] = v6;
  v11[1] = v7;
  v10[2] = CFSTR("errorMessage");
  v11[2] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[DSAnalytics sendAnalyticsWithEvent:payloadDict:](DSAnalytics, "sendAnalyticsWithEvent:payloadDict:", a3, v9);

}

+ (void)sendAnalyticsWithEvent:(unint64_t)a3 payloadDict:(id)a4
{
  __CFString *v4;
  id v5;

  if (a3 > 0x12)
    v4 = 0;
  else
    v4 = off_24E44A320[a3];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("type"));
  AnalyticsSendEvent();

}

@end
