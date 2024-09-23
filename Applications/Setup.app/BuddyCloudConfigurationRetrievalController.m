@implementation BuddyCloudConfigurationRetrievalController

- (BuddyCloudConfigurationRetrievalController)init
{
  NSBundle *v3;
  NSString *v4;
  BuddyCloudConfigurationRetrievalController *v5;
  objc_super v7;
  SEL v8;
  id location;

  v8 = a2;
  v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v4 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", CFSTR("CLOUD_CONFIG_RETRIEVING"), &stru_100284738, CFSTR("Localizable"));
  location = 0;
  v7.receiver = self;
  v7.super_class = (Class)BuddyCloudConfigurationRetrievalController;
  location = -[BuddyCloudConfigurationRetrievalController initWithSpinnerText:](&v7, "initWithSpinnerText:", v4);
  objc_storeStrong(&location, location);

  if (location)
    *((_BYTE *)location + 8) = 1;
  v5 = (BuddyCloudConfigurationRetrievalController *)location;
  objc_storeStrong(&location, 0);
  return v5;
}

- (void)viewDidLoad
{
  id v2;
  objc_super v3;
  SEL v4;
  BuddyCloudConfigurationRetrievalController *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)BuddyCloudConfigurationRetrievalController;
  -[BuddyCloudConfigurationRetrievalController viewDidLoad](&v3, "viewDidLoad");
  v2 = -[BuddyCloudConfigurationRetrievalController navigationItem](v5, "navigationItem");
  objc_msgSend(v2, "setHidesBackButton:", 1);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;
  BOOL v4;
  SEL v5;
  BuddyCloudConfigurationRetrievalController *v6;

  v6 = self;
  v5 = a2;
  v4 = a3;
  if (-[BuddyCloudConfigurationRetrievalController shouldFetchCloudConfiguration](self, "shouldFetchCloudConfiguration"))
  {
    -[BuddyCloudConfigurationRetrievalController setShouldFetchCloudConfiguration:](v6, "setShouldFetchCloudConfiguration:", 0);
    -[BuddyCloudConfigurationRetrievalController _fetchCloudConfig](v6, "_fetchCloudConfig");
  }
  v3.receiver = v6;
  v3.super_class = (Class)BuddyCloudConfigurationRetrievalController;
  -[BuddyCloudConfigurationRetrievalController viewDidAppear:](&v3, "viewDidAppear:", v4);
}

