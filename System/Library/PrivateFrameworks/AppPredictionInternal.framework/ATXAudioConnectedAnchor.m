@implementation ATXAudioConnectedAnchor

+ (Class)supportedDuetDataProviderClass
{
  return (Class)objc_opt_class();
}

+ (id)duetEventsPredicates
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D15AD0], "predicateForEventsWithIntegerValue:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D15AD0];
  objc_msgSend(MEMORY[0x1E0D159A8], "portType", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateForObjectsWithMetadataKey:andValue:", v4, CFSTR("Headphones"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0D15AD0], "predicateForEventsWithMinimumDuration:", 60.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (int64_t)anchorType
{
  return 16;
}

+ (id)longDescription
{
  return CFSTR("Wired audio device is connected.");
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
  return (id)objc_msgSend(MEMORY[0x1E0D15C58], "keyPathForAudioOutputDataDictionary");
}

+ (id)predicateForContextStoreRegistration
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D15C58], "predicateForAudioOutputStatus:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D15C90];
  objc_msgSend((id)objc_opt_class(), "keyPathForContextStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "keyPathForContextStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C58], "audioPortTypeKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateForKeyPath:withFormat:", v4, CFSTR("SELF.%@.value.%K = %@"), v5, v6, CFSTR("Headphones"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0D15C90];
  v12[0] = v2;
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "andPredicateWithSubpredicates:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)invalidationPredicateForContextStoreRegistration
{
  return (id)objc_msgSend(MEMORY[0x1E0D15C58], "predicateForAudioOutputStatus:", 0);
}

+ (BOOL)shouldProcessContextStoreNotification
{
  return objc_msgSend((id)objc_opt_class(), "shouldProcessContextStoreNotificationForDict");
}

+ (BOOL)isActive
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "supportedDuetDataProviderClass"), "supportedDuetEventClass")), "initWithCurrentContextStoreValues");
  v3 = objc_msgSend(v2, "audioState") == 1;

  return v3;
}

+ (id)sampleEvent
{
  ATXAudioDuetEvent *v2;
  void *v3;
  void *v4;
  ATXAudioDuetEvent *v5;

  v2 = [ATXAudioDuetEvent alloc];
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", 20.0);
  v5 = -[ATXAudioDuetEvent initWithAudioState:deviceIdentifier:portType:portName:routeChangeReason:startDate:endDate:](v2, "initWithAudioState:deviceIdentifier:portType:portName:routeChangeReason:startDate:endDate:", 1, CFSTR("Headphones"), CFSTR("Headphones"), CFSTR("Headphones"), &unk_1E83CC028, v3, v4);

  return v5;
}

@end
