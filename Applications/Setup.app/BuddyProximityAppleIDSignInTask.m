@implementation BuddyProximityAppleIDSignInTask

- (BuddyProximityAppleIDSignInTask)init
{
  BuddyProximityAppleIDSignInTask *v2;
  objc_super v4;
  SEL v5;
  id location;

  v5 = a2;
  location = 0;
  v4.receiver = self;
  v4.super_class = (Class)BuddyProximityAppleIDSignInTask;
  location = -[BuddyProximityAppleIDSignInTask init](&v4, "init");
  objc_storeStrong(&location, location);
  if (location)
    *((_BYTE *)location + 11) = 1;
  v2 = (BuddyProximityAppleIDSignInTask *)location;
  objc_storeStrong(&location, 0);
  return v2;
}

- (BuddyProximityAppleIDSignInTask)initWithSession:(id)a3 analyticsManager:(id)a4 featureFlags:(id)a5
{
  id v7;
  BuddyProximityAppleIDSignInTask *v8;
  id v10;
  id obj;
  id location[2];
  id v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  obj = 0;
  objc_storeStrong(&obj, a4);
  v10 = 0;
  objc_storeStrong(&v10, a5);
  v7 = v13;
  v13 = 0;
  v13 = objc_msgSend(v7, "init");
  objc_storeStrong(&v13, v13);
  if (v13)
  {
    objc_storeStrong((id *)v13 + 6, location[0]);
    objc_storeStrong((id *)v13 + 8, obj);
    objc_storeStrong((id *)v13 + 4, v10);
  }
  v8 = (BuddyProximityAppleIDSignInTask *)v13;
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&obj, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v13, 0);
  return v8;
}

- (void)authenticateThenSignInWithCompletion:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  BuddyProximityAppleIDSignInTask *v6;
  void **v7;
  int v8;
  int v9;
  void (*v10)(id *, void *, void *, void *);
  void *v11;
  BuddyProximityAppleIDSignInTask *v12;
  id v13;
  uint8_t buf[15];
  os_log_type_t v15;
  os_log_t oslog;
  id location[2];
  BuddyProximityAppleIDSignInTask *v18;

  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  oslog = (os_log_t)(id)_BYLoggingFacility(v3);
  v15 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v4 = oslog;
    v5 = v15;
    sub_100038C3C(buf);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Beginning proximity sign in...", buf, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v6 = v18;
  v7 = _NSConcreteStackBlock;
  v8 = -1073741824;
  v9 = 0;
  v10 = sub_10014C5A0;
  v11 = &unk_100283700;
  v13 = location[0];
  v12 = v18;
  -[BuddyProximityAppleIDSignInTask _createAccountWithCompletion:](v6, "_createAccountWithCompletion:", &v7);
  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (void)_createAccountWithCompletion:(id)a3
{
  SASProximitySession *v3;
  uint64_t v4;
  NSString *v5;
  BuddyProximityAppleIDSignInTask *v6;
  void **v7;
  int v8;
  int v9;
  void (*v10)(NSObject *, char, id);
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  int v16;
  char v17;
  id v18;
  char v19;
  id v20;
  os_log_type_t v21;
  os_log_t oslog;
  id v23;
  id v24;
  id location[2];
  BuddyProximityAppleIDSignInTask *v26;
  uint8_t buf[24];

  v26 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v24 = objc_alloc_init((Class)SASProximityCompanionAuthRequestAction);
  v3 = -[BuddyProximityAppleIDSignInTask proximitySession](v26, "proximitySession");
  v23 = -[SASProximitySession sendAction:](v3, "sendAction:", v24);

  if (v23)
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v4);
    v21 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 0;
      v17 = 0;
      if ((_BYIsInternalInstall() & 1) != 0)
      {
        v5 = (NSString *)v23;
      }
      else
      {
        v20 = objc_msgSend(v23, "domain");
        v19 = 1;
        v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v20, objc_msgSend(v23, "code"));
        v18 = v5;
        v17 = 1;
      }
      sub_100039500((uint64_t)buf, (uint64_t)v5);
      _os_log_impl((void *)&_mh_execute_header, oslog, v21, "Failed to get data for companion auth: %{public}@", buf, 0xCu);
      if ((v17 & 1) != 0)

      if ((v19 & 1) != 0)
    }
    objc_storeStrong((id *)&oslog, 0);
    (*((void (**)(id, _QWORD, _QWORD, id))location[0] + 2))(location[0], 0, 0, v23);
    v16 = 1;
  }
  else
  {
    v15 = objc_msgSend(v24, "account");
    v6 = v26;
    v7 = _NSConcreteStackBlock;
    v8 = -1073741824;
    v9 = 0;
    v10 = sub_10014D4E4;
    v11 = &unk_100283728;
    v14 = location[0];
    v12 = v15;
    v13 = v24;
    -[BuddyProximityAppleIDSignInTask _saveAccount:completion:](v6, "_saveAccount:completion:", v15, &v7);
    objc_storeStrong(&v13, 0);
    objc_storeStrong(&v12, 0);
    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v15, 0);
    v16 = 0;
  }
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(location, 0);
}

