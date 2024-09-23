@implementation MTScheduledList

- (id)nextScheduledAlert
{
  return (id)-[NSMutableOrderedSet firstObject](self->_orderedScheduledAlerts, "firstObject");
}

- (MTScheduledList)init
{
  return -[MTScheduledList initWithDelegate:](self, "initWithDelegate:", 0);
}

- (MTScheduledList)initWithDelegate:(id)a3
{
  id v4;
  MTScheduledList *v5;
  MTScheduledList *v6;
  uint64_t v7;
  NSMutableOrderedSet *orderedScheduledAlerts;
  uint64_t v9;
  NSMutableOrderedSet *orderedScheduledNotifications;
  uint64_t v11;
  NSMutableOrderedSet *orderedScheduledEvents;
  uint64_t v13;
  NSMutableDictionary *scheduledAlertMap;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MTScheduledList;
  v5 = -[MTScheduledList init](&v16, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = objc_opt_new();
    orderedScheduledAlerts = v6->_orderedScheduledAlerts;
    v6->_orderedScheduledAlerts = (NSMutableOrderedSet *)v7;

    v9 = objc_opt_new();
    orderedScheduledNotifications = v6->_orderedScheduledNotifications;
    v6->_orderedScheduledNotifications = (NSMutableOrderedSet *)v9;

    v11 = objc_opt_new();
    orderedScheduledEvents = v6->_orderedScheduledEvents;
    v6->_orderedScheduledEvents = (NSMutableOrderedSet *)v11;

    v13 = objc_opt_new();
    scheduledAlertMap = v6->_scheduledAlertMap;
    v6->_scheduledAlertMap = (NSMutableDictionary *)v13;

  }
  return v6;
}

- (unint64_t)numberOfScheduledAlerts
{
  return -[NSMutableOrderedSet count](self->_orderedScheduledAlerts, "count");
}

- (unint64_t)numberOfScheduledAlertsAndNotifications
{
  uint64_t v3;

  v3 = -[NSMutableOrderedSet count](self->_orderedScheduledAlerts, "count");
  return -[NSMutableOrderedSet count](self->_orderedScheduledNotifications, "count") + v3;
}

- (NSArray)scheduledAlerts
{
  return (NSArray *)-[NSMutableOrderedSet array](self->_orderedScheduledAlerts, "array");
}

+ (void)_sort:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MTScheduledList.m"), 54, CFSTR("Not a mutable ordered collection"));

  }
  objc_msgSend((id)objc_opt_class(), "_scheduledObjectComparator");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortUsingComparator:", v7);

}

+ (void)_sortAndFilter:(id)a3
{
  objc_msgSend(a1, "_sortAndFilter:objectsToScheduleAhead:", a3, 0);
}

+ (void)_sortAndFilter:(id)a3 objectsToScheduleAhead:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  int v23;
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;

  v25 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MTScheduledList.m"), 64, CFSTR("Not a mutable ordered collection"));

  }
  objc_msgSend((id)objc_opt_class(), "_scheduledObjectComparator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "sortUsingComparator:", v8);

  v9 = (void *)objc_opt_new();
  v10 = (void *)objc_opt_new();
  v11 = (void *)objc_opt_new();
  v12 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __57__MTScheduledList__sortAndFilter_objectsToScheduleAhead___block_invoke;
  v32[3] = &unk_1E39CB6F8;
  v13 = v10;
  v33 = v13;
  v14 = v11;
  v34 = v14;
  v15 = v9;
  v35 = v15;
  objc_msgSend(v25, "enumerateObjectsUsingBlock:", v32);
  if (objc_msgSend(v13, "count"))
  {
    objc_msgSend(v13, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0C99D48], "mtGregorianCalendar");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v12;
    v26[1] = 3221225472;
    v26[2] = __57__MTScheduledList__sortAndFilter_objectsToScheduleAhead___block_invoke_2;
    v26[3] = &unk_1E39CB720;
    v19 = v16;
    v27 = v19;
    v28 = v18;
    v20 = v17;
    v29 = v20;
    v30 = v7;
    v31 = a1;
    v21 = v18;
    objc_msgSend(v15, "enumerateObjectsUsingBlock:", v26);
    objc_msgSend(v19, "trigger");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isPastOverrideEvent");

    if (v23)
      objc_msgSend(v20, "addObject:", v19);
    if (objc_msgSend(v20, "count"))
      objc_msgSend(v25, "removeObjectsInArray:", v20);
    if (objc_msgSend(v14, "count"))
      objc_msgSend(v25, "removeObjectsInArray:", v14);

  }
}

