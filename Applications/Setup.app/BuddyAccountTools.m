@implementation BuddyAccountTools

+ (id)sharedBuddyAccountTools
{
  BuddyAccountTools *v2;
  void *v3;

  if (!qword_1002EEBC8)
  {
    v2 = objc_alloc_init(BuddyAccountTools);
    v3 = (void *)qword_1002EEBC8;
    qword_1002EEBC8 = (uint64_t)v2;

  }
  return (id)qword_1002EEBC8;
}

- (BuddyAccountTools)init
{
  id v2;
  void *v3;
  dispatch_queue_t v4;
  void *v5;
  dispatch_queue_t v6;
  void *v7;
  BuddyAccountTools *v8;
  objc_super v10;
  SEL v11;
  id location;

  v11 = a2;
  location = 0;
  v10.receiver = self;
  v10.super_class = (Class)BuddyAccountTools;
  location = -[BuddyAccountTools init](&v10, "init");
  objc_storeStrong(&location, location);
  if (location)
  {
    v2 = objc_alloc_init((Class)NSMutableArray);
    v3 = (void *)*((_QWORD *)location + 2);
    *((_QWORD *)location + 2) = v2;

    v4 = dispatch_queue_create("com.apple.purplebuddy.user_information", 0);
    v5 = (void *)*((_QWORD *)location + 3);
    *((_QWORD *)location + 3) = v4;

    v6 = dispatch_queue_create("com.apple.purplebuddy.configuration_info", 0);
    v7 = (void *)*((_QWORD *)location + 5);
    *((_QWORD *)location + 5) = v6;

  }
  v8 = (BuddyAccountTools *)location;
  objc_storeStrong(&location, 0);
  return v8;
}

- (id)accountOperationsQueue
{
  OS_dispatch_queue *v2;
  OS_dispatch_queue *accountOperationsQueue;

  if (!self->_accountOperationsQueue)
  {
    v2 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.purplebuddy.account_operation", 0);
    accountOperationsQueue = self->_accountOperationsQueue;
    self->_accountOperationsQueue = v2;

  }
  return self->_accountOperationsQueue;
}

- (void)waitUntilSafeToSignInWithCompletion:(id)a3
{
  NSObject *v3;
  id location[2];
  BuddyAccountTools *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyAccountTools accountOperationsQueue](v5, "accountOperationsQueue");
  dispatch_async(v3, location[0]);

  objc_storeStrong(location, 0);
}

