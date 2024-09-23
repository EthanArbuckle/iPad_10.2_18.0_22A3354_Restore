@implementation GDFutureLifeEventContext

- (id)context
{
  return self->gdSwiftContext;
}

- (GDFutureLifeEventContext)initWithGDSwiftContext:(id)a3
{
  id v5;
  GDFutureLifeEventContext *v6;
  GDFutureLifeEventContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GDFutureLifeEventContext;
  v6 = -[GDFutureLifeEventContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->gdSwiftContext, a3);

  return v7;
}

- (id)initAndReturnError:(id *)a3
{
  _TtC20IntelligencePlatform30_GDSwiftFutureLifeEventContext *v5;
  const char *v6;
  const char *v7;
  void *v8;
  GDFutureLifeEventContext *v9;

  v5 = [_TtC20IntelligencePlatform30_GDSwiftFutureLifeEventContext alloc];
  v8 = (void *)objc_msgSend_initAndReturnError_(v5, v6, (uint64_t)a3);
  if (v8)
  {
    self = (GDFutureLifeEventContext *)(id)objc_msgSend_initWithGDSwiftContext_(self, v7, (uint64_t)v8);
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)earliestFutureActivityEventAndReturnError:(id *)a3
{
  return (id)MEMORY[0x1E0DE7D20](self->gdSwiftContext, sel_earliestFutureActivityEventAndReturnError_, a3);
}

- (id)latestFutureActivityEventAndReturnError:(id *)a3
{
  return (id)MEMORY[0x1E0DE7D20](self->gdSwiftContext, sel_latestFutureActivityEventAndReturnError_, a3);
}

- (BOOL)enumerateFutureActivityEventsInAscendingOrder:(BOOL)a3 error:(id *)a4 usingBlock:(id)a5
{
  return MEMORY[0x1E0DE7D20](self->gdSwiftContext, sel_enumerateFutureActivityEventsWithAscending_error_block_, a3);
}

- (id)entryForEarliestFutureActivityEventAndReturnError:(id *)a3
{
  return (id)MEMORY[0x1E0DE7D20](self->gdSwiftContext, sel_earliestEntryForFutureActivityEventAndReturnError_, a3);
}

- (id)entryForLatestFutureActivityEventAndReturnError:(id *)a3
{
  return (id)MEMORY[0x1E0DE7D20](self->gdSwiftContext, sel_latestEntryForFutureActivityEventAndReturnError_, a3);
}

- (BOOL)enumerateEntriesForFutureActivityEventsInAscendingOrder:(BOOL)a3 error:(id *)a4 usingBlock:(id)a5
{
  return MEMORY[0x1E0DE7D20](self->gdSwiftContext, sel_enumerateEntriesForFutureActivityEventsWithAscending_error_block_, a3);
}

- (id)extremeFutureActivityEventWithEntityIdentifierType:(Class)a3 ascending:(BOOL)a4 outStartDate:(id *)a5 outEndDate:(id *)a6 error:(id *)a7
{
  const char *v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v14[7];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_1AE8EDA84;
  v25 = sub_1AE8EDA94;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_1AE8EDA84;
  v19 = sub_1AE8EDA94;
  v20 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1AE8EDA9C;
  v14[3] = &unk_1E5DD9450;
  v14[5] = &v15;
  v14[6] = a3;
  v14[4] = &v21;
  if (objc_msgSend_enumerateEntriesForFutureActivityEventsInAscendingOrder_error_usingBlock_(self, a2, a4, a7, v14)&& v22[5]&& (v11 = (void *)v16[5]) != 0)
  {
    if (a5)
    {
      objc_msgSend_startDate(v11, v9, v10);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (a6)
    {
      objc_msgSend_endDate((void *)v16[5], v9, v10);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = (id)v22[5];
  }
  else
  {
    v12 = 0;
  }
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v12;
}

- (id)earliestFutureActivityEventWithEntityIdentifierType:(Class)a3 outStartDate:(id *)a4 outEndDate:(id *)a5 error:(id *)a6
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_extremeFutureActivityEventWithEntityIdentifierType_ascending_outStartDate_outEndDate_error_, a3);
}

- (id)latestFutureActivityEventWithEntityIdentifierType:(Class)a3 outStartDate:(id *)a4 outEndDate:(id *)a5 error:(id *)a6
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_extremeFutureActivityEventWithEntityIdentifierType_ascending_outStartDate_outEndDate_error_, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->gdSwiftContext, 0);
}

+ (id)subscribeToUpdateNotificationWithSystemwideUniqueSubscriptionIdentifier:(id)a3 targetQueue:(id)a4 onReceiveUpdateNotificationBlock:(id)a5
{
  id v7;
  id v8;
  id v9;
  GDFutureLifeEventUpdateNotificationSubscription *v10;
  const char *v11;
  void *updated;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = [GDFutureLifeEventUpdateNotificationSubscription alloc];
  updated = (void *)objc_msgSend_initWithSystemwideUniqueSubscriptionIdentifier_targetQueue_onReceiveUpdateNotificationBlock_(v10, v11, (uint64_t)v9, v8, v7);

  return updated;
}

@end