void __57__MTScheduledList__sortAndFilter_objectsToScheduleAhead___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  char v13;
  void *v14;
  id v15;

  v15 = a2;
  objc_msgSend(v15, "trigger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "triggerType");
  v6 = v15;
  if (v5 != 4)
  {
    objc_msgSend(v15, "trigger");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "triggerType") != 5)
    {

LABEL_14:
      v9 = v15;
      goto LABEL_15;
    }
    v6 = v15;
  }
  objc_msgSend(v6, "scheduleable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isSleepItem");

  if (v5 == 4)
  {

    v9 = v15;
    if (!v8)
      goto LABEL_15;
  }
  else
  {

    v9 = v15;
    if ((v8 & 1) == 0)
      goto LABEL_15;
  }
  objc_msgSend(v9, "scheduleable");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isSingleTime");

  if (!v11)
  {
    v14 = *(void **)(a1 + 48);
    goto LABEL_13;
  }
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v15);
  objc_msgSend(v15, "scheduleable");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isItemEnabled");

  v9 = v15;
  if ((v13 & 1) == 0)
  {
    v14 = *(void **)(a1 + 40);
LABEL_13:
    objc_msgSend(v14, "addObject:", v15);
    goto LABEL_14;
  }
LABEL_15:

}

void __57__MTScheduledList__sortAndFilter_objectsToScheduleAhead___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "scheduleable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "overridesScheduledObject:calendar:", v3, *(_QWORD *)(a1 + 40));

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v3);
    objc_msgSend(v3, "scheduleable");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "trigger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "triggerDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "upcomingTriggersAfterDate:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    if (-[NSObject count](v9, "count"))
    {
      v10 = *(void **)(a1 + 56);
      objc_msgSend(v3, "scheduleable");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject firstObject](v9, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[MTScheduledObject scheduledObjectForScheduleable:trigger:](MTScheduledObject, "scheduledObjectForScheduleable:trigger:", v11, v12);
      v13 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v13);

      objc_msgSend(v3, "scheduleable");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v13) = objc_opt_respondsToSelector();

      if ((v13 & 1) != 0)
      {
        v15 = *(void **)(a1 + 40);
        objc_msgSend(v3, "trigger");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "triggerDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "startOfDayForDate:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 40), "dateByAddingUnit:value:toDate:options:", 16, 1, v18, 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "dateByAddingUnit:value:toDate:options:", 128, -1, v19, 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "scheduleable");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "scheduleOverridenForDate:", v20);

      }
    }
  }
  else
  {
    MTLogForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v22 = *(_QWORD *)(a1 + 64);
      objc_msgSend(*(id *)(a1 + 32), "debugDescription");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "debugDescription");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543874;
      v26 = v22;
      v27 = 2114;
      v28 = v23;
      v29 = 2114;
      v30 = v24;
      _os_log_debug_impl(&dword_19AC4E000, v9, OS_LOG_TYPE_DEBUG, "%{public}@ event %{public}@ failed to override event %{public}@ keeping original wake event schedule", (uint8_t *)&v25, 0x20u);

    }
  }

}

+ (id)_scheduledObjectComparator
{
  return &__block_literal_global_3;
}

uint64_t __45__MTScheduledList__scheduledObjectComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "trigger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "triggerDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trigger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "triggerDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqualToDate:", v9);

  if (v10)
  {
    objc_msgSend(v5, "trigger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "triggerType");
    objc_msgSend(v4, "trigger");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v12 - objc_msgSend(v13, "triggerType");
  }
  else
  {
    objc_msgSend(v4, "trigger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "triggerDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trigger");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "triggerDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "compare:", v16);

  }
  return v14;
}

