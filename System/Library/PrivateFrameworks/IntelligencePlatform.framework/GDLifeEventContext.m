@implementation GDLifeEventContext

- (id)context
{
  return self->gdSwiftContext;
}

- (GDLifeEventContext)initWithGDSwiftContext:(id)a3
{
  id v5;
  GDLifeEventContext *v6;
  GDLifeEventContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GDLifeEventContext;
  v6 = -[GDLifeEventContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->gdSwiftContext, a3);

  return v7;
}

- (id)initAndReturnError:(id *)a3
{
  _TtC20IntelligencePlatform24_GDSwiftLifeEventContext *v5;
  const char *v6;
  const char *v7;
  void *v8;
  GDLifeEventContext *v9;

  v5 = [_TtC20IntelligencePlatform24_GDSwiftLifeEventContext alloc];
  v8 = (void *)objc_msgSend_initAndReturnError_(v5, v6, (uint64_t)a3);
  if (v8)
  {
    self = (GDLifeEventContext *)(id)objc_msgSend_initWithGDSwiftContext_(self, v7, (uint64_t)v8);
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)earliestActivityEventAndReturnError:(id *)a3
{
  return (id)MEMORY[0x1E0DE7D20](self->gdSwiftContext, sel_earliestActivityEventAndReturnError_, a3);
}

- (id)latestActivityEventAndReturnError:(id *)a3
{
  return (id)MEMORY[0x1E0DE7D20](self->gdSwiftContext, sel_latestActivityEventAndReturnError_, a3);
}

- (BOOL)enumerateActivityEventsThatOverlapWithDateInterval:(id)a3 ascending:(BOOL)a4 error:(id *)a5 usingBlock:(id)a6
{
  return MEMORY[0x1E0DE7D20](self->gdSwiftContext, sel_enumerateActivityEventsThatOverlapWith_ascending_error_block_, a3);
}

- (BOOL)enumerateActivityEventsWhoseStartDatesAreInDateInterval:(id)a3 ascending:(BOOL)a4 error:(id *)a5 usingBlock:(id)a6
{
  return MEMORY[0x1E0DE7D20](self->gdSwiftContext, sel_enumerateActivityEventsWhoseStartDatesAreIn_ascending_error_block_, a3);
}

- (BOOL)enumerateActivityEventsWhoseEndDatesAreInDateInterval:(id)a3 ascending:(BOOL)a4 error:(id *)a5 usingBlock:(id)a6
{
  return MEMORY[0x1E0DE7D20](self->gdSwiftContext, sel_enumerateActivityEventsWhoseEndDatesAreIn_ascending_error_block_, a3);
}

- (BOOL)enumerateActivityEventsInAscendingOrder:(BOOL)a3 error:(id *)a4 usingBlock:(id)a5
{
  return MEMORY[0x1E0DE7D20](self->gdSwiftContext, sel_enumerateActivityEventsWithAscending_error_block_, a3);
}

- (id)entryForEarliestActivityEventAndReturnError:(id *)a3
{
  return (id)MEMORY[0x1E0DE7D20](self->gdSwiftContext, sel_earliestEntryForActivityEventAndReturnError_, a3);
}

- (id)entryForLatestActivityEventAndReturnError:(id *)a3
{
  return (id)MEMORY[0x1E0DE7D20](self->gdSwiftContext, sel_latestEntryForActivityEventAndReturnError_, a3);
}

- (BOOL)enumerateEntriesForActivityEventsThatOverlapWithDateInterval:(id)a3 ascending:(BOOL)a4 error:(id *)a5 usingBlock:(id)a6
{
  return MEMORY[0x1E0DE7D20](self->gdSwiftContext, sel_enumerateEntriesForActivityEventsThatOverlapWith_ascending_error_block_, a3);
}

- (BOOL)enumerateEntriesForActivityEventsWhoseStartDatesAreInDateInterval:(id)a3 ascending:(BOOL)a4 error:(id *)a5 usingBlock:(id)a6
{
  return MEMORY[0x1E0DE7D20](self->gdSwiftContext, sel_enumerateEntriesForActivityEventsWhoseStartDatesAreIn_ascending_error_block_, a3);
}

- (BOOL)enumerateEntriesForActivityEventsWhoseEndDatesAreInDateInterval:(id)a3 ascending:(BOOL)a4 error:(id *)a5 usingBlock:(id)a6
{
  return MEMORY[0x1E0DE7D20](self->gdSwiftContext, sel_enumerateEntriesForActivityEventsWhoseEndDatesAreIn_ascending_error_block_, a3);
}

- (BOOL)enumerateEntriesForActivityEventsInAscendingOrder:(BOOL)a3 error:(id *)a4 usingBlock:(id)a5
{
  return MEMORY[0x1E0DE7D20](self->gdSwiftContext, sel_enumerateEntriesForActivityEventsWithAscending_error_block_, a3);
}

- (id)extremeActivityEventWithEntityIdentifierType:(Class)a3 ascending:(BOOL)a4 outStartDate:(id *)a5 outEndDate:(id *)a6 error:(id *)a7
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
  v24 = sub_1AE907718;
  v25 = sub_1AE907728;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_1AE907718;
  v19 = sub_1AE907728;
  v20 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1AE907730;
  v14[3] = &unk_1E5DD9630;
  v14[5] = &v15;
  v14[6] = a3;
  v14[4] = &v21;
  if (objc_msgSend_enumerateEntriesForActivityEventsInAscendingOrder_error_usingBlock_(self, a2, a4, a7, v14)&& v22[5]&& (v11 = (void *)v16[5]) != 0)
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

- (id)earliestActivityEventWithEntityIdentifierType:(Class)a3 outStartDate:(id *)a4 outEndDate:(id *)a5 error:(id *)a6
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_extremeActivityEventWithEntityIdentifierType_ascending_outStartDate_outEndDate_error_, a3);
}

- (id)latestActivityEventWithEntityIdentifierType:(Class)a3 outStartDate:(id *)a4 outEndDate:(id *)a5 error:(id *)a6
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_extremeActivityEventWithEntityIdentifierType_ascending_outStartDate_outEndDate_error_, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->gdSwiftContext, 0);
}

@end
