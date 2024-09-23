@implementation BuddyRestoreSilentRenewController

- (BuddyRestoreSilentRenewController)init
{
  NSBundle *v3;
  NSString *v4;
  BuddyRestoreSilentRenewController *v5;
  id location;

  v3 = +[NSBundle mainBundle](NSBundle, "mainBundle", a2, self);
  v4 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", CFSTR("UPGRADING_ICLOUD_WORDY"), &stru_100284738, CFSTR("Localizable"));
  location = -[BuddyRestoreSilentRenewController initWithSpinnerText:](self, "initWithSpinnerText:", v4);
  v5 = (BuddyRestoreSilentRenewController *)location;

  objc_storeStrong(&location, 0);
  return v5;
}

- (void)loadView
{
  id v2;
  objc_super v3;
  SEL v4;
  BuddyRestoreSilentRenewController *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)BuddyRestoreSilentRenewController;
  -[BuddyRestoreSilentRenewController loadView](&v3, "loadView");
  v2 = -[BuddyRestoreSilentRenewController navigationItem](v5, "navigationItem");
  objc_msgSend(v2, "setHidesBackButton:", 1);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;
  BOOL v4;
  SEL v5;
  BuddyRestoreSilentRenewController *v6;

  v6 = self;
  v5 = a2;
  v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)BuddyRestoreSilentRenewController;
  -[BuddyRestoreSilentRenewController viewDidAppear:](&v3, "viewDidAppear:", a3);
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  id v3;
  char v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  id v15;
  id v16;
  void **v17;
  int v18;
  int v19;
  void (*v20)(NSObject *, uint64_t, id);
  void *v21;
  BuddyRestoreSilentRenewController *v22;
  id v23;
  id v24;
  uint8_t v25[7];
  os_log_type_t v26;
  os_log_t v27;
  uint8_t v28[7];
  os_log_type_t v29;
  os_log_t oslog;
  id v31;
  int v32;
  uint8_t buf[7];
  os_log_type_t v34;
  id v35;
  id location[2];
  BuddyRestoreSilentRenewController *v37;
  _QWORD v38[2];
  _QWORD v39[2];

  v37 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = +[BYSecurityInterface sharedInterface](BYSecurityInterface, "sharedInterface");
  v4 = objc_msgSend(v3, "isHSA2EnabledForPrimaryAccount") ^ 1;

  if ((v4 & 1) != 0)
  {
    v35 = (id)_BYLoggingFacility(v5);
    v34 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v35, OS_LOG_TYPE_DEFAULT))
    {
      v6 = v35;
      v7 = v34;
      sub_100038C3C(buf);
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Unable to perform silent renew; account is not HSA2", buf, 2u);
    }
    objc_storeStrong(&v35, 0);
    if (location[0])
      (*((void (**)(id, _QWORD))location[0] + 2))(location[0], 0);
    v32 = 1;
  }
  else
  {
    v8 = +[ACAccountStore defaultStore](ACAccountStore, "defaultStore");
    v31 = objc_msgSend(v8, "aa_primaryAppleAccount");

    if (v31)
    {
      if (location[0])
      {
        v12 = (*((uint64_t (**)(id, uint64_t))location[0] + 2))(location[0], 1);
        v27 = (os_log_t)(id)_BYLoggingFacility(v12);
        v26 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          v13 = v27;
          v14 = v26;
          sub_100038C3C(v25);
          _os_log_impl((void *)&_mh_execute_header, v13, v14, "Renewing account credentials prior to restore...", v25, 2u);
        }
        objc_storeStrong((id *)&v27, 0);
        v15 = +[ACAccountStore defaultStore](ACAccountStore, "defaultStore");
        v24 = objc_msgSend(v15, "aa_primaryAppleAccount");

        v38[0] = kACRenewCredentialsShouldAvoidUIKey;
        v39[0] = &__kCFBooleanTrue;
        v38[1] = kACRenewCredentialsShouldForceKey;
        v39[1] = &__kCFBooleanTrue;
        v23 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
        v16 = +[ACAccountStore defaultStore](ACAccountStore, "defaultStore");
        v17 = _NSConcreteStackBlock;
        v18 = -1073741824;
        v19 = 0;
        v20 = sub_10014A424;
        v21 = &unk_100283688;
        v22 = v37;
        objc_msgSend(v16, "renewCredentialsForAccount:options:completion:", v24, v23, &v17);

        objc_storeStrong((id *)&v22, 0);
        objc_storeStrong(&v23, 0);
        objc_storeStrong(&v24, 0);
      }
      v32 = 0;
    }
    else
    {
      oslog = (os_log_t)(id)_BYLoggingFacility(v9);
      v29 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        v10 = oslog;
        v11 = v29;
        sub_100038C3C(v28);
        _os_log_impl((void *)&_mh_execute_header, v10, v11, "Unable to perform silent renew; no primary account!",
          v28,
          2u);
      }
      objc_storeStrong((id *)&oslog, 0);
      if (location[0])
        (*((void (**)(id, _QWORD))location[0] + 2))(location[0], 0);
      v32 = 1;
    }
    objc_storeStrong(&v31, 0);
  }
  objc_storeStrong(location, 0);
}

- (BOOL)renewSucceeded
{
  return self->_renewSucceeded;
}

- (void)setRenewSucceeded:(BOOL)a3
{
  self->_renewSucceeded = a3;
}

@end
