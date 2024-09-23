@implementation BuddyiCloudQuotaController

- (BOOL)controllerNeedsToRun
{
  BYPreferencesController *v2;
  char v3;

  v2 = -[BuddyiCloudQuotaController buddyPreferences](self, "buddyPreferences", a2, self);
  v3 = -[BYPreferencesController BOOLForKey:](v2, "BOOLForKey:", CFSTR("iCloudQuotaPresented")) ^ 1;

  return v3 & 1;
}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSetupCloudStorage;
}

+ (unint64_t)applicableDispositions
{
  return 12;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  id v3;
  void **v4;
  int v5;
  int v6;
  void (*v7)(uint64_t, char, id);
  void *v8;
  id v9;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = sub_10005A178();
  v4 = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_10005A264;
  v8 = &unk_100280690;
  v9 = location[0];
  objc_msgSend(v3, "needsToRunWithCompletion:", &v4);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)presentHostedViewControllerOnNavigationController:(id)a3 completion:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  id pushCompletion;
  ICQUpgradeFlowManager *v9;
  ICQUpgradeFlowManager *flowManager;
  NSObject *v11;
  os_log_type_t v12;
  _WORD v13[7];
  os_log_type_t v14;
  os_log_t oslog;
  id v16;
  id v17;
  id location[2];
  BuddyiCloudQuotaController *v19;

  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = 0;
  objc_storeStrong(&v17, a4);
  v5 = objc_msgSend(sub_10005A614(), "sharedOfferManager");
  v16 = objc_msgSend(v5, "currentOffer");

  if (v16)
  {
    v7 = objc_msgSend(v17, "copy");
    pushCompletion = v19->_pushCompletion;
    v19->_pushCompletion = v7;

    v9 = (ICQUpgradeFlowManager *)objc_msgSend(objc_alloc((Class)sub_10005A178()), "initWithOffer:", v16);
    flowManager = v19->_flowManager;
    v19->_flowManager = v9;

    -[ICQUpgradeFlowManager setDelegate:](v19->_flowManager, "setDelegate:", v19);
    -[ICQUpgradeFlowManager presentFlowHostedInNavigationController:](v19->_flowManager, "presentFlowHostedInNavigationController:", location[0]);
  }
  else if (v17)
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v6);
    v14 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v11 = oslog;
      v12 = v14;
      sub_100038C3C(v13);
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "iCloudQuota: Skipping due to nil offer", (uint8_t *)v13, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    (*((void (**)(id, _QWORD))v17 + 2))(v17, 0);
  }
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

- (void)cancelHostedPresentation
{
  NSObject *v2;
  os_log_type_t v3;
  id pushCompletion;
  _WORD v5[3];
  os_log_type_t v6;
  os_log_t oslog[2];
  BuddyiCloudQuotaController *v8;

  v8 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility(self);
  v6 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = oslog[0];
    v3 = v6;
    sub_100038C3C(v5);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Canceling iCloud Quota presenation. Please take a sysdiagnose and file a radar against PEP Setup Assistant.", (uint8_t *)v5, 2u);
  }
  objc_storeStrong((id *)oslog, 0);
  pushCompletion = v8->_pushCompletion;
  v8->_pushCompletion = 0;

  -[ICQUpgradeFlowManager setHostingNavigationController:](v8->_flowManager, "setHostingNavigationController:", 0);
  -[ICQUpgradeFlowManager _cancelFlow](v8->_flowManager, "_cancelFlow");
  -[ICQUpgradeFlowManager setDelegate:](v8->_flowManager, "setDelegate:", 0);
  objc_storeStrong((id *)&v8->_flowManager, 0);
}

- (id)viewController
{
  return self->_viewController;
}

- (BOOL)controllerAllowsNavigatingBack
{
  return 0;
}

- (void)controllerWasPopped
{
  BYPreferencesController *v2;

  v2 = -[BuddyiCloudQuotaController buddyPreferences](self, "buddyPreferences", a2, self);
  -[BYPreferencesController removeObjectForKey:](v2, "removeObjectForKey:", CFSTR("iCloudQuotaPresented"));

}

- (void)upgradeFlowManager:(id)a3 didPresentViewController:(id)a4
{
  id pushCompletion;
  id obj;
  id location[2];
  BuddyiCloudQuotaController *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  obj = 0;
  objc_storeStrong(&obj, a4);
  if (v8->_pushCompletion)
  {
    objc_storeStrong((id *)&v8->_viewController, obj);
    (*((void (**)(void))v8->_pushCompletion + 2))();
    pushCompletion = v8->_pushCompletion;
    v8->_pushCompletion = 0;

  }
  objc_storeStrong(&obj, 0);
  objc_storeStrong(location, 0);
}

- (void)manager:(id)a3 loadDidFailWithError:(id)a4
{
  uint64_t v5;
  id pushCompletion;
  os_log_t oslog;
  id v8;
  id location[2];
  BuddyiCloudQuotaController *v10;
  uint8_t buf[24];

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = 0;
  objc_storeStrong(&v8, a4);
  oslog = (os_log_t)(id)_BYLoggingFacility(v5);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100038C28((uint64_t)buf, (uint64_t)v8);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "iCloudQuota load failed: %@", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  if (v10->_pushCompletion)
  {
    (*((void (**)(void))v10->_pushCompletion + 2))();
    pushCompletion = v10->_pushCompletion;
    v10->_pushCompletion = 0;

  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)upgradeFlowManagerDidCancel:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  BYPreferencesController *v6;
  BFFFlowItemDelegate *v7;
  _WORD v8[7];
  os_log_type_t v9;
  os_log_t oslog;
  id location[2];
  BuddyiCloudQuotaController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  oslog = (os_log_t)(id)_BYLoggingFacility(v3);
  v9 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v4 = oslog;
    v5 = v9;
    sub_100038C3C(v8);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "iCloudQuota cancelled", (uint8_t *)v8, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v6 = -[BuddyiCloudQuotaController buddyPreferences](v12, "buddyPreferences");
  -[BYPreferencesController setObject:forKey:](v6, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("iCloudQuotaPresented"));

  v7 = -[BuddyiCloudQuotaController delegate](v12, "delegate");
  -[BFFFlowItemDelegate flowItemDone:](v7, "flowItemDone:", v12);

  objc_storeStrong(location, 0);
}

- (void)upgradeFlowManagerDidComplete:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  BYPreferencesController *v6;
  BFFFlowItemDelegate *v7;
  _WORD v8[7];
  os_log_type_t v9;
  os_log_t oslog;
  id location[2];
  BuddyiCloudQuotaController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  oslog = (os_log_t)(id)_BYLoggingFacility(v3);
  v9 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v4 = oslog;
    v5 = v9;
    sub_100038C3C(v8);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "iCloudQuota Complete!", (uint8_t *)v8, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v6 = -[BuddyiCloudQuotaController buddyPreferences](v12, "buddyPreferences");
  -[BYPreferencesController setObject:forKey:](v6, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("iCloudQuotaPresented"));

  v7 = -[BuddyiCloudQuotaController delegate](v12, "delegate");
  -[BFFFlowItemDelegate flowItemDone:](v7, "flowItemDone:", v12);

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buddyPreferences, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_pushCompletion, 0);
  objc_storeStrong((id *)&self->_flowManager, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end
