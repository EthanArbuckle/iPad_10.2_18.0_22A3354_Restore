@implementation ATXAnchor

+ (Class)supportedDuetDataProviderClass
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ATXAnchor.m"), 29, CFSTR("Should be implemented by subclasses"));

  return 0;
}

+ (NSArray)duetEventsPredicates
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ATXAnchor.m"), 35, CFSTR("Should be implemented by subclasses"));

  return 0;
}

+ (int64_t)anchorType
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ATXAnchor.m"), 41, CFSTR("Should be implemented by subclasses"));

  return 0;
}

+ (NSString)longDescription
{
  return (NSString *)CFSTR("No description available.");
}

+ (double)secondsOfInfluence
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ATXAnchor.m"), 52, CFSTR("Should be implemented by subclasses"));

  return 0.0;
}

+ (BOOL)shouldPredicateOnStartDate
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ATXAnchor.m"), 58, CFSTR("Should be implemented by subclasses"));

  return 1;
}

- (id)anchorTypeString
{
  void *v2;

  v2 = (void *)objc_opt_class();
  return (id)objc_msgSend(v2, "anchorTypeToString:", objc_msgSend((id)objc_opt_class(), "anchorType"));
}

+ (id)anchorOccurenceDateFromDuetEvent:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend((id)objc_opt_class(), "shouldPredicateOnStartDate"))
    objc_msgSend(v3, "startDate");
  else
    objc_msgSend(v3, "endDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)candidateQueryStartDateFromDuetEvent:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "anchorOccurenceDateFromDuetEvent:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (double)durationOfAnchorEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v4 = a3;
  if (objc_msgSend((id)objc_opt_class(), "shouldPredicateOnStartDate"))
  {
    objc_msgSend(v4, "endDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceDate:", v6);
    v8 = v7;

    objc_msgSend(a1, "secondsOfInfluence");
    v10 = v9;
    if (v8 >= 1.0 && v8 < v9)
      v10 = v8;
  }
  else
  {
    objc_msgSend(a1, "secondsOfInfluence");
    v10 = v11;
  }

  return v10;
}

+ (BOOL)usesContextStoreForRealTimeNotifications
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ATXAnchor.m"), 101, CFSTR("Should be implemented by subclasses"));

  return 0;
}

+ (void)registerWithContextStoreForAnchorEntranceWithCallback:(id)a3 notificationId:(id)a4 registrationPersistenceContext:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  if ((objc_msgSend((id)objc_opt_class(), "usesContextStoreForRealTimeNotifications") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ATXAnchor.m"), 110, CFSTR("Anchor %@ doesn't use ContextStore but received request to register with context store."), v14);

  }
  v15 = (void *)MEMORY[0x1E0D15C70];
  objc_msgSend((id)objc_opt_class(), "predicateForContextStoreRegistration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localWakingRegistrationWithIdentifier:contextualPredicate:clientIdentifier:callback:", v10, v16, CFSTR("com.apple.duetexpertd.cdidentifier"), v11);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "registerCallback:", v17);
}

+ (void)registerWithContextStoreForAnchorExitWithCallback:(id)a3 notificationId:(id)a4 registrationPersistenceContext:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  if ((objc_msgSend((id)objc_opt_class(), "usesContextStoreForRealTimeNotifications") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ATXAnchor.m"), 125, CFSTR("Anchor %@ doesn't use ContextStore but received request to register with context store."), v14);

  }
  v15 = (void *)MEMORY[0x1E0D15C70];
  objc_msgSend((id)objc_opt_class(), "invalidationPredicateForContextStoreRegistration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localWakingRegistrationWithIdentifier:contextualPredicate:clientIdentifier:callback:", v10, v16, CFSTR("com.apple.duetexpertd.cdidentifier"), v11);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "registerCallback:", v17);
}

+ (void)registerForNotificationsWithoutUsingContextStoreForObserver:(id)a3 enterSelector:(SEL)a4 exitSelector:(SEL)a5
{
  id v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ATXAnchor.m"), 139, CFSTR("Should be implemented by subclasses"));

}

+ (void)unregisterForNotificationsWithoutUsingContextStoreForObserver:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ATXAnchor.m"), 145, CFSTR("Should be implemented by subclasses"));

}

+ (id)keyPathForContextStore
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ATXAnchor.m"), 151, CFSTR("Should be implemented by subclasses"));

  return 0;
}

+ (id)predicateForContextStoreRegistration
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ATXAnchor.m"), 157, CFSTR("Should be implemented by subclasses"));

  return 0;
}

+ (id)invalidationPredicateForContextStoreRegistration
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ATXAnchor.m"), 163, CFSTR("Should be implemented by subclasses"));

  return 0;
}

+ (BOOL)shouldProcessContextStoreNotification
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ATXAnchor.m"), 169, CFSTR("Should be implemented by subclasses"));

  return 0;
}

