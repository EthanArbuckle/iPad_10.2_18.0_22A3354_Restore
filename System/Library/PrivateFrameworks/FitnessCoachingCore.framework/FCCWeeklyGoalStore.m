@implementation FCCWeeklyGoalStore

- (FCCWeeklyGoalStore)init
{
  FCCWeeklyGoalStore *v2;
  uint64_t v3;
  NSUserDefaults *userDefaults;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FCCWeeklyGoalStore;
  v2 = -[FCCWeeklyGoalStore init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.FitnessCoaching"));
    userDefaults = v2->_userDefaults;
    v2->_userDefaults = (NSUserDefaults *)v3;

  }
  return v2;
}

- (id)currentDisplayContext
{
  void *v2;
  FCCWeeklyGoalDisplayContext *v3;

  -[NSUserDefaults dictionaryForKey:](self->_userDefaults, "dictionaryForKey:", CFSTR("WeeklyGoalDisplayContext"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[FCCWeeklyGoalDisplayContext initWithDictionary:]([FCCWeeklyGoalDisplayContext alloc], "initWithDictionary:", v2);

  return v3;
}

- (void)updateDisplayContext:(id)a3
{
  id v4;

  objc_msgSend(a3, "dictionaryRepresentation");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSUserDefaults setObject:forKey:](self->_userDefaults, "setObject:forKey:", v4, CFSTR("WeeklyGoalDisplayContext"));

}

- (void)clearContext
{
  -[NSUserDefaults setObject:forKey:](self->_userDefaults, "setObject:forKey:", 0, CFSTR("WeeklyGoalDisplayContext"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

@end
