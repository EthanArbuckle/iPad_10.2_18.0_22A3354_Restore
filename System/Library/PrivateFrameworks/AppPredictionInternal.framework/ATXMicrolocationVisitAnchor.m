@implementation ATXMicrolocationVisitAnchor

+ (Class)supportedDuetDataProviderClass
{
  return (Class)objc_opt_class();
}

+ (id)duetEventsPredicates
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("confidence >= %@"), &unk_1E83D0A20);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (int64_t)anchorType
{
  return 19;
}

+ (id)longDescription
{
  return CFSTR("User entered a microlocation.");
}

+ (double)secondsOfInfluence
{
  return 7200.0;
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
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v6 = (void *)MEMORY[0x1E0CB35B0];
  v7 = a3;
  objc_msgSend(v6, "defaultCenter");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0D15B78];
  objc_msgSend(MEMORY[0x1E0D15AF8], "microLocationVisitStream");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:object:", v7, a4, v8, v10);

}

+ (void)unregisterForNotificationsWithoutUsingContextStoreForObserver:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x1E0CB35B0];
  v4 = a3;
  objc_msgSend(v3, "defaultCenter");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0D15B78];
  objc_msgSend(MEMORY[0x1E0D15AF8], "microLocationVisitStream");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:name:object:", v4, v5, v7);

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
  ATXMicrolocationVisitDuetEvent *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  ATXMicrolocationVisitDuetEvent *v7;

  v2 = [ATXMicrolocationVisitDuetEvent alloc];
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -20.0);
  v6 = (void *)objc_opt_new();
  v7 = -[ATXMicrolocationVisitDuetEvent initWithDominantMicrolocationUUID:microlocationProbabilities:startDate:endDate:](v2, "initWithDominantMicrolocationUUID:microlocationProbabilities:startDate:endDate:", v3, v4, v5, v6);

  return v7;
}

@end