+ (BOOL)isActive
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ATXAnchor.m"), 175, CFSTR("Should be implemented by subclasses"));

  return 0;
}

+ (id)sampleEvent
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ATXAnchor.m"), 181, CFSTR("Should be implemented by subclasses"));

  return 0;
}

+ (BOOL)shouldProcessContextStoreNotificationForDict
{
  void *v2;
  void *v3;
  void *v4;
  char isKindOfClass;

  objc_msgSend(MEMORY[0x1E0D15C40], "userContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "keyPathForContextStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (BOOL)shouldProcessContextStoreNotificationForNumber
{
  void *v2;
  void *v3;
  void *v4;
  char isKindOfClass;

  objc_msgSend(MEMORY[0x1E0D15C40], "userContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "keyPathForContextStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (id)fetchAnchorOccurrencesBetweenStartDate:(id)a3 endDate:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;

  v6 = a3;
  v7 = (objc_class *)MEMORY[0x1E0C99DE8];
  v8 = a4;
  v9 = [v7 alloc];
  objc_msgSend((id)objc_opt_class(), "duetEventsPredicates");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithArray:", v10);

  objc_msgSend((id)objc_opt_class(), "supportedDuetDataProviderClass");
  v12 = (void *)objc_opt_new();
  v13 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v12, "fetchEventsBetweenStartDate:andEndDate:withPredicates:", v6, v8, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(a1, "shouldPredicateOnStartDate") & 1) != 0)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __60__ATXAnchor_fetchAnchorOccurrencesBetweenStartDate_endDate___block_invoke;
    v17[3] = &unk_1E82E9978;
    v18 = v6;
    objc_msgSend(v14, "_pas_filteredArrayWithTest:", v17);
    v15 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = v14;
  }

  return v15;
}

BOOL __60__ATXAnchor_fetchAnchorOccurrencesBetweenStartDate_endDate___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "earlierDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v5 != v6;
}

+ (int)pbAnchorEventTypeFromDuetEvent:(id)a3
{
  id v3;
  unint64_t v4;
  int v5;

  v3 = a3;
  if ((unint64_t)(objc_msgSend((id)objc_opt_class(), "anchorType") - 1) > 1
    || (v4 = objc_msgSend(v3, "deviceType"), v4 > 4))
  {
    v5 = 0;
  }
  else
  {
    v5 = dword_1C9E80D08[v4];
  }

  return v5;
}

+ (id)anchorTypeToString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x15)
    return CFSTR("UnknownAnchor");
  else
    return off_1E82E9998[a3 - 1];
}

+ (int64_t)stringToAnchorType:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BluetoothConnectedAnchor")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BluetoothDisconnectedAnchor")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IdleTimeBeginAnchor")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IdleTimeEndAnchor")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CarPlayConnectedAnchor")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CarPlayDisconnectedAnchor")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOIEntranceAnchor")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOIExitAnchor")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WorkoutStartAnchor")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WorkoutEndAnchor")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HeadingHomeAnchor")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HeadingToWorkAnchor")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FirstCalendarEventOfDayAnchor")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LastCalendarEventOfDayAnchor")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UpcomingSemanticEventAnchor")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WiredAudioDeviceConnectedAnchor")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WiredAudioDeviceDisconnectedAnchor")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ChargerConnectedAnchor")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MicrolocationVisitAnchor")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UpcomingCommuteToWorkAnchor")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UpcomingCommuteFromWorkAnchor")) & 1) != 0)
  {
    v4 = 21;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("GymArrivalAnchor")))
  {
    v4 = 22;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)anchorTypeStringToClassName:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a3;
  v4 = (void *)objc_opt_class();
  v5 = objc_msgSend((id)objc_opt_class(), "stringToAnchorType:", v3);

  return (id)objc_msgSend(v4, "anchorTypeToAnchorClassName:", v5);
}

