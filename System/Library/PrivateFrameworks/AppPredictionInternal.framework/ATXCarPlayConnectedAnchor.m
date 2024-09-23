@implementation ATXCarPlayConnectedAnchor

+ (Class)supportedDuetDataProviderClass
{
  return (Class)objc_opt_class();
}

+ (id)duetEventsPredicates
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D15AD0], "predicateForEventsWithIntegerValue:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0D15AD0], "predicateForEventsWithMinimumDuration:", 60.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (int64_t)anchorType
{
  return 5;
}

+ (id)longDescription
{
  return CFSTR("CarPlay device is connected.");
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
  return 1;
}

+ (id)keyPathForContextStore
{
  return (id)objc_msgSend(MEMORY[0x1E0D15C58], "keyPathForCarplayConnectedStatus");
}

+ (id)predicateForContextStoreRegistration
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D15C90];
  objc_msgSend((id)objc_opt_class(), "keyPathForContextStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateForKeyPath:equalToValue:", v3, &unk_1E83CDE88);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)invalidationPredicateForContextStoreRegistration
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D15C90];
  objc_msgSend((id)objc_opt_class(), "keyPathForContextStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateForKeyPath:equalToValue:", v3, &unk_1E83CDEA0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)shouldProcessContextStoreNotification
{
  return objc_msgSend((id)objc_opt_class(), "shouldProcessContextStoreNotificationForNumber");
}

+ (BOOL)isActive
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "supportedDuetDataProviderClass"), "supportedDuetEventClass")), "initWithCurrentContextStoreValues");
  v3 = objc_msgSend(v2, "carPlayState") == 1;

  return v3;
}

+ (id)sampleEvent
{
  ATXCarPlayDuetEvent *v2;
  void *v3;
  void *v4;
  ATXCarPlayDuetEvent *v5;

  v2 = [ATXCarPlayDuetEvent alloc];
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", 20.0);
  v5 = -[ATXCarPlayDuetEvent initWithCarPlayConnectedState:startDate:endDate:](v2, "initWithCarPlayConnectedState:startDate:endDate:", 1, v3, v4);

  return v5;
}

@end
