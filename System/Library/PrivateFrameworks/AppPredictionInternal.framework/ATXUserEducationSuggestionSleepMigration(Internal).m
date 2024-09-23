@implementation ATXUserEducationSuggestionSleepMigration(Internal)

- (id)userDefaultsKeyForTrackingSuggestionState
{
  void *v1;
  void *v2;
  void *v3;
  objc_super v5;

  v1 = (void *)MEMORY[0x1E0CB3940];
  v5.receiver = a1;
  v5.super_class = (Class)&off_1EF9DA210;
  objc_msgSendSuper2(&v5, sel_userDefaultsKeyForTrackingSuggestionState);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@.%@"), v2, CFSTR("SleepMigration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)metricClass
{
  return objc_opt_class();
}

- (id)server
{
  void *v0;
  void *v1;

  +[ATXUserEducationSuggestionServer sharedInstance](ATXUserEducationSuggestionServer, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "sleepMigrationServer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

@end
