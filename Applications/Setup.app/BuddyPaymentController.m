@implementation BuddyPaymentController

- (id)_createPaymentControllerWithContext:(id)a3
{
  id v3;
  id v4;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = objc_alloc((Class)sub_100156A7C());
  v4 = objc_msgSend(v3, "initWithSetupAssistantContext:", location[0]);
  objc_storeStrong(location, 0);
  return v4;
}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSetupPayment;
}

+ (unint64_t)applicableDispositions
{
  return 20;
}

- (BOOL)controllerNeedsToRun
{
  BYCapabilities *v2;
  char v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  BYPreferencesController *v7;
  unsigned __int8 v8;
  BYChronicle *v9;
  id v10;
  char v11;
  uint64_t v12;
  os_log_t v14;
  char v15;
  char v16;
  uint8_t buf[15];
  os_log_type_t v18;
  os_log_t oslog[2];
  BuddyPaymentController *v20;
  uint8_t v22[24];

  v20 = self;
  oslog[1] = (os_log_t)a2;
  v2 = -[BuddyPaymentController capabilities](self, "capabilities");
  v3 = -[BYCapabilities supportsApplePay](v2, "supportsApplePay") ^ 1;

  if ((v3 & 1) != 0)
  {
    oslog[0] = (os_log_t)(id)_BYLoggingFacility(v4);
    v18 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      v5 = oslog[0];
      v6 = v18;
      sub_100038C3C(buf);
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Hardware does not support Apple Pay, skipping", buf, 2u);
    }
    objc_storeStrong((id *)oslog, 0);
    return 0;
  }
  else
  {
    v7 = -[BuddyPaymentController buddyPreferences](v20, "buddyPreferences");
    v8 = -[BYPreferencesController BOOLForKey:](v7, "BOOLForKey:", CFSTR("Payment2Presented"));

    v16 = v8 & 1;
    v9 = -[BuddyPaymentController chronicle](v20, "chronicle");
    v10 = -[BYChronicle entryForFeature:](v9, "entryForFeature:", 1);
    v11 = objc_msgSend(v10, "createdOnCurrentMajorVersion") ^ 1;

    v15 = v11 & 1;
    if ((v16 & 1) == 0 || (v15 & 1) != 0)
    {
      return 1;
    }
    else
    {
      v14 = (os_log_t)(id)_BYLoggingFacility(v12);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        sub_10003CBAC((uint64_t)v22, v16 & 1, v15 & 1);
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Skipping Apple Pay because it was already presented (%d) and we did not cross a major OS boundary (%d)", v22, 0xEu);
      }
      objc_storeStrong((id *)&v14, 0);
      return 0;
    }
  }
}

- (id)viewController
{
  return -[BuddyPaymentController initialViewController](self, "initialViewController", a2, self);
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  NSObject *v3;
  void **block;
  int v5;
  int v6;
  void (*v7)(id *);
  void *v8;
  BuddyPaymentController *v9;
  id v10;
  id location[2];
  BuddyPaymentController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = dispatch_get_global_queue(25, 0);
  block = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_100156EF4;
  v8 = &unk_1002806E0;
  v9 = v12;
  v10 = location[0];
  dispatch_async(v3, &block);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)controllerWasPopped
{
  BYPreferencesController *v2;

  v2 = -[BuddyPaymentController buddyPreferences](self, "buddyPreferences", a2, self);
  -[BYPreferencesController removeObjectForKey:](v2, "removeObjectForKey:", CFSTR("Payment2Presented"));

}

- (BOOL)controllerAllowsNavigatingBack
{
  return 0;
}

- (BOOL)shouldSuppressExtendedInitializationActivityIndicator
{
  return -[BuddyPaymentController shouldSuppressSpinner](self, "shouldSuppressSpinner", a2, self);
}

- (void)viewControllerDidTerminateSetupFlow:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  PKPaymentSetupAssistantController *v6;
  unsigned __int8 v7;
  BYFlowSkipController *v8;
  BYPaneFeatureAnalyticsManager *v9;
  BYPreferencesController *v10;
  BYPreferencesController *v11;
  BFFFlowItemDelegate *v12;
  id location[2];
  BuddyPaymentController *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = location[0];
  v4 = sub_100157EB8();
  v5 = objc_opt_class(v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
    -[BuddyPaymentController setShouldSuppressSpinner:](v14, "setShouldSuppressSpinner:", 1);
  v6 = -[BuddyPaymentController paymentController](v14, "paymentController");
  v7 = -[PKPaymentSetupAssistantController isFollowupNeededReturningRequirements:](v6, "isFollowupNeededReturningRequirements:", 0);

  v8 = -[BuddyPaymentController flowSkipController](v14, "flowSkipController");
  if ((v7 & 1) != 0)
  {
    -[BYFlowSkipController didSkipFlow:](v8, "didSkipFlow:", BYFlowSkipIdentifierApplePay);

    v9 = -[BuddyPaymentController paneFeatureAnalyticsManager](v14, "paneFeatureAnalyticsManager");
    -[BYPaneFeatureAnalyticsManager recordActionWithValue:forFeature:](v9, "recordActionWithValue:forFeature:", &__kCFBooleanFalse, 15);
  }
  else
  {
    -[BYFlowSkipController didCompleteFlow:](v8, "didCompleteFlow:", BYFlowSkipIdentifierApplePay);

    v9 = -[BuddyPaymentController paneFeatureAnalyticsManager](v14, "paneFeatureAnalyticsManager");
    -[BYPaneFeatureAnalyticsManager recordActionWithValue:forFeature:](v9, "recordActionWithValue:forFeature:", &__kCFBooleanTrue, 15);
  }

  v10 = -[BuddyPaymentController buddyPreferences](v14, "buddyPreferences");
  -[BYPreferencesController setObject:forKey:](v10, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("Payment2Presented"));

  v11 = -[BuddyPaymentController buddyPreferences](v14, "buddyPreferences");
  -[BYPreferencesController setObject:forKey:](v11, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("ApplePayOnBoardingPresented"));

  v12 = -[BuddyPaymentController delegate](v14, "delegate");
  -[BFFFlowItemDelegate flowItemDone:](v12, "flowItemDone:", v14);

  objc_storeStrong(location, 0);
}

