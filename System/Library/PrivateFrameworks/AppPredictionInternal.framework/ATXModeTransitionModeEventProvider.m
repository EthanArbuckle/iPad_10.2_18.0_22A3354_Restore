@implementation ATXModeTransitionModeEventProvider

- (ATXModeTransitionModeEventProvider)initWithMode:(unint64_t)a3
{
  ATXModeTransitionModeEventProvider *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ATXModeTransitionModeEventProvider;
  result = -[ATXModeTransitionModeEventProvider init](&v5, sel_init);
  if (result)
    result->_mode = a3;
  return result;
}

- (id)biomePublisherWithBookmark:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXModeTransitionModeEventProvider.m"), 35, CFSTR("Must be implemented by sub-classes."));

  return (id)objc_opt_new();
}

- (id)eventsFromPublisher
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;

  v3 = (void *)objc_opt_new();
  -[ATXModeTransitionModeEventProvider biomePublisherWithBookmark:](self, "biomePublisherWithBookmark:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__ATXModeTransitionModeEventProvider_eventsFromPublisher__block_invoke_2;
  v10[3] = &unk_1E82DCD98;
  v10[4] = self;
  v5 = v3;
  v11 = v5;
  v6 = (id)objc_msgSend(v4, "sinkWithCompletion:receiveInput:", &__block_literal_global_48, v10);

  v7 = v11;
  v8 = v5;

  return v8;
}

void __57__ATXModeTransitionModeEventProvider_eventsFromPublisher__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  v5 = v7;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "aggregationEventsFromEvent:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
      objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v6);

    v5 = v7;
  }

}

- (BOOL)publisherIsCoreDuetWrapper
{
  return 0;
}

- (BOOL)isEventFromProvider:(id)a3
{
  id v3;
  void *v4;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "eventBody");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (id)aggregationEventsFromEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[ATXModeTransitionModeEventProvider isEventFromProvider:](self, "isEventFromProvider:", v4))
  {
    objc_msgSend(v4, "eventBody");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)dateIntervalFromEvent:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (-[ATXModeTransitionModeEventProvider isEventFromProvider:](self, "isEventFromProvider:", v4))
  {
    objc_msgSend(v4, "eventBody");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc(MEMORY[0x1E0CB3588]);
    objc_msgSend(v5, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v6, "initWithStartDate:endDate:", v7, v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSString)description
{
  return (NSString *)ATXModeToString();
}

- (id)bmStoreEventsForLast61DaysWithStartDateToday:(id)a3 endDateToday:(id)a4 includeWeekends:(BOOL)a5 includeHolidays:(BOOL)a6
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  ATXModeEvent *v15;
  id v16;
  void *v17;
  ATXModeTransitionModeEventProvider *v20;
  id v21;

  v20 = self;
  v9 = a3;
  v10 = a4;
  v21 = (id)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -61;
  do
  {
    objc_msgSend(v11, "dateByAddingUnit:value:toDate:options:", 16, v12 + 1, v9, 0, v20);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dateByAddingUnit:value:toDate:options:", 16, v12 + 1, v10, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((a5 || (objc_msgSend(v11, "isDateInWeekend:", v13) & 1) == 0)
      && (a6
       || !-[ATXModeTransitionModeEventProvider eventIsDuringThanksgivingShutdown:](v20, "eventIsDuringThanksgivingShutdown:", v13)))
    {
      v15 = -[ATXModeEvent initWithStartDate:endDate:]([ATXModeEvent alloc], "initWithStartDate:endDate:", v13, v14);
      v16 = objc_alloc(MEMORY[0x1E0D024C8]);
      objc_msgSend(v13, "timeIntervalSinceReferenceDate");
      v17 = (void *)objc_msgSend(v16, "initWithEventBody:timestamp:", v15);
      objc_msgSend(v21, "addObject:", v17);

    }
  }
  while (!__CFADD__(v12++, 1));

  return v21;
}

- (BOOL)eventIsDuringThanksgivingShutdown:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v3 = (void *)MEMORY[0x1E0C99D48];
  v4 = a3;
  objc_msgSend(v3, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setDay:", 21);
  objc_msgSend(v6, "setMonth:", 11);
  objc_msgSend(v6, "setYear:", 2020);
  objc_msgSend(v5, "dateFromComponents:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDay:", 29);
  objc_msgSend(v6, "setMonth:", 11);
  objc_msgSend(v6, "setYear:", 2020);
  objc_msgSend(v5, "dateFromComponents:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v7, v8);
  v10 = objc_msgSend(v9, "containsDate:", v4);

  return v10;
}

- (unint64_t)mode
{
  return self->_mode;
}

@end
