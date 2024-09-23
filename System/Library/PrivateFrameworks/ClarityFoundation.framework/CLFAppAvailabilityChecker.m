@implementation CLFAppAvailabilityChecker

+ (CLFAppAvailabilityChecker)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1)
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_5);
  return (CLFAppAvailabilityChecker *)(id)sharedInstance_SharedInstance;
}

void __43__CLFAppAvailabilityChecker_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_SharedInstance;
  sharedInstance_SharedInstance = v0;

}

- (CLFAppAvailabilityChecker)init
{
  CLFAppAvailabilityChecker *v2;
  void *v3;
  objc_class *v4;
  id v5;
  uint64_t v6;
  PDCPreflightManager *privacyPreflightManager;
  objc_super v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v9.receiver = self;
  v9.super_class = (Class)CLFAppAvailabilityChecker;
  v2 = -[CLFAppAvailabilityChecker init](&v9, sel_init);
  if (v2)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2050000000;
    v3 = (void *)getPDCPreflightManagerClass_softClass;
    v14 = getPDCPreflightManagerClass_softClass;
    if (!getPDCPreflightManagerClass_softClass)
    {
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __getPDCPreflightManagerClass_block_invoke;
      v10[3] = &unk_24C71FB18;
      v10[4] = &v11;
      __getPDCPreflightManagerClass_block_invoke((uint64_t)v10);
      v3 = (void *)v12[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v11, 8);
    v5 = [v4 alloc];
    v6 = objc_msgSend(v5, "initWithTargetQueue:", MEMORY[0x24BDAC9B8]);
    privacyPreflightManager = v2->_privacyPreflightManager;
    v2->_privacyPreflightManager = (PDCPreflightManager *)v6;

  }
  return v2;
}

- (BOOL)isAppAvailableForBundleIdentifier:(id)a3
{
  id v4;
  _BOOL4 v5;

  v4 = a3;
  if (-[CLFAppAvailabilityChecker requiresPreflightForBundleIdentifier:](self, "requiresPreflightForBundleIdentifier:", v4))
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    v5 = !-[CLFAppAvailabilityChecker isHiddenByUserForBundleIdentifier:](self, "isHiddenByUserForBundleIdentifier:", v4);
  }

  return v5;
}

- (BOOL)requiresPreflightForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  char v12;
  id v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2050000000;
  v5 = (void *)getLSApplicationRecordClass_softClass;
  v19 = getLSApplicationRecordClass_softClass;
  if (!getLSApplicationRecordClass_softClass)
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __getLSApplicationRecordClass_block_invoke;
    v15[3] = &unk_24C71FB18;
    v15[4] = &v16;
    __getLSApplicationRecordClass_block_invoke((uint64_t)v15);
    v5 = (void *)v17[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v16, 8);
  v7 = [v6 alloc];
  -[CLFAppAvailabilityChecker standardBundleIdentifierForClarityBundleIdentifier:](self, "standardBundleIdentifierForClarityBundleIdentifier:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v9 = (void *)objc_msgSend(v7, "initWithBundleIdentifier:allowPlaceholder:error:", v8, 0, &v14);
  v10 = v14;

  if (v10)
  {
    +[CLFLog commonLog](CLFLog, "commonLog");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CLFAppAvailabilityChecker requiresPreflightForBundleIdentifier:].cold.2((uint64_t)v4, (uint64_t)v10, v11);
  }
  else
  {
    if (v9)
    {
      -[CLFAppAvailabilityChecker privacyPreflightManager](self, "privacyPreflightManager");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = -[NSObject requiresPreflightForApplicationRecord:](v11, "requiresPreflightForApplicationRecord:", v9);
      goto LABEL_9;
    }
    +[CLFLog commonLog](CLFLog, "commonLog");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CLFAppAvailabilityChecker requiresPreflightForBundleIdentifier:].cold.1((uint64_t)v4, v11);
  }
  v12 = 0;
LABEL_9:

  return v12;
}

- (BOOL)isHiddenByUserForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2050000000;
  v5 = (void *)getAPApplicationClass_softClass;
  v15 = getAPApplicationClass_softClass;
  if (!getAPApplicationClass_softClass)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __getAPApplicationClass_block_invoke;
    v11[3] = &unk_24C71FB18;
    v11[4] = &v12;
    __getAPApplicationClass_block_invoke((uint64_t)v11);
    v5 = (void *)v13[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v12, 8);
  -[CLFAppAvailabilityChecker standardBundleIdentifierForClarityBundleIdentifier:](self, "standardBundleIdentifierForClarityBundleIdentifier:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applicationWithBundleIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isHidden");

  return v9;
}

- (id)standardBundleIdentifierForClarityBundleIdentifier:(id)a3
{
  return (id)_AXSStandardBundleIdentifierForClarityBundleIdentifier();
}

- (id)clarityBundleIdentifierForStandardBundleIdentifier:(id)a3
{
  return (id)_AXSClarityBundleIdentifierForStandardBundleIdentifier();
}

- (id)observeUpdatesWithHandler:(id)a3
{
  id v3;
  _CLFAppAvailabilityObserver *v4;

  v3 = a3;
  v4 = -[_CLFAppAvailabilityObserver initWithHandler:]([_CLFAppAvailabilityObserver alloc], "initWithHandler:", v3);

  return v4;
}

- (PDCPreflightManager)privacyPreflightManager
{
  return self->_privacyPreflightManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyPreflightManager, 0);
}

- (void)requiresPreflightForBundleIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_20D4E9000, a2, OS_LOG_TYPE_ERROR, "Unable to look up record for application with bundle identifier %@, but no error was provided.", (uint8_t *)&v2, 0xCu);
}

- (void)requiresPreflightForBundleIdentifier:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_20D4E9000, log, OS_LOG_TYPE_ERROR, "Error getting application record for app with identifier %@: %@", (uint8_t *)&v3, 0x16u);
}

@end