+ (void)setupAssistantExpressProvisioningContext:(id)a3
{
  id v3;
  void **v4;
  int v5;
  int v6;
  void (*v7)(_QWORD *, void *, uint64_t);
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = objc_alloc_init((Class)BYBuddyDaemonGeneralClient);
  v3 = objc_msgSend(v13, "fetchAuthenticationContextForApplePay");
  v12 = objc_msgSend(v3, "externalizedContext");

  v11 = objc_msgSend(objc_alloc((Class)sub_1001572C0()), "initWithSetupAssistant:", 1);
  objc_msgSend(v11, "setExternalizedContext:", v12);
  v10 = objc_msgSend(objc_alloc((Class)sub_100157924()), "initWithSetupAssistantContext:", v11);
  v4 = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_1001580F8;
  v8 = &unk_100283950;
  v9 = location[0];
  objc_msgSend(v10, "expressSetupProvisioningContext:", &v4);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
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

- (BuddyExistingSettings)existingSettings
{
  return self->_existingSettings;
}

- (void)setExistingSettings:(id)a3
{
  objc_storeStrong((id *)&self->_existingSettings, a3);
}

- (BuddyMiscState)miscState
{
  return self->_miscState;
}

- (void)setMiscState:(id)a3
{
  objc_storeStrong((id *)&self->_miscState, a3);
}

- (BYChronicle)chronicle
{
  return self->_chronicle;
}

- (void)setChronicle:(id)a3
{
  objc_storeStrong((id *)&self->_chronicle, a3);
}

- (BYCapabilities)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_capabilities, a3);
}

- (BYPreferencesController)buddyPreferences
{
  return self->_buddyPreferences;
}

- (void)setBuddyPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_buddyPreferences, a3);
}

- (BYFlowSkipController)flowSkipController
{
  return self->_flowSkipController;
}

- (void)setFlowSkipController:(id)a3
{
  objc_storeStrong((id *)&self->_flowSkipController, a3);
}

- (BYPaneFeatureAnalyticsManager)paneFeatureAnalyticsManager
{
  return self->_paneFeatureAnalyticsManager;
}

- (void)setPaneFeatureAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_paneFeatureAnalyticsManager, a3);
}

- (PKPaymentSetupAssistantExpressController)expressController
{
  return self->_expressController;
}

- (void)setExpressController:(id)a3
{
  objc_storeStrong((id *)&self->_expressController, a3);
}

- (PKPaymentSetupAssistantProvisioningContext)setupProvisioningContext
{
  return self->_setupProvisioningContext;
}

- (void)setSetupProvisioningContext:(id)a3
{
  objc_storeStrong((id *)&self->_setupProvisioningContext, a3);
}

- (BOOL)shouldSuppressSpinner
{
  return self->_shouldSuppressSpinner;
}

- (void)setShouldSuppressSpinner:(BOOL)a3
{
  self->_shouldSuppressSpinner = a3;
}

- (PKPaymentSetupAssistantController)paymentController
{
  return self->_paymentController;
}

- (void)setPaymentController:(id)a3
{
  objc_storeStrong((id *)&self->_paymentController, a3);
}

- (UIViewController)initialViewController
{
  return self->_initialViewController;
}

- (void)setInitialViewController:(id)a3
{
  objc_storeStrong((id *)&self->_initialViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialViewController, 0);
  objc_storeStrong((id *)&self->_paymentController, 0);
  objc_storeStrong((id *)&self->_setupProvisioningContext, 0);
  objc_storeStrong((id *)&self->_expressController, 0);
  objc_storeStrong((id *)&self->_paneFeatureAnalyticsManager, 0);
  objc_storeStrong((id *)&self->_flowSkipController, 0);
  objc_storeStrong((id *)&self->_buddyPreferences, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_chronicle, 0);
  objc_storeStrong((id *)&self->_miscState, 0);
  objc_storeStrong((id *)&self->_existingSettings, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