- (void)removeAccount:(id)a3 completion:(id)a4
{
  uint64_t v5;
  NSObject *v6;
  void **block;
  int v8;
  int v9;
  void (*v10)(id *);
  void *v11;
  BuddyAccountTools *v12;
  id v13;
  id v14;
  os_log_type_t v15;
  os_log_t oslog;
  id v17;
  id location[2];
  BuddyAccountTools *v19;
  uint8_t buf[24];

  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = 0;
  objc_storeStrong(&v17, a4);
  oslog = (os_log_t)(id)_BYLoggingFacility(v5);
  v15 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100038C28((uint64_t)buf, (uint64_t)location[0]);
    _os_log_impl((void *)&_mh_execute_header, oslog, v15, "Remove Account: %@", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  if (location[0])
  {
    -[NSMutableArray addObject:](v19->_accountsBeingRemoved, "addObject:", location[0]);
    v6 = -[BuddyAccountTools accountOperationsQueue](v19, "accountOperationsQueue");
    block = _NSConcreteStackBlock;
    v8 = -1073741824;
    v9 = 0;
    v10 = sub_10018A280;
    v11 = &unk_100281168;
    v12 = v19;
    v13 = location[0];
    v14 = v17;
    dispatch_async(v6, &block);

    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v13, 0);
    objc_storeStrong((id *)&v12, 0);
  }
  else if (v17)
  {
    (*((void (**)(id, uint64_t, _QWORD))v17 + 2))(v17, 1, 0);
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

- (void)removeIDMSAccount:(id)a3
{
  id v3;
  NSPredicate *v4;
  id v5;
  BuddyAccountTools *v6;
  void **v7;
  int v8;
  int v9;
  void (*v10)(NSObject *, char, id);
  void *v11;
  id v12;
  id v13;
  id location[2];
  BuddyAccountTools *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyAccountTools accounts](v15, "accounts");
  v4 = +[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &stru_100283F30);
  v5 = objc_msgSend(v3, "filteredArrayUsingPredicate:", v4);
  v13 = objc_msgSend(v5, "firstObject");

  v6 = v15;
  v7 = _NSConcreteStackBlock;
  v8 = -1073741824;
  v9 = 0;
  v10 = sub_10018A9CC;
  v11 = &unk_100280690;
  v12 = location[0];
  -[BuddyAccountTools removeAccount:completion:](v6, "removeAccount:completion:", v13, &v7);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (void)removePrimaryAccountCompletion:(id)a3
{
  BuddyAccountTools *v3;
  id v4;
  id v5;
  void **v6;
  int v7;
  int v8;
  void (*v9)(uint64_t, char, id);
  void *v10;
  id v11;
  id location[2];
  BuddyAccountTools *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v13;
  v4 = +[ACAccountStore defaultStore](ACAccountStore, "defaultStore");
  v5 = objc_msgSend(v4, "aa_primaryAppleAccount");
  v6 = _NSConcreteStackBlock;
  v7 = -1073741824;
  v8 = 0;
  v9 = sub_10018ABB0;
  v10 = &unk_100280690;
  v11 = location[0];
  -[BuddyAccountTools removeAccount:completion:](v3, "removeAccount:completion:", v5, &v6);

  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

- (void)removeAccountsCreatedByProximityWithCompletion:(id)a3
{
  BuddyAccountTools *v3;
  void **v4;
  int v5;
  int v6;
  void (*v7)(uint64_t, char, id);
  void *v8;
  id v9;
  id v10;
  id from;
  id location[2];
  BuddyAccountTools *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_initWeak(&from, v13);
  v3 = v13;
  v4 = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_10018ADE0;
  v8 = &unk_100283F58;
  v9 = location[0];
  objc_copyWeak(&v10, &from);
  -[BuddyAccountTools removePrimaryAccountCompletion:](v3, "removePrimaryAccountCompletion:", &v4);
  objc_destroyWeak(&v10);
  objc_storeStrong(&v9, 0);
  objc_destroyWeak(&from);
  objc_storeStrong(location, 0);
}

- (id)primaryAccount
{
  id v2;
  NSMutableArray *accountsBeingRemoved;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t buf[7];
  os_log_type_t v9;
  os_log_t oslog;
  void **v11;
  int v12;
  int v13;
  uint64_t (*v14)(id *, void *);
  void *v15;
  id v16;
  id v17;
  id location[2];
  BuddyAccountTools *v19;
  id v20;

  v19 = self;
  location[1] = (id)a2;
  v2 = +[ACAccountStore defaultStore](ACAccountStore, "defaultStore");
  location[0] = objc_msgSend(v2, "aa_primaryAppleAccount");

  v17 = 0;
  accountsBeingRemoved = v19->_accountsBeingRemoved;
  v11 = _NSConcreteStackBlock;
  v12 = -1073741824;
  v13 = 0;
  v14 = sub_10018B010;
  v15 = &unk_100283F80;
  v16 = location[0];
  v4 = -[NSMutableArray indexOfObjectPassingTest:](accountsBeingRemoved, "indexOfObjectPassingTest:", &v11);
  v17 = v4;
  if (v4 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v20 = location[0];
  }
  else
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v4);
    v9 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v5 = oslog;
      v6 = v9;
      sub_100038C3C(buf);
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Primary account is being removed", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    v20 = 0;
  }
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  return v20;
}

- (id)activeiTunesAccount
{
  id v2;
  NSPredicate *v3;
  id v4;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  v2 = -[BuddyAccountTools accounts](self, "accounts");
  v3 = +[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &stru_100283FA0);
  location[0] = objc_msgSend(v2, "filteredArrayUsingPredicate:", v3);

  v4 = objc_msgSend(location[0], "firstObject");
  objc_storeStrong(location, 0);
  return v4;
}

- (id)accounts
{
  id v2;
  id v3;
  NSObject *v4;
  void **block;
  int v7;
  int v8;
  void (*v9)(uint64_t);
  void *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  int v14;
  int v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  id location[2];
  BuddyAccountTools *v20;
  id v21;

  v20 = self;
  location[1] = (id)a2;
  if (-[NSMutableArray count](self->_accountsBeingRemoved, "count"))
  {
    v2 = +[ACAccountStore defaultStore](ACAccountStore, "defaultStore");
    v3 = objc_msgSend(v2, "accounts");
    location[0] = objc_msgSend(v3, "mutableCopy");

    objc_msgSend(location[0], "removeObjectsInArray:", v20->_accountsBeingRemoved);
    v21 = location[0];
    objc_storeStrong(location, 0);
  }
  else
  {
    v12 = 0;
    v13 = &v12;
    v14 = 838860800;
    v15 = 48;
    v16 = sub_10018B42C;
    v17 = sub_10018B45C;
    v18 = 0;
    v4 = -[BuddyAccountTools accountOperationsQueue](v20, "accountOperationsQueue");
    block = _NSConcreteStackBlock;
    v7 = -1073741824;
    v8 = 0;
    v9 = sub_10018B468;
    v10 = &unk_100280C58;
    v11 = &v12;
    dispatch_sync(v4, &block);

    v21 = (id)v13[5];
    _Block_object_dispose(&v12, 8);
    objc_storeStrong(&v18, 0);
  }
  return v21;
}

- (void)addAccountHeadersToRequest:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  NSLocale *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id location[3];
  id v14;
  id v15;

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = location[0];
  v4 = sub_10012A1B8();
  objc_msgSend(v3, "setValue:forHTTPHeaderField:", v4, CFSTR("User-Agent"));

  v5 = location[0];
  v6 = +[AADeviceInfo clientInfoHeader](AADeviceInfo, "clientInfoHeader");
  objc_msgSend(v5, "setValue:forHTTPHeaderField:", v6, CFSTR("X-MMe-Client-Info"));

  v7 = location[0];
  v8 = +[NSLocale currentLocale](NSLocale, "currentLocale");
  v9 = -[NSLocale objectForKey:](v8, "objectForKey:", NSLocaleCountryCode);
  v10 = objc_msgSend(v9, "uppercaseString");
  objc_msgSend(v7, "setValue:forHTTPHeaderField:", v10, CFSTR("X-MMe-Country"));

  v15 = (id)_CFNetworkCopyPreferredLanguageCode();
  v12 = v15;
  if (v12)
  {
    if ((objc_msgSend(v12, "hasPrefix:", CFSTR("es-")) & 1) != 0)
    {
      v14 = (id)CFPreferencesCopyAppValue(CFSTR("AppleLocale"), kCFPreferencesAnyApplication);
      v11 = v14;
      if ((objc_msgSend(CFSTR("es_MX"), "isEqual:", v11) & 1) != 0)
        objc_storeStrong(&v12, CFSTR("es-mx"));
      objc_storeStrong(&v11, 0);
    }
  }
  else
  {
    objc_storeStrong(&v12, CFSTR("en-us"));
  }
  objc_msgSend(location[0], "setValue:forHTTPHeaderField:", v12, CFSTR("Accept-Language"));
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (void)primaryAccountIsChildAccount:(id)a3
{
  BuddyAccountTools *v3;
  void **v4;
  int v5;
  int v6;
  void (*v7)(uint64_t, char, id, void *);
  void *v8;
  id v9;
  id location[2];
  BuddyAccountTools *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v11;
  v4 = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_10018B794;
  v8 = &unk_100283FC8;
  v9 = location[0];
  -[BuddyAccountTools _fetchUserInformation:](v3, "_fetchUserInformation:", &v4);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (id)configurationInfoError:(id *)a3
{
  id v3;
  NSObject *configurationInfoQueue;
  id v5;
  id v6;
  void **block;
  int v9;
  int v10;
  void (*v11);
  void *v12;
  BuddyAccountTools *v13;
  id v14[3];
  id location;
  id v16;
  uint64_t v17;
  uint64_t *v18;
  int v19;
  int v20;
  void (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  int v26;
  int v27;
  void (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  id *v31;
  SEL v32;
  BuddyAccountTools *v33;

  v33 = self;
  v32 = a2;
  v31 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 838860800;
  v27 = 48;
  v28 = sub_10018B42C;
  v29 = sub_10018B45C;
  v30 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 838860800;
  v20 = 48;
  v21 = sub_10018B42C;
  v22 = sub_10018B45C;
  v23 = 0;
  v3 = +[ACAccountStore defaultStore](ACAccountStore, "defaultStore");
  v16 = objc_msgSend(v3, "aa_primaryAppleAccount");

  location = objc_msgSend(v16, "aa_altDSID");
  if (v16)
  {
    configurationInfoQueue = v33->_configurationInfoQueue;
    block = _NSConcreteStackBlock;
    v9 = -1073741824;
    v10 = 0;
    v11 = sub_10018BC10;
    v12 = &unk_100284018;
    v13 = v33;
    v14[0] = location;
    v14[1] = &v17;
    v14[2] = &v24;
    dispatch_sync(configurationInfoQueue, &block);
    objc_storeStrong(v14, 0);
    objc_storeStrong((id *)&v13, 0);
  }
  if (v18[5] && v31)
  {
    v5 = objc_retainAutorelease((id)v18[5]);
    *v31 = v5;
  }
  v6 = (id)v25[5];
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v16, 0);
  _Block_object_dispose(&v17, 8);
  objc_storeStrong(&v23, 0);
  _Block_object_dispose(&v24, 8);
  objc_storeStrong(&v30, 0);
  return v6;
}

- (void)getConfigurationInfoWithCompletion:(id)a3
{
  NSObject *v3;
  void **block;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  BuddyAccountTools *v9;
  id v10;
  id location[2];
  BuddyAccountTools *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = dispatch_get_global_queue(0, 0);
  block = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_10018C294;
  v8 = &unk_1002806E0;
  v9 = v12;
  v10 = location[0];
  dispatch_async(v3, &block);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (id)iCloudAnalyticsOptInError:(id *)a3
{
  id v3;
  id v4;
  uint64_t v5;
  char isKindOfClass;
  char v7;
  id v8;
  uint64_t v9;
  NSNumber *v10;
  id v11;
  NSError *v12;
  id v13;
  id v14;
  os_log_t oslog;
  id v17;
  id obj;
  id v19;
  id location;
  id v21;
  id *v22;
  SEL v23;
  BuddyAccountTools *v24;
  uint8_t buf[24];

  v24 = self;
  v23 = a2;
  v22 = a3;
  v21 = 0;
  location = 0;
  obj = 0;
  v3 = -[BuddyAccountTools configurationInfoError:](self, "configurationInfoError:", &obj);
  objc_storeStrong(&location, obj);
  v19 = v3;
  if (!location)
  {
    v17 = objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("com.apple.idms.config.privacy.icloud.data"));
    oslog = (os_log_t)(id)_BYLoggingFacility(v17);
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_100038C28((uint64_t)buf, (uint64_t)v17);
      _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Express Setup: iCloudAnalyticsOptIn = %@", buf, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    if (v17)
    {
      v4 = v17;
      v5 = objc_opt_class(NSNumber);
      isKindOfClass = objc_opt_isKindOfClass(v4, v5);
      v7 = 1;
      if ((isKindOfClass & 1) == 0)
      {
        v8 = v17;
        v9 = objc_opt_class(NSString);
        v7 = objc_opt_isKindOfClass(v8, v9);
      }
      if ((v7 & 1) != 0)
      {
        v10 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v17, "integerValue"));
        v11 = v21;
        v21 = v10;
      }
      else
      {
        v12 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.purplebuddy.accounterror"), 1, 0);
        v11 = location;
        location = v12;
      }

    }
    objc_storeStrong(&v17, 0);
  }
  if (v22)
  {
    v13 = objc_retainAutorelease(location);
    *v22 = v13;
  }
  v14 = v21;
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v21, 0);
  return v14;
}

