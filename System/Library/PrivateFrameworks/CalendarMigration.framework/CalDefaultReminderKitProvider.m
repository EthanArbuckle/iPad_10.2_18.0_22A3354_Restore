@implementation CalDefaultReminderKitProvider

+ (CalDefaultReminderKitProvider)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_3);
  return (CalDefaultReminderKitProvider *)(id)sharedInstance_sharedInstance_1;
}

void __47__CalDefaultReminderKitProvider_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedInstance_1;
  sharedInstance_sharedInstance_1 = v0;

}

- (BOOL)reminderKitAvailable
{
  if (!ReminderKitLibraryCore_frameworkLibrary_0)
    ReminderKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  return ReminderKitLibraryCore_frameworkLibrary_0 != 0;
}

- (id)newSaveRequestWithStore:(id)a3
{
  id v3;
  void *v4;
  objc_class *v5;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2050000000;
  v4 = (void *)getREMSaveRequestClass_softClass;
  v12 = getREMSaveRequestClass_softClass;
  if (!getREMSaveRequestClass_softClass)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __getREMSaveRequestClass_block_invoke;
    v8[3] = &unk_24D3F48C8;
    v8[4] = &v9;
    __getREMSaveRequestClass_block_invoke((uint64_t)v8);
    v4 = (void *)v10[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v9, 8);
  v6 = (void *)objc_msgSend([v5 alloc], "initWithStore:", v3);

  return v6;
}

- (id)newDatabaseMigrationContext
{
  return (id)objc_opt_new();
}

- (void)setDefaultReminderListIdentifier:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2050000000;
  v4 = (void *)getREMUserDefaultsClass_softClass;
  v11 = getREMUserDefaultsClass_softClass;
  if (!getREMUserDefaultsClass_softClass)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __getREMUserDefaultsClass_block_invoke;
    v7[3] = &unk_24D3F48C8;
    v7[4] = &v8;
    __getREMUserDefaultsClass_block_invoke((uint64_t)v7);
    v4 = (void *)v9[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v8, 8);
  objc_msgSend(v5, "daemonUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPreferredDefaultListID:", v3);

}

@end
