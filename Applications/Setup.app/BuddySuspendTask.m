@implementation BuddySuspendTask

- (BuddySuspendTask)init
{
  dispatch_queue_t v2;
  void *v3;
  id v4;
  NSSet *v5;
  id v6;
  void *v7;
  BuddySuspendTask *v8;
  objc_super v10;
  SEL v11;
  id location;

  v11 = a2;
  location = 0;
  v10.receiver = self;
  v10.super_class = (Class)BuddySuspendTask;
  location = -[BuddySuspendTask init](&v10, "init");
  objc_storeStrong(&location, location);
  if (location)
  {
    v2 = dispatch_queue_create("Suspend Task Preheat Queue", 0);
    v3 = (void *)*((_QWORD *)location + 4);
    *((_QWORD *)location + 4) = v2;

    v4 = objc_alloc((Class)ACMonitoredAccountStore);
    v5 = +[NSSet setWithObject:](NSSet, "setWithObject:", ACAccountTypeIdentifieriTunesStore);
    v6 = objc_msgSend(v4, "initWithAccountTypes:delegate:", v5, location);
    v7 = (void *)*((_QWORD *)location + 5);
    *((_QWORD *)location + 5) = v6;

    objc_msgSend(*((id *)location + 5), "registerWithCompletion:", &stru_1002820B0);
  }
  v8 = (BuddySuspendTask *)location;
  objc_storeStrong(&location, 0);
  return v8;
}

