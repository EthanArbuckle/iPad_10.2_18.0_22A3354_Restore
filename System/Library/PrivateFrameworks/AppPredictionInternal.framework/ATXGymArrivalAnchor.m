@implementation ATXGymArrivalAnchor

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
  return 22;
}

+ (id)longDescription
{
  return CFSTR("The user has arrived at the gym.");
}

+ (double)secondsOfInfluence
{
  return 1800.0;
}

+ (BOOL)shouldPredicateOnStartDate
{
  return 1;
}

+ (BOOL)usesContextStoreForRealTimeNotifications
{
  return 0;
}

+ (id)invalidationPredicateForContextStoreRegistration
{
  return 0;
}

+ (id)fetchAnchorOccurrencesBetweenStartDate:(id)a3 endDate:(id)a4
{
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___ATXGymArrivalAnchor;
  objc_msgSendSuper2(&v7, sel_fetchAnchorOccurrencesBetweenStartDate_endDate_, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_pas_filteredArrayWithTest:", &__block_literal_global_235);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __70__ATXGymArrivalAnchor_fetchAnchorOccurrencesBetweenStartDate_endDate___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;

  v2 = a2;
  objc_msgSend(v2, "possibleCategoryNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    objc_msgSend(v2, "possibleCategoryNames");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("gym")) & 1) != 0
      || objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D26860]))
    {
      objc_msgSend(v2, "endDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "startDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "timeIntervalSinceDate:", v8);
      v4 = v9 < 600.0;

    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

+ (BOOL)shouldProcessContextStoreNotification
{
  return 0;
}

+ (BOOL)isActive
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v2 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "supportedDuetDataProviderClass"), "supportedDuetEventClass")), "initWithCurrentContextStoreValues");
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "possibleCategoryNames");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5)
    {
      objc_msgSend(v3, "possibleCategoryNames");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("gym")) & 1) != 0)
        LOBYTE(v5) = 1;
      else
        LOBYTE(v5) = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D26860]);

    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

+ (id)sampleEvent
{
  ATXPOICategoryVisitDuetEvent *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  ATXPOICategoryVisitDuetEvent *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v2 = [ATXPOICategoryVisitDuetEvent alloc];
  v3 = objc_alloc(MEMORY[0x1E0C99E40]);
  v10[0] = CFSTR("gym");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithArray:", v4);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -20.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -10.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ATXPOICategoryVisitDuetEvent initWithPossibleCategoryNames:startDate:endDate:](v2, "initWithPossibleCategoryNames:startDate:endDate:", v5, v6, v7);

  return v8;
}

+ (void)registerForNotificationsWithoutUsingContextStoreForObserver:(id)a3 enterSelector:(SEL)a4 exitSelector:(SEL)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  +[ATXPOICategoryVisitDuetDataProvider sharedInstance](ATXPOICategoryVisitDuetDataProvider, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0D26860];
  v11[0] = CFSTR("gym");
  v11[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subscribeToPOIChangesForCategory:observer:enterSelector:exitSelector:", v10, v7, a4, a5);

}

+ (void)unregisterForNotificationsWithoutUsingContextStoreForObserver:(id)a3
{
  id v3;

  +[ATXPOICategoryVisitDuetDataProvider sharedInstance](ATXPOICategoryVisitDuetDataProvider, "sharedInstance", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unsubscribeToPOIChanges");

}

@end