- (NSArray)scheduledAlertsAndNotifications
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[NSMutableOrderedSet array](self->_orderedScheduledAlerts, "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableOrderedSet array](self->_orderedScheduledNotifications, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v6);

  objc_msgSend((id)objc_opt_class(), "_sortAndFilter:", v5);
  return (NSArray *)v5;
}

- (NSArray)scheduledObjects
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[MTScheduledList scheduledAlertsAndNotifications](self, "scheduledAlertsAndNotifications");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableOrderedSet array](self->_orderedScheduledEvents, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v6);

  objc_msgSend((id)objc_opt_class(), "_sortAndFilter:", v5);
  return (NSArray *)v5;
}

- (id)scheduledObjectsToFireBeforeDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[MTScheduledList scheduledObjects](self, "scheduledObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__MTScheduledList_scheduledObjectsToFireBeforeDate___block_invoke;
  v10[3] = &unk_1E39CB768;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v5, "_filterScheduledObjects:withBlock:", v6, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

BOOL __52__MTScheduledList_scheduledObjectsToFireBeforeDate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  objc_msgSend(a2, "trigger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "triggerDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = v4 && (objc_msgSend(v4, "mtIsBeforeOrSameAsDate:", *(_QWORD *)(a1 + 32)) & 1) != 0;

  return v6;
}

- (id)scheduledObjectsToFireInInterval:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[MTScheduledList scheduledObjects](self, "scheduledObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_dateIntervalFilter:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_filterScheduledObjects:withBlock:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_dateIntervalFilter:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__MTScheduledList__dateIntervalFilter___block_invoke;
  v7[3] = &unk_1E39CB768;
  v8 = v3;
  v4 = v3;
  v5 = (void *)MEMORY[0x19AED0080](v7);

  return v5;
}

BOOL __39__MTScheduledList__dateIntervalFilter___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(a2, "trigger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "triggerDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 && (objc_msgSend(*(id *)(a1 + 32), "containsDate:", v4) & 1) != 0;

  return v5;
}

+ (id)_filterScheduledObjects:(id)a3 withBlock:(id)a4
{
  return (id)objc_msgSend(a3, "na_filter:", a4);
}

- (id)nextScheduledAlertOrNotification
{
  void *v3;
  NSMutableOrderedSet *orderedScheduledAlerts;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_class();
  orderedScheduledAlerts = self->_orderedScheduledAlerts;
  v8[0] = self->_orderedScheduledNotifications;
  v8[1] = orderedScheduledAlerts;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_nextScheduledObjectInSets:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)nextScheduledObject
{
  void *v3;
  NSMutableOrderedSet *orderedScheduledNotifications;
  NSMutableOrderedSet *orderedScheduledAlerts;
  void *v6;
  void *v7;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_class();
  orderedScheduledNotifications = self->_orderedScheduledNotifications;
  orderedScheduledAlerts = self->_orderedScheduledAlerts;
  v9[0] = self->_orderedScheduledEvents;
  v9[1] = orderedScheduledNotifications;
  v9[2] = orderedScheduledAlerts;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_nextScheduledObjectInSets:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_nextScheduledObjectInSets:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = a3;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "firstObject");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (!v5)
          goto LABEL_8;
        objc_msgSend(v8, "trigger");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "triggerDate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "trigger");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "triggerDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v11, "mtIsBeforeDate:", v13);

        if (v14)
        {
LABEL_8:
          v15 = v9;

          v5 = v15;
        }

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)nextScheduledObjectWithTriggerType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  -[MTScheduledList _scheduledListForTriggerType:](self, "_scheduledListForTriggerType:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__MTScheduledList_nextScheduledObjectWithTriggerType___block_invoke;
  v8[3] = &__block_descriptor_40_e27_B16__0__MTScheduledObject_8l;
  v8[4] = a3;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

BOOL __54__MTScheduledList_nextScheduledObjectWithTriggerType___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "trigger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "triggerType") == *(_QWORD *)(a1 + 32);

  return v4;
}