- (void)_authenticateWithUsername:(id)a3 companionDevice:(id)a4 anisetteDataProvider:(id)a5 completion:(id)a6
{
  BuddyAppleIDSignInTask *v9;
  id v10;
  id v11;
  id v12;
  void **v13;
  int v14;
  int v15;
  void (*v16)(uint64_t, void *, void *);
  void *v17;
  BuddyProximityAppleIDSignInTask *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id location[2];
  BuddyProximityAppleIDSignInTask *v27;

  v27 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v25 = 0;
  objc_storeStrong(&v25, a4);
  v24 = 0;
  objc_storeStrong(&v24, a5);
  v23 = 0;
  objc_storeStrong(&v23, a6);
  v9 = -[BuddyProximityAppleIDSignInTask signInTask](v27, "signInTask");
  v10 = location[0];
  v11 = v25;
  v12 = v24;
  v13 = _NSConcreteStackBlock;
  v14 = -1073741824;
  v15 = 0;
  v16 = sub_10014D8C4;
  v17 = &unk_100283750;
  v18 = v27;
  v19 = location[0];
  v20 = v25;
  v21 = v24;
  v22 = v23;
  -[BuddyAppleIDSignInTask authenticateWithUsername:companionDevice:anisetteDataProvider:completion:](v9, "authenticateWithUsername:companionDevice:anisetteDataProvider:completion:", v10, v11, v12, &v13);

  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong((id *)&v18, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
}

- (void)_saveAccount:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = 0;
  objc_storeStrong(&v10, a4);
  v5 = +[ACAccountStore defaultStore](ACAccountStore, "defaultStore");
  v6 = objc_msgSend(location[0], "accountType");
  v7 = objc_msgSend(v6, "identifier");
  v9 = objc_msgSend(v5, "accountTypeWithAccountTypeIdentifier:", v7);

  objc_msgSend(location[0], "setAccountType:", v9);
  objc_msgSend(location[0], "_setObjectID:", 0);
  objc_msgSend(location[0], "markAllPropertiesDirty");
  v8 = +[ACAccountStore defaultStore](ACAccountStore, "defaultStore");
  objc_msgSend(v8, "saveAccount:withCompletionHandler:", location[0], v10);

  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_navigationController, a3);
}

- (BOOL)ignoreLockAssertErrors
{
  return self->_ignoreLockAssertErrors;
}

- (void)setIgnoreLockAssertErrors:(BOOL)a3
{
  self->_ignoreLockAssertErrors = a3;
}

- (BOOL)makeStoreServiceActive
{
  return self->_makeStoreServiceActive;
}

- (void)setMakeStoreServiceActive:(BOOL)a3
{
  self->_makeStoreServiceActive = a3;
}

- (BOOL)enableFindMy
{
  return self->_enableFindMy;
}

- (void)setEnableFindMy:(BOOL)a3
{
  self->_enableFindMy = a3;
}

- (BOOL)restoreFromBackupMode
{
  return self->_restoreFromBackupMode;
}

- (void)setRestoreFromBackupMode:(BOOL)a3
{
  self->_restoreFromBackupMode = a3;
}

- (CUMessageSession)messageSession
{
  return self->_messageSession;
}

- (void)setMessageSession:(id)a3
{
  objc_storeStrong((id *)&self->_messageSession, a3);
}

- (BuddyFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (BYPasscodeCacheManager)cacheManager
{
  return (BYPasscodeCacheManager *)objc_loadWeakRetained((id *)&self->_cacheManager);
}

- (void)setCacheManager:(id)a3
{
  objc_storeWeak((id *)&self->_cacheManager, a3);
}

- (SASProximitySession)proximitySession
{
  return self->_proximitySession;
}

- (void)setProximitySession:(id)a3
{
  objc_storeStrong((id *)&self->_proximitySession, a3);
}

- (BuddyAppleIDSignInTask)signInTask
{
  return self->_signInTask;
}

- (void)setSignInTask:(id)a3
{
  objc_storeStrong((id *)&self->_signInTask, a3);
}

- (BYAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_signInTask, 0);
  objc_storeStrong((id *)&self->_proximitySession, 0);
  objc_destroyWeak((id *)&self->_cacheManager);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_messageSession, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
}

@end
