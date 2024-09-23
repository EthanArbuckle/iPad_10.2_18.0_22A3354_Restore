@implementation ATXLocationEnterAnchor

+ (Class)supportedDuetDataProviderClass
{
  return (Class)objc_opt_class();
}

+ (id)duetEventsPredicates
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (int64_t)anchorType
{
  return 7;
}

+ (id)longDescription
{
  return CFSTR("The user entered a known LOI.");
}

+ (double)secondsOfInfluence
{
  return 3600.0;
}

+ (BOOL)shouldPredicateOnStartDate
{
  return 1;
}

+ (BOOL)usesContextStoreForRealTimeNotifications
{
  return 0;
}

+ (void)registerForNotificationsWithoutUsingContextStoreForObserver:(id)a3 enterSelector:(SEL)a4 exitSelector:(SEL)a5
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB37D0];
  v7 = a3;
  objc_msgSend(v6, "defaultCenter");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", v7, a4, *MEMORY[0x1E0D80E88], 0);

}

+ (void)unregisterForNotificationsWithoutUsingContextStoreForObserver:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0CB37D0];
  v4 = a3;
  objc_msgSend(v3, "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", v4, *MEMORY[0x1E0D80E88], 0);

}

+ (id)keyPathForContextStore
{
  return 0;
}

+ (id)predicateForContextStoreRegistration
{
  return 0;
}

+ (BOOL)shouldProcessContextStoreNotification
{
  return 0;
}

+ (BOOL)isActive
{
  return 1;
}

+ (id)sampleEvent
{
  ATXLocationVisitDuetEvent *v2;
  void *v3;
  void *v4;
  void *v5;
  ATXLocationVisitDuetEvent *v6;

  v2 = [ATXLocationVisitDuetEvent alloc];
  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -20.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -10.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ATXLocationVisitDuetEvent initWithLocationOfInterestIdentifier:startDate:endDate:](v2, "initWithLocationOfInterestIdentifier:startDate:endDate:", v3, v4, v5);

  return v6;
}

@end
