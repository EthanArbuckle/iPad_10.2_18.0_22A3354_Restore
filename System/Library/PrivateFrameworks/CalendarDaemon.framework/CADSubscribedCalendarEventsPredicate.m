@implementation CADSubscribedCalendarEventsPredicate

- (CADSubscribedCalendarEventsPredicate)initWithCalendar:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CADSubscribedCalendarEventsPredicate;
  return -[CADPropertySearchPredicate initWithEntityType:filters:calendar:](&v4, sel_initWithEntityType_filters_calendar_, 2, MEMORY[0x1E0C9AA60], a3);
}

- (id)defaultPropertiesToLoad
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  CADEKPersistentEventMinimumDefaultPropertiesToLoad();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0D0B408];
  v7[0] = *MEMORY[0x1E0D0B2D0];
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