- (void)_fetchUserInformation:(id)a3
{
  NSObject *userInformationQueue;
  id v4;
  void **v5;
  int v6;
  int v7;
  void (*v8)(id *, void *, void *);
  void *v9;
  BuddyAccountTools *v10;
  id v11;
  int v12;
  void **block;
  int v14;
  int v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18[2];
  uint64_t v19;
  uint64_t *v20;
  int v21;
  int v22;
  void (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  id location[2];
  BuddyAccountTools *v27;

  v27 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v19 = 0;
  v20 = &v19;
  v21 = 838860800;
  v22 = 48;
  v23 = sub_10018B42C;
  v24 = sub_10018B45C;
  v25 = 0;
  userInformationQueue = v27->_userInformationQueue;
  block = _NSConcreteStackBlock;
  v14 = -1073741824;
  v15 = 0;
  v16 = sub_10018C8A0;
  v17 = &unk_100281780;
  v18[1] = &v19;
  v18[0] = v27;
  dispatch_sync(userInformationQueue, &block);
  if (v20[5])
  {
    if (location[0])
      (*((void (**)(id, uint64_t, uint64_t, _QWORD))location[0] + 2))(location[0], 1, v20[5], 0);
    v12 = 1;
  }
  else
  {
    v4 = +[ACAccountStore defaultStore](ACAccountStore, "defaultStore");
    v5 = _NSConcreteStackBlock;
    v6 = -1073741824;
    v7 = 0;
    v8 = sub_10018C8D8;
    v9 = &unk_100284068;
    v11 = location[0];
    v10 = v27;
    objc_msgSend(v4, "aa_primaryAppleAccountWithCompletion:", &v5);

    objc_storeStrong((id *)&v10, 0);
    objc_storeStrong(&v11, 0);
    v12 = 0;
  }
  objc_storeStrong(v18, 0);
  _Block_object_dispose(&v19, 8);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationInfo, 0);
  objc_storeStrong((id *)&self->_configurationInfoQueue, 0);
  objc_storeStrong((id *)&self->_userInformation, 0);
  objc_storeStrong((id *)&self->_userInformationQueue, 0);
  objc_storeStrong((id *)&self->_accountsBeingRemoved, 0);
  objc_storeStrong((id *)&self->_accountOperationsQueue, 0);
}

@end