- (id)_scheduledListForTriggerType:(unint64_t)a3
{
  unint64_t v4;
  NSMutableOrderedSet *v5;

  v4 = +[MTScheduledObject scheduledTypeForTriggerType:](MTScheduledObject, "scheduledTypeForTriggerType:", a3);
  if (v4 > 2)
    v5 = 0;
  else
    v5 = (&self->_orderedScheduledAlerts)[v4];
  return v5;
}

- (void)reset
{
  -[NSMutableOrderedSet removeAllObjects](self->_orderedScheduledAlerts, "removeAllObjects");
  -[NSMutableOrderedSet removeAllObjects](self->_orderedScheduledNotifications, "removeAllObjects");
  -[NSMutableOrderedSet removeAllObjects](self->_orderedScheduledEvents, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_scheduledAlertMap, "removeAllObjects");
}

- (void)unschedule:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  MTScheduledList *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __30__MTScheduledList_unschedule___block_invoke;
  v6[3] = &unk_1E39CB7B0;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[MTScheduledList _performScheduleChangingBlock:withCompletion:](self, "_performScheduleChangingBlock:withCompletion:", v6, 0);

}

void __30__MTScheduledList_unschedule___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "_unschedule:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_unschedule:(id)a3
{
  NSMutableDictionary *scheduledAlertMap;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  scheduledAlertMap = self->_scheduledAlertMap;
  objc_msgSend(a3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](scheduledAlertMap, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(v6, "allValues", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        -[MTScheduledList _unscheduleObject:](self, "_unscheduleObject:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)schedule:(id)a3 afterDate:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  MTScheduledList *v14;
  id v15;

  v8 = a3;
  v9 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __53__MTScheduledList_schedule_afterDate_withCompletion___block_invoke;
  v12[3] = &unk_1E39CB828;
  v13 = v8;
  v14 = self;
  v15 = v9;
  v10 = v9;
  v11 = v8;
  -[MTScheduledList _performScheduleChangingBlock:withCompletion:](self, "_performScheduleChangingBlock:withCompletion:", v12, a5);

}

void __53__MTScheduledList_schedule_afterDate_withCompletion___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  _QWORD v12[5];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    v6 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 40), "_unschedule:", v8);
        if (objc_msgSend(v8, "shouldBeScheduled"))
        {
          objc_msgSend(v8, "upcomingTriggersAfterDate:", *(_QWORD *)(a1 + 48));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v12[0] = v6;
          v12[1] = 3221225472;
          v12[2] = __53__MTScheduledList_schedule_afterDate_withCompletion___block_invoke_2;
          v12[3] = &unk_1E39CB7D8;
          v12[4] = v8;
          objc_msgSend(v9, "na_map:", v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11[0] = v6;
          v11[1] = 3221225472;
          v11[2] = __53__MTScheduledList_schedule_afterDate_withCompletion___block_invoke_3;
          v11[3] = &unk_1E39CB800;
          v11[4] = *(_QWORD *)(a1 + 40);
          objc_msgSend(v10, "na_each:", v11);

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }

}

id __53__MTScheduledList_schedule_afterDate_withCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[MTScheduledObject scheduledObjectForScheduleable:trigger:](MTScheduledObject, "scheduledObjectForScheduleable:trigger:", *(_QWORD *)(a1 + 32), a2);
}

uint64_t __53__MTScheduledList_schedule_afterDate_withCompletion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scheduleObject:", a2);
}

- (void)_scheduleObject:(id)a3
{
  void *v4;
  void *v5;
  NSMutableDictionary *scheduledAlertMap;
  void *v7;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  objc_msgSend(v16, "trigger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTScheduledList _scheduledListForTriggerType:](self, "_scheduledListForTriggerType:", objc_msgSend(v4, "triggerType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addObject:", v16);
  scheduledAlertMap = self->_scheduledAlertMap;
  objc_msgSend(v16, "scheduleable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](scheduledAlertMap, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v9 = (void *)objc_opt_new();
    v10 = self->_scheduledAlertMap;
    objc_msgSend(v16, "scheduleable");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v9, v12);

  }
  v13 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v16, "trigger");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v14, "triggerType"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, v15);

}