+ (Class)anchorClassFromAnchorTypeString:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  void *v21;
  char v22;
  void *v23;
  char v24;
  void *v25;
  char v26;
  void *v27;
  char v28;
  void *v29;
  char v30;
  void *v31;
  char v32;
  void *v33;
  int v34;
  void *v35;

  v4 = a3;
  objc_msgSend(a1, "anchorTypeToString:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v6 & 1) != 0)
    goto LABEL_16;
  objc_msgSend(a1, "anchorTypeToString:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "isEqualToString:", v7);

  if ((v8 & 1) != 0)
    goto LABEL_16;
  objc_msgSend(a1, "anchorTypeToString:", 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "isEqualToString:", v9);

  if ((v10 & 1) != 0)
    goto LABEL_16;
  objc_msgSend(a1, "anchorTypeToString:", 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v4, "isEqualToString:", v11);

  if ((v12 & 1) != 0)
    goto LABEL_16;
  objc_msgSend(a1, "anchorTypeToString:", 6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v4, "isEqualToString:", v13);

  if ((v14 & 1) != 0)
    goto LABEL_16;
  objc_msgSend(a1, "anchorTypeToString:", 16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v4, "isEqualToString:", v15);

  if ((v16 & 1) != 0)
    goto LABEL_16;
  objc_msgSend(a1, "anchorTypeToString:", 17);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v4, "isEqualToString:", v17);

  if ((v18 & 1) != 0)
    goto LABEL_16;
  objc_msgSend(a1, "anchorTypeToString:", 19);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v4, "isEqualToString:", v19);

  if ((v20 & 1) != 0)
    goto LABEL_16;
  objc_msgSend(a1, "anchorTypeToString:", 18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v4, "isEqualToString:", v21);

  if ((v22 & 1) != 0)
    goto LABEL_16;
  objc_msgSend(a1, "anchorTypeToString:", 7);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v4, "isEqualToString:", v23);

  if ((v24 & 1) != 0)
    goto LABEL_16;
  objc_msgSend(a1, "anchorTypeToString:", 8);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v4, "isEqualToString:", v25);

  if ((v26 & 1) != 0)
    goto LABEL_16;
  objc_msgSend(a1, "anchorTypeToString:", 3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v4, "isEqualToString:", v27);

  if ((v28 & 1) != 0)
    goto LABEL_16;
  objc_msgSend(a1, "anchorTypeToString:", 20);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v4, "isEqualToString:", v29);

  if ((v30 & 1) != 0)
    goto LABEL_16;
  objc_msgSend(a1, "anchorTypeToString:", 21);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v4, "isEqualToString:", v31);

  if ((v32 & 1) != 0
    || (objc_msgSend(a1, "anchorTypeToString:", 22),
        v33 = (void *)objc_claimAutoreleasedReturnValue(),
        v34 = objc_msgSend(v4, "isEqualToString:", v33),
        v33,
        v34))
  {
LABEL_16:
    objc_opt_class();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v35 = 0;
  }

  return (Class)v35;
}

+ (id)anchorTypeToAnchorClassName:(int64_t)a3
{
  void *v3;
  objc_class *v4;

  if ((unint64_t)(a3 - 1) <= 0x15 && ((0x3F80FFu >> (a3 - 1)) & 1) != 0)
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

+ (id)allAnchorClasses
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;

  v20 = (void *)MEMORY[0x1CAA48B6C](a1, a2);
  v19 = objc_alloc(MEMORY[0x1E0C99E60]);
  v18 = objc_opt_class();
  v17 = objc_opt_class();
  v16 = objc_opt_class();
  v15 = objc_opt_class();
  v14 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = (void *)objc_msgSend(v19, "initWithObjects:", v18, v17, v16, v15, v14, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v20);
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  ATXAnchor *v4;
  ATXAnchor *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;

  v4 = (ATXAnchor *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = objc_msgSend((id)objc_opt_class(), "anchorType");
      v7 = (void *)objc_opt_class();

      v8 = v6 == objc_msgSend(v7, "anchorType");
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[ATXAnchor anchorEventIdentifier](self, "anchorEventIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAnchorEventIdentifier:", v5);

  return v4;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!a3)
  {
    objc_msgSend(v12, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v14 = 1;
      goto LABEL_7;
    }
    if ((objc_msgSend(v12, "containsValueForKey:", v11) & 1) == 0)
    {
      v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v21 = *MEMORY[0x1E0CB2D50];
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode key %@"), v11, v21);
      v22[0] = v17;
      v14 = 1;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v16, "initWithDomain:code:userInfo:", v13, a7, v18);

      objc_msgSend(v12, "failWithError:", v19);
      goto LABEL_7;
    }
  }
  v14 = 0;
LABEL_7:

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ATXAnchor anchorEventIdentifier](self, "anchorEventIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("codingKeyForAnchorEventId"));

}

- (ATXAnchor)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  ATXAnchor *v7;
  ATXAnchor *v8;
  ATXAnchor *v9;
  objc_super v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("codingKeyForAnchorEventId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ATXAnchor checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:", v5, CFSTR("codingKeyForAnchorEventId"), v4, CFSTR("com.apple.proactive.ATXAnchor"), -1);

  if (v6)
  {
    v7 = 0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)ATXAnchor;
    v8 = -[ATXAnchor init](&v11, sel_init);
    v9 = v8;
    if (v8)
      -[ATXAnchor setAnchorEventIdentifier:](v8, "setAnchorEventIdentifier:", v5);
    self = v9;
    v7 = self;
  }

  return v7;
}

- (NSString)anchorEventIdentifier
{
  return self->_anchorEventIdentifier;
}

- (void)setAnchorEventIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_anchorEventIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchorEventIdentifier, 0);
}

@end