+ (BOOL)hasSuspendTaskWithBuddyPreferencesExcludedFromBackup:(id)a3
{
  NSLocale *v3;
  NSString *v4;
  char v5;
  id v6;
  unsigned __int8 v7;
  id v8;
  id v9;
  unsigned __int8 v10;
  id v11;
  BOOL v12;
  id location[3];
  BOOL v15;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = +[NSLocale currentLocale](NSLocale, "currentLocale");
  v4 = -[NSLocale countryCode](v3, "countryCode");
  v5 = !-[NSString isEqualToString:](v4, "isEqualToString:", CFSTR("RU"));

  if ((v5 & 1) != 0)
  {
    v15 = 0;
  }
  else
  {
    v6 = objc_msgSend(location[0], "objectForKey:includeCache:", CFSTR("AppStorePresented"), 0);
    v7 = objc_msgSend(v6, "BOOLValue");

    if ((v7 & 1) != 0)
    {
      v15 = 0;
    }
    else if ((+[BYManagedAppleIDBootstrap isMultiUser](BYManagedAppleIDBootstrap, "isMultiUser") & 1) != 0)
    {
      v15 = 0;
    }
    else
    {
      v8 = +[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection");
      v9 = objc_msgSend(v8, "skipSetupKeys");
      v10 = objc_msgSend(v9, "containsObject:", kMCCCSkipAppStore);

      if ((v10 & 1) != 0)
      {
        v15 = 0;
      }
      else
      {
        v11 = +[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection");
        v12 = objc_msgSend(v11, "effectiveBoolValueForSetting:", MCFeatureAppInstallationAllowed) == 2;

        v15 = !v12;
      }
    }
  }
  objc_storeStrong(location, 0);
  return v15;
}

- (void)preheat
{
  void *v2;
  BuddyMediaServicesBag *v3;
  BuddyMediaServicesBag *v4;
  NSURL *v5;
  BOOL v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  NSObject *v10;
  void **block;
  int v12;
  int v13;
  id (*v14)(uint64_t);
  void *v15;
  BuddySuspendTask *v16;
  uint8_t buf[7];
  os_log_type_t v18;
  os_log_t oslog;
  char v20;
  NSString *v21;
  SEL v22;
  BuddySuspendTask *v23;

  v23 = self;
  v22 = a2;
  v2 = &_dispatch_main_q;
  dispatch_assert_queue_V2((dispatch_queue_t)v2);

  v3 = -[BuddySuspendTask bag](v23, "bag");
  if (!v3)
  {
    v4 = objc_alloc_init(BuddyMediaServicesBag);
    -[BuddySuspendTask setBag:](v23, "setBag:", v4);

  }
  v5 = -[BuddySuspendTask launchURL](v23, "launchURL");
  v20 = 0;
  v6 = 1;
  if (v5)
  {
    v21 = -[BuddySuspendTask message](v23, "message");
    v20 = 1;
    v6 = v21 == 0;
  }
  if ((v20 & 1) != 0)

  if (v6)
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v7);
    v18 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v8 = oslog;
      v9 = v18;
      sub_100038C3C(buf);
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Preheating suspend task...", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  v10 = -[BuddySuspendTask preheatQueue](v23, "preheatQueue");
  block = _NSConcreteStackBlock;
  v12 = -1073741824;
  v13 = 0;
  v14 = sub_1000AD0B8;
  v15 = &unk_100280730;
  v16 = v23;
  dispatch_async(v10, &block);

  objc_storeStrong((id *)&v16, 0);
}

- (void)_attemptPreheat:(unint64_t)a3
{
  OS_dispatch_queue *v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  BuddyMediaServicesBag *v12;
  id v13;
  id v14;
  uint64_t v15;
  NSString *v16;
  void *v17;
  BuddyMediaServicesBag *v18;
  id v19;
  id v20;
  uint64_t v21;
  NSString *v22;
  void *v23;
  NSObject *v24;
  os_log_type_t v25;
  dispatch_time_t v26;
  NSObject *v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t v30[7];
  os_log_type_t v31;
  os_log_t v32;
  void **v33;
  int v34;
  int v35;
  id (*v36)(uint64_t);
  void *v37;
  id v38[2];
  uint8_t v39[15];
  os_log_type_t v40;
  os_log_t v41;
  void **v42;
  int v43;
  int v44;
  id (*v45)(uint64_t);
  void *v46;
  BuddySuspendTask *v47;
  id v48;
  char v49;
  NSString *v50;
  char v51;
  id v52;
  os_log_type_t v53;
  os_log_t v54;
  id v55;
  id v56;
  void **v57;
  int v58;
  int v59;
  id (*v60)(uint64_t);
  void *v61;
  BuddySuspendTask *v62;
  id v63;
  char v64;
  NSString *v65;
  char v66;
  id v67;
  os_log_type_t v68;
  os_log_t v69;
  id obj;
  id v71;
  id v72;
  uint8_t v73[11];
  os_log_type_t v74;
  os_log_t oslog;
  int v76;
  void **block;
  int v78;
  int v79;
  void (*v80)(uint64_t);
  void *v81;
  id v82[3];
  uint64_t v83;
  uint64_t *v84;
  int v85;
  int v86;
  char v87;
  uint64_t v88;
  uint64_t *v89;
  int v90;
  int v91;
  char v92;
  uint8_t buf[15];
  char v94;
  id location;
  void *v96;
  SEL v97;
  BuddySuspendTask *v98;
  uint8_t v99[16];
  uint8_t v100[24];

  v98 = self;
  v97 = a2;
  v96 = (void *)a3;
  v3 = -[BuddySuspendTask preheatQueue](self, "preheatQueue");
  dispatch_assert_queue_V2((dispatch_queue_t)v3);

  if (v96)
  {
    v88 = 0;
    v89 = &v88;
    v90 = 0x20000000;
    v91 = 32;
    v92 = 0;
    v83 = 0;
    v84 = &v83;
    v85 = 0x20000000;
    v86 = 32;
    v87 = 0;
    v7 = &_dispatch_main_q;
    block = _NSConcreteStackBlock;
    v78 = -1073741824;
    v79 = 0;
    v80 = sub_1000ADB48;
    v81 = &unk_1002820D8;
    v82[1] = &v88;
    v82[0] = v98;
    v82[2] = &v83;
    dispatch_sync((dispatch_queue_t)v7, &block);

    if ((v89[3] & 1) != 0 && (v84[3] & 1) != 0)
    {
      v76 = 1;
    }
    else
    {
      oslog = (os_log_t)(id)_BYLoggingFacility(v8);
      v74 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        v9 = oslog;
        v10 = v74;
        sub_100038C3C(v73);
        _os_log_impl((void *)&_mh_execute_header, v9, v10, "Attempting to preheat suspend task...", v73, 2u);
      }
      objc_storeStrong((id *)&oslog, 0);
      v72 = 0;
      if ((v89[3] & 1) == 0)
      {
        v12 = -[BuddySuspendTask bag](v98, "bag");
        v13 = -[BuddyMediaServicesBag getAppStoreURL](v12, "getAppStoreURL");
        obj = v72;
        v14 = objc_msgSend(v13, "valueWithError:", &obj);
        objc_storeStrong(&v72, obj);
        v71 = v14;

        if (!v72 && v71)
        {
          *((_BYTE *)v89 + 24) = 1;
          v17 = &_dispatch_main_q;
          v57 = _NSConcreteStackBlock;
          v58 = -1073741824;
          v59 = 0;
          v60 = sub_1000ADBCC;
          v61 = &unk_100280D00;
          v62 = v98;
          v63 = v71;
          dispatch_async((dispatch_queue_t)v17, &v57);

          objc_storeStrong(&v63, 0);
          objc_storeStrong((id *)&v62, 0);
        }
        else
        {
          v69 = (os_log_t)(id)_BYLoggingFacility(v15);
          v68 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
          {
            v66 = 0;
            v64 = 0;
            if ((_BYIsInternalInstall() & 1) != 0)
            {
              v16 = (NSString *)v72;
            }
            else if (v72)
            {
              v67 = objc_msgSend(v72, "domain");
              v66 = 1;
              v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v67, objc_msgSend(v72, "code"));
              v65 = v16;
              v64 = 1;
            }
            else
            {
              v16 = 0;
            }
            sub_100039500((uint64_t)v100, (uint64_t)v16);
            _os_log_error_impl((void *)&_mh_execute_header, v69, v68, "Failed to fetch suspend task URL: %{public}@", v100, 0xCu);
            if ((v64 & 1) != 0)

            if ((v66 & 1) != 0)
          }
          objc_storeStrong((id *)&v69, 0);
        }
        objc_storeStrong(&v71, 0);
      }
      if ((v89[3] & 1) != 0 && (v84[3] & 1) == 0)
      {
        v18 = -[BuddySuspendTask bag](v98, "bag");
        v19 = -[BuddyMediaServicesBag getAppStoreMessage](v18, "getAppStoreMessage");
        v55 = v72;
        v20 = objc_msgSend(v19, "valueWithError:", &v55);
        objc_storeStrong(&v72, v55);
        v56 = v20;

        if (v72)
        {
          v54 = (os_log_t)(id)_BYLoggingFacility(v21);
          v53 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
          {
            v51 = 0;
            v49 = 0;
            if ((_BYIsInternalInstall() & 1) != 0)
            {
              v22 = (NSString *)v72;
            }
            else if (v72)
            {
              v52 = objc_msgSend(v72, "domain");
              v51 = 1;
              v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v52, objc_msgSend(v72, "code"));
              v50 = v22;
              v49 = 1;
            }
            else
            {
              v22 = 0;
            }
            sub_100039500((uint64_t)v99, (uint64_t)v22);
            _os_log_error_impl((void *)&_mh_execute_header, v54, v53, "Failed to fetch store message: %{public}@", v99, 0xCu);
            if ((v49 & 1) != 0)

            if ((v51 & 1) != 0)
          }
          objc_storeStrong((id *)&v54, 0);
        }
        else
        {
          *((_BYTE *)v84 + 24) = 1;
          v23 = &_dispatch_main_q;
          v42 = _NSConcreteStackBlock;
          v43 = -1073741824;
          v44 = 0;
          v45 = sub_1000ADBF8;
          v46 = &unk_100280D00;
          v47 = v98;
          v48 = v56;
          dispatch_async((dispatch_queue_t)v23, &v42);

          objc_storeStrong(&v48, 0);
          objc_storeStrong((id *)&v47, 0);
        }
        objc_storeStrong(&v56, 0);
      }
      if ((v89[3] & 1) != 0 && (v84[3] & 1) != 0)
      {
        v32 = (os_log_t)(id)_BYLoggingFacility(v11);
        v31 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          v28 = v32;
          v29 = v31;
          sub_100038C3C(v30);
          _os_log_impl((void *)&_mh_execute_header, v28, v29, "Suspend task preheating completed", v30, 2u);
        }
        objc_storeStrong((id *)&v32, 0);
      }
      else
      {
        v41 = (os_log_t)(id)_BYLoggingFacility(v11);
        v40 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          v24 = v41;
          v25 = v40;
          sub_100038C3C(v39);
          _os_log_impl((void *)&_mh_execute_header, v24, v25, "Failed to preheat suspend task, will retry...", v39, 2u);
        }
        objc_storeStrong((id *)&v41, 0);
        v26 = dispatch_time(0, 10000000000);
        v27 = -[BuddySuspendTask preheatQueue](v98, "preheatQueue");
        v33 = _NSConcreteStackBlock;
        v34 = -1073741824;
        v35 = 0;
        v36 = sub_1000ADC24;
        v37 = &unk_100280BA8;
        v38[0] = v98;
        v38[1] = v96;
        dispatch_after(v26, v27, &v33);

        objc_storeStrong(v38, 0);
      }
      objc_storeStrong(&v72, 0);
      v76 = 0;
    }
    objc_storeStrong(v82, 0);
    _Block_object_dispose(&v83, 8);
    _Block_object_dispose(&v88, 8);
  }
  else
  {
    location = (id)_BYLoggingFacility(v4);
    v94 = 16;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
    {
      v5 = location;
      v6 = v94;
      sub_100038C3C(buf);
      _os_log_error_impl((void *)&_mh_execute_header, v5, v6, "No further attempts remaining for preheating suspend task", buf, 2u);
    }
    objc_storeStrong(&location, 0);
  }
}

