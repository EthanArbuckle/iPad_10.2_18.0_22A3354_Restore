@implementation IMCloudKitEventNotificationRuntimeTestSuite

- (IMCloudKitEventNotificationRuntimeTestSuite)init
{
  IMCloudKitEventNotificationRuntimeTestSuite *v2;
  IMCloudKitSyncProgressRuntimeTestUploading *v3;
  IMCloudKitSyncProgressRuntimeTestDownloading *v4;
  IMCloudKitSyncProgressRuntimeTestDeleting *v5;
  IMCloudKitSyncProgressRuntimeTestPreparing *v6;
  IMCloudKitSyncProgressRuntimeTestPaused *v7;
  IMCloudKitErrorProgressTest *v8;
  IMCloudKitErrorProgressTest *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)IMCloudKitEventNotificationRuntimeTestSuite;
  v2 = -[IMRuntimeTestSuite init](&v11, sel_init);
  if (v2)
  {
    IMSetAlwaysUseSingletonProxies();
    -[IMRuntimeTestSuite setTestSuiteStartDelay:](v2, "setTestSuiteStartDelay:", 5.0);
    v3 = objc_alloc_init(IMCloudKitSyncProgressRuntimeTestUploading);
    -[IMRuntimeTestSuite addTest:](v2, "addTest:", v3);

    v4 = objc_alloc_init(IMCloudKitSyncProgressRuntimeTestDownloading);
    -[IMRuntimeTestSuite addTest:](v2, "addTest:", v4);

    v5 = objc_alloc_init(IMCloudKitSyncProgressRuntimeTestDeleting);
    -[IMRuntimeTestSuite addTest:](v2, "addTest:", v5);

    v6 = objc_alloc_init(IMCloudKitSyncProgressRuntimeTestPreparing);
    -[IMRuntimeTestSuite addTest:](v2, "addTest:", v6);

    v7 = objc_alloc_init(IMCloudKitSyncProgressRuntimeTestPaused);
    -[IMRuntimeTestSuite addTest:](v2, "addTest:", v7);

    v8 = -[IMCloudKitErrorProgressTest initWithErrorCode:]([IMCloudKitErrorProgressTest alloc], "initWithErrorCode:", 3);
    -[IMRuntimeTestSuite addTest:](v2, "addTest:", v8);

    v9 = -[IMCloudKitErrorProgressTest initWithErrorCode:]([IMCloudKitErrorProgressTest alloc], "initWithErrorCode:", 6);
    -[IMRuntimeTestSuite addTest:](v2, "addTest:", v9);

    -[IMRuntimeTest testLog:](v2, "testLog:", CFSTR("installed tests"));
  }
  return v2;
}

- (void)setUp
{
  void *v3;
  double v4;
  IMCloudKitHookTestSingleton *v5;
  void *v6;
  void *v7;
  void *v8;
  IMCloudKitMockSyncState *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)IMCloudKitEventNotificationRuntimeTestSuite;
  -[IMRuntimeTest setUp](&v10, sel_setUp);
  -[IMCloudKitEventNotificationRuntimeTestSuite setShouldTearDown:](self, "setShouldTearDown:", 0);
  -[IMRuntimeTest testLog:](self, "testLog:", CFSTR("Setting up cloudkit hooks, etc"));
  +[IMCloudKitEventNotificationManager sharedInstance](IMCloudKitEventNotificationManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "progressBroadcastDelay");
  -[IMRuntimeTestSuite setTestStartDelay:](self, "setTestStartDelay:", v4 + 2.0);

  v5 = objc_alloc_init(IMCloudKitHookTestSingleton);
  -[IMCloudKitEventNotificationRuntimeTestSuite setCloudKitHooks:](self, "setCloudKitHooks:", v5);

  -[IMCloudKitEventNotificationRuntimeTestSuite cloudKitHooks](self, "cloudKitHooks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMCloudKitHooks overrideSingletonWithObject:](IMCloudKitHooks, "overrideSingletonWithObject:", v6);

  +[IMCloudKitEventNotificationManager sharedInstance](IMCloudKitEventNotificationManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addEventHandler:", self);

  -[IMCloudKitEventNotificationRuntimeTestSuite cloudKitHooks](self, "cloudKitHooks");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(IMCloudKitMockSyncState);
  objc_msgSend(v8, "setTestState:", v9);

}

- (void)cloudKitEventNotificationManager:(id)a3 syncProgressDidUpdate:(id)a4
{
  id v5;

  if (-[IMCloudKitEventNotificationRuntimeTestSuite shouldTearDown](self, "shouldTearDown", a3, a4))
  {
    -[IMCloudKitEventNotificationRuntimeTestSuite setShouldTearDown:](self, "setShouldTearDown:", 0);
    -[IMRuntimeTest testLog:](self, "testLog:", CFSTR("Actually Tearing down cloudkit hooks"));
    +[IMCloudKitHooks removeSingletonOverride](IMCloudKitHooks, "removeSingletonOverride");
    -[IMCloudKitEventNotificationRuntimeTestSuite setCloudKitHooks:](self, "setCloudKitHooks:", 0);
    +[IMCloudKitEventNotificationManager sharedInstance](IMCloudKitEventNotificationManager, "sharedInstance");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeEventHandler:", self);

  }
}

- (void)tearDown
{
  void *v3;
  IMCloudKitMockSyncState *v4;
  objc_super v5;

  -[IMCloudKitEventNotificationRuntimeTestSuite setShouldTearDown:](self, "setShouldTearDown:", 1);
  -[IMCloudKitEventNotificationRuntimeTestSuite cloudKitHooks](self, "cloudKitHooks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(IMCloudKitMockSyncState);
  objc_msgSend(v3, "setTestState:", v4);

  v5.receiver = self;
  v5.super_class = (Class)IMCloudKitEventNotificationRuntimeTestSuite;
  -[IMRuntimeTest tearDown](&v5, sel_tearDown);
}

+ (void)runTestsIfNeeded
{
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerForKey:", CFSTR("cloudkit-sync-ui-tests"));

  if (v4 >= 1)
  {
    objc_msgSend(a1, "testLog:", CFSTR("user default cloudkit-sync-ui-tests == %ld, starting runtime tests"), v4);
    MEMORY[0x1E0DE7D20](a1, sel_runTestsIfNeededWithRepeatCount_);
  }
}

- (IMCloudKitHookTestSingleton)cloudKitHooks
{
  return self->_cloudKitHooks;
}

- (void)setCloudKitHooks:(id)a3
{
  objc_storeStrong((id *)&self->_cloudKitHooks, a3);
}

- (BOOL)shouldTearDown
{
  return self->_shouldTearDown;
}

- (void)setShouldTearDown:(BOOL)a3
{
  self->_shouldTearDown = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudKitHooks, 0);
}

@end
