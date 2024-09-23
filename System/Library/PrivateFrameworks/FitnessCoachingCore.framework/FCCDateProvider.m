@implementation FCCDateProvider

- (id)coachingDate
{
  void *v2;
  id v3;
  void *v4;

  -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("CoachingDate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = v2;
  else
    v3 = objc_alloc_init(MEMORY[0x1E0C99D68]);
  v4 = v3;

  return v4;
}

- (FCCDateProvider)init
{
  FCCDateProvider *v2;
  id v3;
  uint64_t v4;
  NSUserDefaults *userDefaults;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FCCDateProvider;
  v2 = -[FCCDateProvider init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0C99EA0]);
    v4 = objc_msgSend(v3, "initWithSuiteName:", *MEMORY[0x1E0CB7758]);
    userDefaults = v2->_userDefaults;
    v2->_userDefaults = (NSUserDefaults *)v4;

  }
  return v2;
}

- (id)coachingCalendar
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[NSUserDefaults stringForKey:](self->_userDefaults, "stringForKey:", CFSTR("CoachingCalendarIdentifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D48]), "initWithCalendarIdentifier:", v2);
    v4 = v3;
    if (v3)
    {
      v5 = v3;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    v6 = v5;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

@end
