@implementation ATXUpcomingCommuteToWorkAnchor

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
  return 20;
}

+ (id)longDescription
{
  return CFSTR("The user is preparing to commute to work.");
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

+ (id)invalidationPredicateForContextStoreRegistration
{
  return 0;
}

+ (id)fetchAnchorOccurrencesBetweenStartDate:(id)a3 endDate:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  objc_super v10;

  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___ATXUpcomingCommuteToWorkAnchor;
  objc_msgSendSuper2(&v10, sel_fetchAnchorOccurrencesBetweenStartDate_endDate_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_pas_filteredArrayWithTest:", &__block_literal_global_239);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __81__ATXUpcomingCommuteToWorkAnchor_fetchAnchorOccurrencesBetweenStartDate_endDate___block_invoke_2;
  v9[3] = &__block_descriptor_40_e44___ATXTripDuetEvent_16__0__ATXTripDuetEvent_8l;
  v9[4] = a1;
  objc_msgSend(v6, "_pas_mappedArrayWithTransform:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

BOOL __81__ATXUpcomingCommuteToWorkAnchor_fetchAnchorOccurrencesBetweenStartDate_endDate___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "origin") == 1 && objc_msgSend(v2, "destination") == 2;

  return v3;
}

id __81__ATXUpcomingCommuteToWorkAnchor_fetchAnchorOccurrencesBetweenStartDate_endDate___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend((id)objc_opt_class(), "secondsOfInfluence");
  objc_msgSend(v2, "convertToUpcomingCommuteEventWithWindowDuration:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)anchorOccurenceDateFromDuetEvent:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  double v6;
  double v7;
  void *v8;
  void *v9;

  v3 = (objc_class *)MEMORY[0x1E0C99D68];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend((id)objc_opt_class(), "secondsOfInfluence");
  v7 = -v6;
  objc_msgSend(v4, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v5, "initWithTimeInterval:sinceDate:", v8, v7);
  return v9;
}

+ (id)candidateQueryStartDateFromDuetEvent:(id)a3
{
  return (id)objc_msgSend(a3, "startDate");
}

+ (id)keyPathForContextStore
{
  return (id)objc_msgSend(MEMORY[0x1E0D15C58], "keyPathForPredictedLocationOfInterestTransitions");
}

+ (id)predicateForContextStoreRegistration
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend((id)objc_opt_class(), "keyPathForContextStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D15C90];
  objc_msgSend(MEMORY[0x1E0D15C58], "locationOfInterestTypeKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C58], "transitionWithinTimeIntervalKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C58], "transitionWithinTimeIntervalKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateForKeyPath:withFormat:", v2, CFSTR("SUBQUERY(SELF.%@.value, $prediction, $prediction.%K = %@ AND $prediction.%K <= %@ AND $prediction.%K > %@).@count > 0"), v2, v4, &unk_1E83CE548, v5, &unk_1E83CE560, v6, &unk_1E83CE578);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)shouldProcessContextStoreNotification
{
  return 1;
}

+ (BOOL)isActive
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  BOOL v10;

  v3 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "supportedDuetDataProviderClass"), "supportedDuetEventClass")), "initWithCurrentContextStoreValues");
  v4 = v3;
  v10 = v3
     && (objc_msgSend(v3, "startDate"),
         v5 = (void *)objc_claimAutoreleasedReturnValue(),
         objc_msgSend(v5, "timeIntervalSinceNow"),
         v7 = v6,
         objc_msgSend(a1, "secondsOfInfluence"),
         v9 = v8 + 60.0,
         v5,
         v7 <= v9)
     && objc_msgSend(v4, "origin") == 1
     && objc_msgSend(v4, "destination") == 2;

  return v10;
}

+ (id)sampleEvent
{
  ATXTripDuetEvent *v2;
  void *v3;
  void *v4;
  ATXTripDuetEvent *v5;

  v2 = [ATXTripDuetEvent alloc];
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -20.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -10.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ATXTripDuetEvent initWithOrigin:destination:durationAtOrigin:startDate:endDate:](v2, "initWithOrigin:destination:durationAtOrigin:startDate:endDate:", 1, 2, v3, v4, 0.0);

  return v5;
}

@end
