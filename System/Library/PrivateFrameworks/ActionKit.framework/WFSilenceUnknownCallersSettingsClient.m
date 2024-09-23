@implementation WFSilenceUnknownCallersSettingsClient

+ (void)createClientWithCompletionHandler:(id)a3
{
  void (**v4)(id, id, _QWORD);
  id v5;

  v4 = (void (**)(id, id, _QWORD))a3;
  v5 = objc_alloc_init((Class)a1);
  v4[2](v4, v5, 0);

}

- (void)getStateWithCompletionHandler:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void (**v9)(id, uint64_t, _QWORD);

  v3 = (objc_class *)MEMORY[0x24BDBCF50];
  v9 = (void (**)(id, uint64_t, _QWORD))a3;
  v4 = [v3 alloc];
  getTUBundleIdentifierTelephonyUtilitiesFramework();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithSuiteName:", v5);
  getTUCallFilteringPreferencesContactsOnlyKey();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "BOOLForKey:", v7);

  v9[2](v9, v8, 0);
}

- (void)setState:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  void (**v5)(id, _QWORD);
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v4 = a3;
  v5 = (void (**)(id, _QWORD))a4;
  v6 = objc_alloc(MEMORY[0x24BDBCF50]);
  getTUBundleIdentifierTelephonyUtilitiesFramework();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithSuiteName:", v7);
  getTUCallFilteringPreferencesContactsOnlyKey();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBool:forKey:", v4, v9);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postNotificationName:object:", CFSTR("SilenceCallsSettingsChangedNotification"), 0);

  v19 = 0;
  v20 = &v19;
  v21 = 0x2050000000;
  v11 = (void *)getNPSManagerClass_softClass;
  v22 = getNPSManagerClass_softClass;
  if (!getNPSManagerClass_softClass)
  {
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __getNPSManagerClass_block_invoke;
    v18[3] = &unk_24F8BB430;
    v18[4] = &v19;
    __getNPSManagerClass_block_invoke((uint64_t)v18);
    v11 = (void *)v20[3];
  }
  v12 = objc_retainAutorelease(v11);
  _Block_object_dispose(&v19, 8);
  v13 = (void *)objc_opt_new();
  getTUBundleIdentifierTelephonyUtilitiesFramework();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x24BDBCF20];
  getTUCallFilteringPreferencesContactsOnlyKey();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWithObject:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "synchronizeUserDefaultsDomain:keys:", v14, v17);

  v5[2](v5, 0);
}

@end