- (BOOL)controllerNeedsToRun
{
  MCProfileConnection *v2;
  unsigned __int8 v3;
  MCProfileConnection *v4;
  MCProfileConnection *v5;
  id v6;
  char v7;
  DMCReturnToServiceController *v8;
  unsigned __int8 v9;
  id v10;
  char v12;
  id v13;
  BOOL v14;

  v14 = 0;
  v2 = -[BuddyCloudConfigurationRetrievalController managedConfiguration](self, "managedConfiguration");
  v3 = -[MCProfileConnection activationRecordIndicatesCloudConfigurationIsAvailable](v2, "activationRecordIndicatesCloudConfigurationIsAvailable");

  if ((v3 & 1) != 0)
  {
    v4 = -[BuddyCloudConfigurationRetrievalController managedConfiguration](self, "managedConfiguration");
    -[MCProfileConnection flush](v4, "flush");

    v5 = -[BuddyCloudConfigurationRetrievalController managedConfiguration](self, "managedConfiguration");
    v6 = -[MCProfileConnection cloudConfigurationDetails](v5, "cloudConfigurationDetails");
    v12 = 0;
    v7 = 0;
    if (!v6)
    {
      v13 = +[BuddyCloudConfigManager sharedManager](BuddyCloudConfigManager, "sharedManager");
      v12 = 1;
      v7 = objc_msgSend(v13, "hasCloudConfiguration") ^ 1;
    }
    if ((v12 & 1) != 0)

    if ((v7 & 1) != 0)
      v14 = 1;
  }
  v8 = -[BuddyCloudConfigurationRetrievalController mdmReturnToServiceController](self, "mdmReturnToServiceController");
  v9 = -[DMCReturnToServiceController shouldDoReturnToService](v8, "shouldDoReturnToService");

  if ((v9 & 1) != 0)
    v14 = 1;
  if (!v14)
  {
    v10 = +[BuddyCloudConfigManager sharedManager](BuddyCloudConfigManager, "sharedManager");
    objc_msgSend(v10, "cloudConfigMayHaveChanged");

  }
  return v14;
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 14;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  MCProfileConnection *v3;
  void **v4;
  int v5;
  int v6;
  void (*v7)(_QWORD *, void *);
  void *v8;
  id v9;
  id location[2];
  BuddyCloudConfigurationRetrievalController *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyCloudConfigurationRetrievalController managedConfiguration](v11, "managedConfiguration");
  v4 = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_1000C4AE0;
  v8 = &unk_100282410;
  v9 = location[0];
  -[MCProfileConnection restoreCloudConfigAndMDMProfileFromSetAsideDataWithCompletion:](v3, "restoreCloudConfigAndMDMProfileFromSetAsideDataWithCompletion:", &v4);

  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)_fetchCloudConfig
{
  DMCReturnToServiceController *v2;
  unsigned __int8 v3;
  DMCReturnToServiceController *v4;
  MCProfileConnection *v5;
  BOOL v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  MCProfileConnection *v11;
  void **v12;
  int v13;
  int v14;
  void (*v15)(id *, void *, void *);
  void *v16;
  BuddyCloudConfigurationRetrievalController *v17;
  uint8_t buf[15];
  os_log_type_t v19;
  os_log_t oslog;
  char v21;
  id v22;
  char v23;
  MCProfileConnection *v24;
  void **v25;
  int v26;
  int v27;
  void (*v28)(id *, void *);
  void *v29;
  id v30[2];
  BuddyCloudConfigurationRetrievalController *v31;

  v31 = self;
  v30[1] = (id)a2;
  v2 = -[BuddyCloudConfigurationRetrievalController mdmReturnToServiceController](self, "mdmReturnToServiceController");
  v3 = -[DMCReturnToServiceController shouldDoReturnToService](v2, "shouldDoReturnToService");

  if ((v3 & 1) != 0)
  {
    v4 = -[BuddyCloudConfigurationRetrievalController mdmReturnToServiceController](v31, "mdmReturnToServiceController");
    v25 = _NSConcreteStackBlock;
    v26 = -1073741824;
    v27 = 0;
    v28 = sub_1000C4DD4;
    v29 = &unk_100280B80;
    v30[0] = v31;
    -[DMCReturnToServiceController configureMDMWithCompletionHandler:](v4, "configureMDMWithCompletionHandler:", &v25);

    objc_storeStrong(v30, 0);
  }
  else
  {
    v5 = -[BuddyCloudConfigurationRetrievalController managedConfiguration](v31, "managedConfiguration");
    v23 = 0;
    v21 = 0;
    v6 = 1;
    if ((-[MCProfileConnection activationRecordIndicatesCloudConfigurationIsAvailable](v5, "activationRecordIndicatesCloudConfigurationIsAvailable") & 1) != 0)
    {
      v24 = -[BuddyCloudConfigurationRetrievalController managedConfiguration](v31, "managedConfiguration");
      v23 = 1;
      v22 = -[MCProfileConnection cloudConfigurationDetails](v24, "cloudConfigurationDetails");
      v21 = 1;
      v6 = v22 != 0;
    }
    if ((v21 & 1) != 0)

    if ((v23 & 1) != 0)
    if (v6)
    {
      v8 = -[BuddyCloudConfigurationRetrievalController delegate](v31, "delegate");
      objc_msgSend(v8, "flowItemDone:", v31);

    }
    else
    {
      oslog = (os_log_t)(id)_BYLoggingFacility(v7);
      v19 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        v9 = oslog;
        v10 = v19;
        sub_100038C3C(buf);
        _os_log_impl((void *)&_mh_execute_header, v9, v10, "Fetching cloud configuration...", buf, 2u);
      }
      objc_storeStrong((id *)&oslog, 0);
      v11 = -[BuddyCloudConfigurationRetrievalController managedConfiguration](v31, "managedConfiguration");
      v12 = _NSConcreteStackBlock;
      v13 = -1073741824;
      v14 = 0;
      v15 = sub_1000C5198;
      v16 = &unk_100282438;
      v17 = v31;
      -[MCProfileConnection retrieveCloudConfigurationDetailsCompletionBlock:](v11, "retrieveCloudConfigurationDetailsCompletionBlock:", &v12);

      objc_storeStrong((id *)&v17, 0);
    }
  }
}

