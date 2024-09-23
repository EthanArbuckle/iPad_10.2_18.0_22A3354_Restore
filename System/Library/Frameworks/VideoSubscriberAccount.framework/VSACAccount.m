@implementation VSACAccount

+ (id)sharedInstance
{
  if (sharedInstance___vs_lazy_init_predicate != -1)
    dispatch_once(&sharedInstance___vs_lazy_init_predicate, &__block_literal_global_1);
  return (id)sharedInstance___vs_lazy_init_variable;
}

void __29__VSACAccount_sharedInstance__block_invoke()
{
  VSACAccount *v0;
  void *v1;

  v0 = objc_alloc_init(VSACAccount);
  v1 = (void *)sharedInstance___vs_lazy_init_variable;
  sharedInstance___vs_lazy_init_variable = (uint64_t)v0;

}

- (VSACAccount)initWithManualPasswordOption:(unint64_t)a3
{
  VSACAccount *v4;
  objc_super v6;

  if (!self)
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)VSACAccount;
  v4 = -[VSACAccount init](&v6, sel_init);
  -[VSACAccount setOverridingPasswordOption:](v4, "setOverridingPasswordOption:", a3);
  return v4;
}

- (BOOL)hasAccount
{
  BOOL v3;
  void *v4;

  if (-[VSACAccount overridingPasswordOption](self, "overridingPasswordOption"))
    return 1;
  -[VSACAccount account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4 != 0;

  return v3;
}

- (unint64_t)freeAppPasswordPromptSetting
{
  if (-[VSACAccount overridingPasswordOption](self, "overridingPasswordOption"))
    return -[VSACAccount overridingPasswordOption](self, "overridingPasswordOption");
  if (-[VSACAccount hasAccount](self, "hasAccount"))
    return -[VSACAccount convertedAMSAccountPasswordPromptSettingWithPaid:](self, "convertedAMSAccountPasswordPromptSettingWithPaid:", 0);
  return 0;
}

- (unint64_t)paidAppPasswordPromptSetting
{
  if (-[VSACAccount overridingPasswordOption](self, "overridingPasswordOption"))
    return -[VSACAccount overridingPasswordOption](self, "overridingPasswordOption");
  if (-[VSACAccount hasAccount](self, "hasAccount"))
    return -[VSACAccount convertedAMSAccountPasswordPromptSettingWithPaid:](self, "convertedAMSAccountPasswordPromptSettingWithPaid:", 1);
  return 0;
}

- (id)account
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ams_activeiTunesAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)username
{
  void *v2;
  void *v3;

  -[VSACAccount account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "username");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)convertedAMSAccountPasswordPromptSettingWithPaid:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  NSObject *v10;

  v3 = a3;
  -[VSACAccount account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    v7 = v6;
    if (v3)
      v8 = objc_msgSend(v6, "ams_paidPasswordPromptSetting");
    else
      v8 = objc_msgSend(v6, "ams_freePasswordPromptSetting");
    v9 = v8;
    if (v8 >= 4)
    {
      VSErrorLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[VSACAccount convertedAMSAccountPasswordPromptSettingWithPaid:].cold.1(v9, v10);

      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)overridingPasswordOption
{
  return self->_overridingPasswordOption;
}

- (void)setOverridingPasswordOption:(unint64_t)a3
{
  self->_overridingPasswordOption = a3;
}

- (void)convertedAMSAccountPasswordPromptSettingWithPaid:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_fault_impl(&dword_1D2419000, a2, OS_LOG_TYPE_FAULT, "Unhandled AMSAccountPasswordPromptSetting case %lu. Need to update enum.", (uint8_t *)&v2, 0xCu);
}

@end
