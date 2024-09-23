@implementation ATXNotificationManagementUserDefaultsOrMAConstants

- (ATXNotificationManagementUserDefaultsOrMAConstants)init
{
  ATXNotificationManagementUserDefaultsOrMAConstants *v2;
  id v3;
  uint64_t v4;
  NSUserDefaults *defaults;
  uint64_t v6;
  ATXNotificationManagementMAConstants *constants;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ATXNotificationManagementUserDefaultsOrMAConstants;
  v2 = -[ATXNotificationManagementUserDefaultsOrMAConstants init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0C99EA0]);
    v4 = objc_msgSend(v3, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
    defaults = v2->_defaults;
    v2->_defaults = (NSUserDefaults *)v4;

    +[ATXNotificationManagementMAConstants sharedInstance](ATXNotificationManagementMAConstants, "sharedInstance");
    v6 = objc_claimAutoreleasedReturnValue();
    constants = v2->_constants;
    v2->_constants = (ATXNotificationManagementMAConstants *)v6;

  }
  return v2;
}

- (id)numberForKey:(id)a3 defaultReturnValue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a3;
  v7 = a4;
  -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v8;
  }
  else
  {
    -[ATXNotificationManagementMAConstants numberForKey:](self->_constants, "numberForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      v8 = v9;
    else
      v8 = v7;
  }
  v10 = v8;

  return v10;
}

- (double)doubleForKey:(id)a3 defaultReturnValue:(double)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithDouble:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXNotificationManagementUserDefaultsOrMAConstants numberForKey:defaultReturnValue:](self, "numberForKey:defaultReturnValue:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_constants, 0);
}

@end
