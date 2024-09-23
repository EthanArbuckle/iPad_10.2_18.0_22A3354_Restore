@implementation ATXAppIntentDuetDataProvider

+ (Class)supportedDuetEventClass
{
  return (Class)objc_opt_class();
}

+ (int64_t)supportedCoreDuetStream
{
  return 7;
}

- (id)fetchEventsBetweenStartDate:(id)a3 andEndDate:(id)a4 withPredicates:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  +[_ATXDataStore sharedInstance](_ATXDataStore, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appIntentDuetEventsForActionsBetweenStartDate:endDate:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
