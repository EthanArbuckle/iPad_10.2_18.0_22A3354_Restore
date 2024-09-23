@implementation FIMindfulnessCustomReminderProvider

- (FIMindfulnessCustomReminderProvider)init
{
  FIMindfulnessCustomReminderProvider *v2;
  uint64_t v3;
  NPSManager *syncManager;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FIMindfulnessCustomReminderProvider;
  v2 = -[FIMindfulnessCustomReminderProvider init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    syncManager = v2->_syncManager;
    v2->_syncManager = (NPSManager *)v3;

  }
  return v2;
}

- (id)reminders
{
  void *v2;
  char isKindOfClass;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v19;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("CustomReminders"), CFSTR("com.apple.Mind"));
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v4 = (void *)MEMORY[0x24BDBCF20];
  if ((isKindOfClass & 1) != 0)
  {
    v5 = objc_opt_class();
    objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", v6, v2, &v19);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v19;
    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v7);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      _HKInitializeLogging();
      v11 = *MEMORY[0x24BDD2FE0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FE0], OS_LOG_TYPE_ERROR))
        -[FIMindfulnessCustomReminderProvider reminders].cold.1((uint64_t)v8, v11, v12, v13, v14, v15, v16, v17);
      objc_msgSend(MEMORY[0x24BDBCF20], "set");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v10 = (void *)v9;

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (void)updateReminders:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  BOOL v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NPSManager *syncManager;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDD1618];
  objc_msgSend(a3, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v4, "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v20;

  if (v6)
    v8 = v7 == 0;
  else
    v8 = 0;
  if (v8)
  {
    CFPreferencesSetAppValue(CFSTR("CustomReminders"), v6, CFSTR("com.apple.Mind"));
    CFPreferencesAppSynchronize(CFSTR("com.apple.Mind"));
    syncManager = self->_syncManager;
    v17 = (void *)MEMORY[0x24BDBCF20];
    v21[0] = CFSTR("CustomReminders");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setWithArray:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPSManager synchronizeUserDefaultsDomain:keys:](syncManager, "synchronizeUserDefaultsDomain:keys:", CFSTR("com.apple.Mind"), v19);

    notify_post("NanoLifestyleMindfulnessPreferencesChangedNotification");
  }
  else
  {
    _HKInitializeLogging();
    v9 = *MEMORY[0x24BDD2FE0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FE0], OS_LOG_TYPE_ERROR))
      -[FIMindfulnessCustomReminderProvider updateReminders:].cold.1((uint64_t)v7, v9, v10, v11, v12, v13, v14, v15);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncManager, 0);
}

- (void)reminders
{
  OUTLINED_FUNCTION_0_0(&dword_21168F000, a2, a3, "Error to unarchiving reminders %@", a5, a6, a7, a8, 2u);
}

- (void)updateReminders:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21168F000, a2, a3, "Error to archiving reminders %@", a5, a6, a7, a8, 2u);
}

@end