- (void)_performScheduleChangingBlock:(id)a3 withCompletion:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(void);
  _QWORD v12[5];

  v11 = (void (**)(void))a4;
  v6 = (void (**)(_QWORD))a3;
  -[MTScheduledList nextScheduledAlertOrNotification](self, "nextScheduledAlertOrNotification");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6);

  v8 = (void *)objc_opt_new();
  objc_msgSend((id)objc_opt_class(), "_sortAndFilter:objectsToScheduleAhead:", self->_orderedScheduledAlerts, v8);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __64__MTScheduledList__performScheduleChangingBlock_withCompletion___block_invoke;
  v12[3] = &unk_1E39CB800;
  v12[4] = self;
  objc_msgSend(v8, "na_each:", v12);
  objc_msgSend((id)objc_opt_class(), "_sort:", self->_orderedScheduledNotifications);
  objc_msgSend((id)objc_opt_class(), "_sort:", self->_orderedScheduledEvents);
  -[MTScheduledList nextScheduledAlertOrNotification](self, "nextScheduledAlertOrNotification");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 == v9 || (objc_msgSend(v7, "isEqual:", v9) & 1) != 0)
  {
    if (v11)
      v11[2]();
  }
  else
  {
    -[MTScheduledList delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "scheduledListDidChange:withCompletion:", self, v11);

  }
}

uint64_t __64__MTScheduledList__performScheduleChangingBlock_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scheduleObject:", a2);
}

- (BOOL)isScheduled:(id)a3
{
  id v4;
  NSMutableDictionary *scheduledAlertMap;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;

  v4 = a3;
  scheduledAlertMap = self->_scheduledAlertMap;
  objc_msgSend(v4, "scheduleable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](scheduledAlertMap, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "trigger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "triggerType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v4, "trigger");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "triggerDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "trigger");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "triggerDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_msgSend(v14, "compare:", v16) != -1;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)_unscheduleObject:(id)a3
{
  void *v4;
  void *v5;
  NSMutableDictionary *scheduledAlertMap;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  objc_msgSend(v16, "trigger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTScheduledList _scheduledListForTriggerType:](self, "_scheduledListForTriggerType:", objc_msgSend(v4, "triggerType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "removeObject:", v16);
  scheduledAlertMap = self->_scheduledAlertMap;
  objc_msgSend(v16, "scheduleable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](scheduledAlertMap, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v16, "trigger");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v11, "triggerType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObjectForKey:", v12);

  if (!objc_msgSend(v9, "count"))
  {
    v13 = self->_scheduledAlertMap;
    objc_msgSend(v16, "scheduleable");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v13, "removeObjectForKey:", v15);

  }
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MTScheduledList orderedScheduledAlerts](self, "orderedScheduledAlerts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTScheduledList orderedScheduledNotifications](self, "orderedScheduledNotifications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTScheduledList orderedScheduledEvents](self, "orderedScheduledEvents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Alerts: %@, Notifications: %@, Events: %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (MTScheduledListDelegate)delegate
{
  return (MTScheduledListDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableOrderedSet)orderedScheduledAlerts
{
  return self->_orderedScheduledAlerts;
}

- (void)setOrderedScheduledAlerts:(id)a3
{
  objc_storeStrong((id *)&self->_orderedScheduledAlerts, a3);
}

- (NSMutableOrderedSet)orderedScheduledNotifications
{
  return self->_orderedScheduledNotifications;
}

- (void)setOrderedScheduledNotifications:(id)a3
{
  objc_storeStrong((id *)&self->_orderedScheduledNotifications, a3);
}

- (NSMutableOrderedSet)orderedScheduledEvents
{
  return self->_orderedScheduledEvents;
}

- (void)setOrderedScheduledEvents:(id)a3
{
  objc_storeStrong((id *)&self->_orderedScheduledEvents, a3);
}

- (NSMutableDictionary)scheduledAlertMap
{
  return self->_scheduledAlertMap;
}

- (void)setScheduledAlertMap:(id)a3
{
  objc_storeStrong((id *)&self->_scheduledAlertMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduledAlertMap, 0);
  objc_storeStrong((id *)&self->_orderedScheduledEvents, 0);
  objc_storeStrong((id *)&self->_orderedScheduledNotifications, 0);
  objc_storeStrong((id *)&self->_orderedScheduledAlerts, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
