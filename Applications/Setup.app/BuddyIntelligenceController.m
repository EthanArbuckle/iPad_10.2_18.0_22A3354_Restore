@implementation BuddyIntelligenceController

- (id)viewController
{
  VTUIGMEnrollmentViewController *v2;
  VTUIGMEnrollmentViewController *intelligenceController;

  if (!self->_intelligenceController)
  {
    v2 = (VTUIGMEnrollmentViewController *)objc_msgSend(objc_alloc((Class)sub_1001093A8()), "initWithDelegate:", self, a2);
    intelligenceController = self->_intelligenceController;
    self->_intelligenceController = v2;

  }
  return self->_intelligenceController;
}

- (void)controllerCompleted
{
  BYPreferencesController *v2;
  BFFFlowItemDelegate *v3;

  v2 = -[BuddyIntelligenceController buddyPreferences](self, "buddyPreferences", a2);
  -[BYPreferencesController setObject:forKey:](v2, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("IntelligencePresented"));

  v3 = -[BuddyIntelligenceController delegate](self, "delegate");
  -[BFFFlowItemDelegate flowItemDone:](v3, "flowItemDone:", self);

}

+ (unint64_t)applicableDispositions
{
  return 20;
}

+ (id)cloudConfigSkipKey
{
  return kCCSkipKeyIntelligence;
}

- (void)controllerWasPopped
{
  BYPreferencesController *v2;

  v2 = -[BuddyIntelligenceController buddyPreferences](self, "buddyPreferences", a2, self);
  -[BYPreferencesController removeObjectForKey:](v2, "removeObjectForKey:", CFSTR("IntelligencePresented"));

}

- (BOOL)controllerNeedsToRun
{
  BYPreferencesController *v2;
  char v3;

  v2 = -[BuddyIntelligenceController buddyPreferences](self, "buddyPreferences", a2, self);
  v3 = -[BYPreferencesController BOOLForKey:](v2, "BOOLForKey:", CFSTR("IntelligencePresented")) ^ 1;

  return v3 & 1;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  IntelligenceProvider *v3;
  void **v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t, char);
  void *v8;
  BuddyIntelligenceController *v9;
  id v10;
  id location[2];
  BuddyIntelligenceController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyIntelligenceController intelligenceProvider](v12, "intelligenceProvider");
  v4 = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_1001096F4;
  v8 = &unk_100280708;
  v9 = v12;
  v10 = location[0];
  -[IntelligenceProvider shouldShowIntelligenceWithServerCheck:completionHandler:](v3, "shouldShowIntelligenceWithServerCheck:completionHandler:", 1, &v4);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)siriGMIntroViewControllerContinuePressed:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  _WORD v6[7];
  os_log_type_t v7;
  os_log_t oslog;
  id location[2];
  BuddyIntelligenceController *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  oslog = (os_log_t)(id)_BYLoggingFacility(v3);
  v7 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v4 = oslog;
    v5 = v7;
    sub_100038C3C(v6);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Apple Intelligence continue button pressed", (uint8_t *)v6, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  -[BuddyIntelligenceController controllerCompleted](v10, "controllerCompleted");
  objc_storeStrong(location, 0);
}

- (void)siriGMIntroViewControllerNotNowPressed:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  _WORD v6[7];
  os_log_type_t v7;
  os_log_t oslog;
  id location[2];
  BuddyIntelligenceController *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  oslog = (os_log_t)(id)_BYLoggingFacility(v3);
  v7 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v4 = oslog;
    v5 = v7;
    sub_100038C3C(v6);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Apple Intelligence not now button pressed", (uint8_t *)v6, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  -[BuddyIntelligenceController controllerCompleted](v10, "controllerCompleted");
  objc_storeStrong(location, 0);
}

- (BFFFlowItemDelegate)delegate
{
  return (BFFFlowItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BYPreferencesController)buddyPreferences
{
  return self->_buddyPreferences;
}

- (void)setBuddyPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_buddyPreferences, a3);
}

- (IntelligenceProvider)intelligenceProvider
{
  return self->_intelligenceProvider;
}

- (void)setIntelligenceProvider:(id)a3
{
  objc_storeStrong((id *)&self->_intelligenceProvider, a3);
}

- (VTUIGMEnrollmentViewController)intelligenceController
{
  return (VTUIGMEnrollmentViewController *)objc_getProperty(self, a2, 32, 1);
}

- (void)setIntelligenceController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intelligenceController, 0);
  objc_storeStrong((id *)&self->_intelligenceProvider, 0);
  objc_storeStrong((id *)&self->_buddyPreferences, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