- (void)_presentTryAgainAlert
{
  NSBundle *v2;
  NSString *v3;
  NSBundle *v4;
  id v5;
  NSString *v6;
  id v7;
  NSBundle *v8;
  NSString *v9;
  UIAlertAction *v10;
  id v11;
  NSBundle *v12;
  id v13;
  NSString *v14;
  UIAlertAction *v15;
  void **v16;
  int v17;
  int v18;
  void (*v19)(id *, void *);
  void *v20;
  BuddyCloudConfigurationRetrievalController *v21;
  void **v22;
  int v23;
  int v24;
  void (*v25)(id *, void *);
  void *v26;
  BuddyCloudConfigurationRetrievalController *v27;
  id location[2];
  BuddyCloudConfigurationRetrievalController *v29;

  v29 = self;
  location[1] = (id)a2;
  v2 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v3 = -[NSBundle localizedStringForKey:value:table:](v2, "localizedStringForKey:value:table:", CFSTR("CLOUD_CONFIG_RETRIEVAL_FAILED_TITLE"), &stru_100284738, CFSTR("Localizable"));
  v4 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v5 = (id)SFLocalizableWAPIStringKeyForKey(CFSTR("CLOUD_CONFIG_RETRIEVAL_FAILED_MESSAGE_WIFI"));
  v6 = -[NSBundle localizedStringForKey:value:table:](v4, "localizedStringForKey:value:table:", v5, &stru_100284738, CFSTR("Localizable"));
  location[0] = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v3, v6, 1);

  v7 = location[0];
  v8 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v9 = -[NSBundle localizedStringForKey:value:table:](v8, "localizedStringForKey:value:table:", CFSTR("TRY_AGAIN"), &stru_100284738, CFSTR("Localizable"));
  v22 = _NSConcreteStackBlock;
  v23 = -1073741824;
  v24 = 0;
  v25 = sub_1000C598C;
  v26 = &unk_100280A28;
  v27 = v29;
  v10 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v9, 0, &v22);
  objc_msgSend(v7, "addAction:", v10);

  v11 = location[0];
  v12 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v13 = (id)SFLocalizableWAPIStringKeyForKey(CFSTR("CHOOSE_NETWORK_WIFI"));
  v14 = -[NSBundle localizedStringForKey:value:table:](v12, "localizedStringForKey:value:table:", v13, &stru_100284738, CFSTR("Localizable"));
  v16 = _NSConcreteStackBlock;
  v17 = -1073741824;
  v18 = 0;
  v19 = sub_1000C59D8;
  v20 = &unk_100280A28;
  v21 = v29;
  v15 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v14, 0, &v16);
  objc_msgSend(v11, "addAction:", v15);

  -[BuddyCloudConfigurationRetrievalController presentViewController:animated:completion:](v29, "presentViewController:animated:completion:", location[0], 1, 0);
  objc_storeStrong((id *)&v21, 0);
  objc_storeStrong((id *)&v27, 0);
  objc_storeStrong(location, 0);
}

- (MCProfileConnection)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_managedConfiguration, a3);
}

- (DMCReturnToServiceController)mdmReturnToServiceController
{
  return self->_mdmReturnToServiceController;
}

- (void)setMdmReturnToServiceController:(id)a3
{
  objc_storeStrong((id *)&self->_mdmReturnToServiceController, a3);
}

- (BOOL)shouldFetchCloudConfiguration
{
  return self->_shouldFetchCloudConfiguration;
}

- (void)setShouldFetchCloudConfiguration:(BOOL)a3
{
  self->_shouldFetchCloudConfiguration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mdmReturnToServiceController, 0);
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
}

@end