- (void)accountWasAdded:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  NSObject *v6;
  void **block;
  int v8;
  int v9;
  id (*v10)(uint64_t);
  void *v11;
  BuddySuspendTask *v12;
  uint8_t buf[15];
  os_log_type_t v14;
  id v15;
  id location[2];
  BuddySuspendTask *v17;

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = (id)_BYLoggingFacility(v3);
  v14 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v15;
    v5 = v14;
    sub_100038C3C(buf);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Detected store account addition; attempting to preheat suspend task (if needed)",
      buf,
      2u);
  }
  objc_storeStrong(&v15, 0);
  v6 = -[BuddySuspendTask preheatQueue](v17, "preheatQueue");
  block = _NSConcreteStackBlock;
  v8 = -1073741824;
  v9 = 0;
  v10 = sub_1000ADD88;
  v11 = &unk_100280730;
  v12 = v17;
  dispatch_async(v6, &block);

  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong(location, 0);
}

- (NSURL)launchURL
{
  return self->_launchURL;
}

- (void)setLaunchURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BuddyMediaServicesBag)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
  objc_storeStrong((id *)&self->_bag, a3);
}

- (OS_dispatch_queue)preheatQueue
{
  return self->_preheatQueue;
}

- (void)setPreheatQueue:(id)a3
{
  objc_storeStrong((id *)&self->_preheatQueue, a3);
}

- (ACMonitoredAccountStore)monitoredAccountStore
{
  return self->_monitoredAccountStore;
}

- (void)setMonitoredAccountStore:(id)a3
{
  objc_storeStrong((id *)&self->_monitoredAccountStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitoredAccountStore, 0);
  objc_storeStrong((id *)&self->_preheatQueue, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_launchURL, 0);
}

@end
