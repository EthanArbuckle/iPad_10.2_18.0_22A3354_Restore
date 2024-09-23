@implementation DNDModeAssertionLifetime

+ (id)lifetimeWithDuration:(double)a3
{
  double v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = fmin(a3, 86400.0);
  v5 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithStartDate:duration:", v6, v4);

  objc_msgSend(a1, "lifetimeWithDateInterval:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)lifetimeWithCurrentLocation
{
  return +[DNDModeAssertionCurrentLocationLifetime sharedInstance](DNDModeAssertionCurrentLocationLifetime, "sharedInstance");
}

+ (id)lifetimeWithDateInterval:(id)a3
{
  id v3;
  DNDModeAssertionDateIntervalLifetime *v4;

  v3 = a3;
  v4 = -[DNDModeAssertionDateIntervalLifetime initWithDateInterval:]([DNDModeAssertionDateIntervalLifetime alloc], "initWithDateInterval:", v3);

  return v4;
}

+ (id)lifetimeUntilEndOfCalendarEventWithUniqueID:(id)a3 occurrenceDate:(id)a4
{
  id v5;
  id v6;
  DNDModeAssertionCalendarEventLifetime *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[DNDModeAssertionCalendarEventLifetime initWithEventUniqueID:occurrenceDate:onlyDuringEvent:]([DNDModeAssertionCalendarEventLifetime alloc], "initWithEventUniqueID:occurrenceDate:onlyDuringEvent:", v6, v5, 0);

  return v7;
}

+ (id)lifetimeWithCalendarEventUniqueID:(id)a3 occurrenceDate:(id)a4
{
  id v5;
  id v6;
  DNDModeAssertionCalendarEventLifetime *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[DNDModeAssertionCalendarEventLifetime initWithEventUniqueID:occurrenceDate:onlyDuringEvent:]([DNDModeAssertionCalendarEventLifetime alloc], "initWithEventUniqueID:occurrenceDate:onlyDuringEvent:", v6, v5, 1);

  return v7;
}

+ (id)lifetimeMatchingScheduleWithIdentifier:(id)a3
{
  id v3;
  DNDModeAssertionScheduleLifetime *v4;

  v3 = a3;
  v4 = -[DNDModeAssertionScheduleLifetime initWithScheduleIdentifier:behavior:]([DNDModeAssertionScheduleLifetime alloc], "initWithScheduleIdentifier:behavior:", v3, 0);

  return v4;
}

+ (id)lifetimeUntilEndOfScheduleWithIdentifier:(id)a3
{
  id v3;
  DNDModeAssertionScheduleLifetime *v4;

  v3 = a3;
  v4 = -[DNDModeAssertionScheduleLifetime initWithScheduleIdentifier:behavior:]([DNDModeAssertionScheduleLifetime alloc], "initWithScheduleIdentifier:behavior:", v3, 1);

  return v4;
}

+ (id)lifetimeWithExplicitRegion:(id)a3
{
  id v3;
  DNDModeAssertionExplicitRegionLifetime *v4;

  v3 = a3;
  v4 = -[DNDModeAssertionExplicitRegionLifetime initWithRegion:]([DNDModeAssertionExplicitRegionLifetime alloc], "initWithRegion:", v3);

  return v4;
}

+ (id)lifetimeForUserRequest
{
  return -[DNDModeAssertionLifetime _init]([DNDModeAssertionUserRequestedLifetime alloc], "_init");
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DNDModeAssertionLifetime;
  return -[DNDModeAssertionLifetime init](&v3, sel_init);
}

- (unint64_t)lifetimeType
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDModeAssertionLifetime)initWithCoder:(id)a3
{
  -[DNDModeAssertionLifetime doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return (DNDModeAssertionLifetime *)-[DNDModeAssertionLifetime _init](self, "_init");
}

- (void)encodeWithCoder:(id)a3
{
  -[DNDModeAssertionLifetime doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

+ (id)_secureCodingLifetimeClasses
{
  if (_secureCodingLifetimeClasses_onceToken != -1)
    dispatch_once(&_secureCodingLifetimeClasses_onceToken, &__block_literal_global_4);
  return (id)_secureCodingLifetimeClasses_lifetimeClasses;
}

void __56__DNDModeAssertionLifetime__secureCodingLifetimeClasses__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, objc_opt_class(), 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)_secureCodingLifetimeClasses_lifetimeClasses;
  _secureCodingLifetimeClasses_lifetimeClasses = v5;

}

@end
