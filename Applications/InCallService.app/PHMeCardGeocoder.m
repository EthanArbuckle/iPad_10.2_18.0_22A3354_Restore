@implementation PHMeCardGeocoder

- (PHMeCardGeocoder)initWithCall:(id)a3
{
  id v4;
  PHMeCardGeocoder *v5;
  void *v6;
  CNContactStore *v7;
  CNContactStore *contactStore;
  dispatch_queue_t v9;
  OS_dispatch_queue *workQueue;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  NSSet *v15;
  void *v16;
  uint64_t v17;
  NSMutableArray *v18;
  NSMutableArray *addresses;
  NSMutableArray *v20;
  id v21;
  NSObject *v22;
  _BOOL4 v23;
  NSMutableArray *v24;
  const char *v25;
  id v26;
  NSObject *v27;
  PHMeCardGeocoder *v28;
  void *v29;
  _QWORD block[4];
  PHMeCardGeocoder *v32;
  id v33;
  id v34;
  objc_super v35;
  uint8_t buf[4];
  NSMutableArray *v37;

  v4 = a3;
  if ((+[EKAlarm areLocationsAvailable](EKAlarm, "areLocationsAvailable") & 1) != 0)
  {
    v35.receiver = self;
    v35.super_class = (Class)PHMeCardGeocoder;
    v5 = -[PHMeCardGeocoder init](&v35, "init");
    if (!v5)
    {
LABEL_15:
      self = v5;
      v28 = self;
      goto LABEL_16;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactStoreConfiguration tu_contactStoreConfigurationForCall:](CNContactStoreConfiguration, "tu_contactStoreConfigurationForCall:", v4));
    v7 = (CNContactStore *)objc_msgSend(objc_alloc((Class)CNContactStore), "initWithConfiguration:", v6);
    contactStore = v5->_contactStore;
    v5->_contactStore = v7;

    v9 = dispatch_queue_create("MPTelephonyManager.MeCardCacheQueue", 0);
    workQueue = v5->_workQueue;
    v5->_workQueue = (OS_dispatch_queue *)v9;

    v12 = objc_msgSend(objc_alloc((Class)NSData), "initWithContentsOfFile:", CFSTR("/var/mobile/Library/Phone/MeCard.geocache"));
    if (!v12)
    {
LABEL_14:
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v29, "addObserver:selector:name:object:", v5, "handleCNContactStoreDidChangeNotification:", CNContactStoreDidChangeNotification, 0);
      objc_initWeak((id *)buf, v5);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10008AF08;
      block[3] = &unk_100285028;
      objc_copyWeak(&v33, (id *)buf);
      v32 = v5;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

      objc_destroyWeak(&v33);
      objc_destroyWeak((id *)buf);

      goto LABEL_15;
    }
    v13 = objc_opt_class(NSArray, v11);
    v15 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v13, objc_opt_class(_PHMeCardGeocoderAddress, v14), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v34 = 0;
    v17 = objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v16, v12, &v34));
    v18 = (NSMutableArray *)v34;
    addresses = v5->_addresses;
    v5->_addresses = (NSMutableArray *)v17;

    v20 = v5->_addresses;
    v21 = sub_1000C5588();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
    if (v20)
    {
      if (v23)
      {
        v24 = v5->_addresses;
        *(_DWORD *)buf = 138412290;
        v37 = v24;
        v25 = "Unarchived addresses: %@";
LABEL_12:
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, v25, buf, 0xCu);
      }
    }
    else if (v23)
    {
      *(_DWORD *)buf = 138412290;
      v37 = v18;
      v25 = "[WARN] Error unarchiving addresses: %@";
      goto LABEL_12;
    }

    goto LABEL_14;
  }
  v26 = sub_1000C5588();
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Device type doesn't allow location-based reminders, so +[PHMeCardGeocoder sharedMeCardGeocoder] will return nil", buf, 2u);
  }

  v28 = 0;
LABEL_16:

  return v28;
}

- (void)_networkPreferencesLoaded
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008B130;
  block[3] = &unk_100284898;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v4;
  NSObject *workQueue;
  objc_super v6;
  _QWORD block[5];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:", self);

  -[PCPersistentTimer invalidate](self->_networkPreferencesTimeoutTimer, "invalidate");
  -[PHMeCardGeocoder _unschedulePerformGeocodesWakeTaskIfEarlierThan:](self, "_unschedulePerformGeocodesWakeTaskIfEarlierThan:", 0);
  -[PHMeCardGeocoder _unscheduleLongTermRebuild](self, "_unscheduleLongTermRebuild");
  workQueue = self->_workQueue;
  if (workQueue)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10008B30C;
    block[3] = &unk_100284898;
    block[4] = self;
    dispatch_sync(workQueue, block);
  }
  v6.receiver = self;
  v6.super_class = (Class)PHMeCardGeocoder;
  -[PHMeCardGeocoder dealloc](&v6, "dealloc");
}

- (BOOL)_isNetworkAvailable
{
  const __SCNetworkReachability *v2;
  const __SCNetworkReachability *v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  SCNetworkReachabilityFlags flags;
  uint8_t buf[4];
  SCNetworkReachabilityFlags v10;
  sockaddr address;

  *(_QWORD *)&address.sa_data[6] = 0;
  *(_QWORD *)&address.sa_len = 528;
  v2 = SCNetworkReachabilityCreateWithAddress(kCFAllocatorDefault, &address);
  if (v2)
  {
    v3 = v2;
    flags = 0;
    if (SCNetworkReachabilityGetFlags(v2, &flags))
    {
      v4 = sub_1000C5588();
      v5 = objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v10 = flags;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Reachability flags: %d", buf, 8u);
      }

      v6 = (flags >> 1) & 1;
    }
    else
    {
      LOBYTE(v6) = 1;
    }
    CFRelease(v3);
  }
  else
  {
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (void)scheduleImmediateGeocode
{
  id v3;
  NSObject *v4;
  unsigned int v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *workQueue;
  _QWORD block[5];
  uint8_t buf[16];

  v3 = sub_1000C5588();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "-scheduleImmediateGeocode", buf, 2u);
  }

  v5 = -[PHMeCardGeocoder _isNetworkAvailable](self, "_isNetworkAvailable");
  v6 = sub_1000C5588();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Network is available...doing work", buf, 2u);
    }

    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10008B630;
    block[3] = &unk_100284898;
    block[4] = self;
    dispatch_async(workQueue, block);
  }
  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Network is not available, deferring work until it is...", buf, 2u);
    }

    -[PHMeCardGeocoder scheduleNextGeocode](self, "scheduleNextGeocode");
  }
}

- (void)scheduleNextGeocode
{
  id v3;
  NSObject *v4;
  NSObject *workQueue;
  _QWORD block[5];
  uint8_t buf[16];

  v3 = sub_1000C5588();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "-scheduleNextGeocode", buf, 2u);
  }

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008B6DC;
  block[3] = &unk_100284898;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)_saveGeoCache
{
  void *v3;
  NSMutableArray *addresses;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  objc_msgSend(v3, "makeDirectoriesInPath:mode:", CFSTR("/var/mobile/Library/Phone/"), 509);

  addresses = self->_addresses;
  v15 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", addresses, 1, &v15));
  v6 = v15;
  if (v5)
  {
    objc_msgSend(v5, "writeToFile:atomically:", CFSTR("/var/mobile/Library/Phone/MeCard.geocache"), 1);
  }
  else
  {
    v7 = sub_1000C5588();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1001A9FEC((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);

  }
}

- (void)_doWork
{
  NSMutableArray *v3;
  id v4;
  id v5;
  char v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  double v11;
  double v12;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  _QWORD v19[5];
  uint8_t buf[16];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  if (!-[PHMeCardGeocoder _isNetworkAvailable](self, "_isNetworkAvailable"))
  {
    v17 = sub_1000C5588();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "No network was availble.  Scheduling wake timer.", buf, 2u);
    }

LABEL_22:
    -[PHMeCardGeocoder _scheduleNextGeocode](self, "_scheduleNextGeocode");
    goto LABEL_24;
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v3 = self->_addresses;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (!v4)
  {

    goto LABEL_24;
  }
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v22;
  do
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      if (*(_QWORD *)v22 != v7)
        objc_enumerationMutation(v3);
      v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
      if (objc_msgSend(v9, "state") == 2
        || (v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "nextGeocodeAttempt")),
            objc_msgSend(v10, "timeIntervalSinceNow"),
            v12 = v11,
            v10,
            v12 > 0.0))
      {
        v13 = sub_1000C5588();
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Deferring geocode...", buf, 2u);
        }

        v6 = 1;
      }
      else
      {
        v15 = sub_1000C5588();
        v16 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Attempting geocode...", buf, 2u);
        }

        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_10008BA2C;
        v19[3] = &unk_100286C50;
        v19[4] = self;
        objc_msgSend(v9, "attemptGeocodeWithCompletionBlock:", v19);
      }
    }
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  }
  while (v5);

  if ((v6 & 1) != 0)
    goto LABEL_22;
LABEL_24:
  -[PHMeCardGeocoder _saveGeoCache](self, "_saveGeoCache");
}

- (BOOL)_unschedulePerformGeocodesWakeTaskIfEarlierThan:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  BOOL v15;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHMeCardGeocoder lastScheduledTime](self, "lastScheduledTime"));

  if (!v5)
  {
    v12 = sub_1000C5588();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "No existing job, so nothing to unschedule", (uint8_t *)&v18, 2u);
    }

    goto LABEL_12;
  }
  if (!v4)
  {
    v14 = sub_1000C5588();
    v9 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Unscheduling previous job since nil date was passed in", (uint8_t *)&v18, 2u);
    }
    goto LABEL_11;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHMeCardGeocoder lastScheduledTime](self, "lastScheduledTime"));
  v7 = objc_msgSend(v6, "compare:", v4);

  v8 = sub_1000C5588();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v7 == (id)1)
  {
    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHMeCardGeocoder lastScheduledTime](self, "lastScheduledTime"));
      v18 = 138412546;
      v19 = v11;
      v20 = 2112;
      v21 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Unscheduling previous job with date %@ since we need to fire at %@ which is earlier", (uint8_t *)&v18, 0x16u);

    }
LABEL_11:

    xpc_activity_unregister("com.apple.MobilePhone.PHMeCardGeocoder.WakeAndDoWork");
LABEL_12:
    -[PHMeCardGeocoder setLastScheduledTime:](self, "setLastScheduledTime:", 0);
    v15 = 1;
    goto LABEL_13;
  }
  if (v10)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHMeCardGeocoder lastScheduledTime](self, "lastScheduledTime"));
    v18 = 138412546;
    v19 = v17;
    v20 = 2112;
    v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Won't unschedule previous job with date %@ since we need to fire at %@ which is later", (uint8_t *)&v18, 0x16u);

  }
  v15 = 0;
LABEL_13:

  return v15;
}

- (void)_schedulePerformGeocodesTaskWithStartWakeTime:(id)a3 dropDeadDelay:(int64_t)a4
{
  id v6;
  xpc_object_t v7;
  double v8;
  double v9;
  id v10;
  NSObject *v11;
  _QWORD handler[5];
  uint8_t buf[4];
  const char *v14;

  v6 = a3;
  -[PHMeCardGeocoder setLastScheduledTime:](self, "setLastScheduledTime:", v6);
  v7 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v7, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, 1);
  objc_msgSend(v6, "timeIntervalSinceNow");
  v9 = v8;

  xpc_dictionary_set_int64(v7, XPC_ACTIVITY_DELAY, (uint64_t)v9);
  xpc_dictionary_set_int64(v7, XPC_ACTIVITY_GRACE_PERIOD, a4);
  v10 = sub_1000C5588();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "com.apple.MobilePhone.PHMeCardGeocoder.WakeAndDoWork";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Got background task agent callback for job: %s", buf, 0xCu);
  }

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10008BF14;
  handler[3] = &unk_100286C78;
  handler[4] = self;
  xpc_activity_register("com.apple.MobilePhone.PHMeCardGeocoder.WakeAndDoWork", v7, handler);

}

- (void)_scheduleNextGeocode
{
  NSMutableArray *v3;
  id v4;
  id v5;
  char v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  uint64_t v33;
  _BYTE v34[128];

  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v3 = self->_addresses;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (!v4)
  {

LABEL_22:
    -[PHMeCardGeocoder _unschedulePerformGeocodesWakeTaskIfEarlierThan:](self, "_unschedulePerformGeocodesWakeTaskIfEarlierThan:", 0, (_QWORD)v26);
    v7 = 0;
    goto LABEL_32;
  }
  v5 = v4;
  v6 = 0;
  v7 = 0;
  v8 = *(_QWORD *)v27;
  do
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      if (*(_QWORD *)v27 != v8)
        objc_enumerationMutation(v3);
      v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
      v11 = objc_msgSend(v10, "checkGeocodeAfterDateForSanity", (_QWORD)v26);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "nextGeocodeAttempt"));
      v13 = v12;
      if (v12)
      {
        if (v7)
        {
          v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "earlierDate:", v12));

          v7 = (id)v14;
        }
        else
        {
          v7 = v12;
        }
      }
      v6 |= v11;

    }
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  }
  while (v5);

  if ((v6 & 1) != 0)
  {
    v15 = sub_1000C5588();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Updated geocode-after date on one or more addresses, saving", buf, 2u);
    }

    -[PHMeCardGeocoder _saveGeoCache](self, "_saveGeoCache");
  }
  if (!v7)
    goto LABEL_22;
  v17 = sub_1000C5588();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "timeIntervalSinceNow");
    *(_DWORD *)buf = 138412546;
    v31 = v7;
    v32 = 2048;
    v33 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Next wake time %@ has time interval since now: %f", buf, 0x16u);
  }

  objc_msgSend(v7, "timeIntervalSinceNow");
  if (v20 <= 3600.0)
  {
    objc_msgSend(v7, "timeIntervalSinceNow");
    if (v22 <= 0.0)
    {
      if (-[PHMeCardGeocoder _isNetworkAvailable](self, "_isNetworkAvailable"))
      {
        v23 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));

        v21 = 1800;
        v7 = (id)v23;
      }
      else
      {
        v21 = 21600;
      }
    }
    else
    {
      v21 = 300;
    }
  }
  else
  {
    v21 = 3600;
  }
  v24 = sub_1000C5588();
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v31 = v7;
    v32 = 2048;
    v33 = v21;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Scheduling next wake time between %@ and %lld seconds laster", buf, 0x16u);
  }

  if (-[PHMeCardGeocoder _unschedulePerformGeocodesWakeTaskIfEarlierThan:](self, "_unschedulePerformGeocodesWakeTaskIfEarlierThan:", v7))
  {
    -[PHMeCardGeocoder _schedulePerformGeocodesTaskWithStartWakeTime:dropDeadDelay:](self, "_schedulePerformGeocodesTaskWithStartWakeTime:dropDeadDelay:", v7, v21);
  }
LABEL_32:

}

- (void)_unscheduleLongTermRebuild
{
  xpc_activity_unregister("com.apple.MobilePhone.PHMeCardGeocoder.RebuildEverything");
}

- (id)_dateOfOldestAddress
{
  NSMutableArray *v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = self->_addresses;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (!v3)
  {

LABEL_14:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date", (_QWORD)v12));
    return v5;
  }
  v4 = v3;
  v5 = 0;
  v6 = *(_QWORD *)v13;
  do
  {
    for (i = 0; i != v4; i = (char *)i + 1)
    {
      if (*(_QWORD *)v13 != v6)
        objc_enumerationMutation(v2);
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), "lastGeocodeAttempt", (_QWORD)v12));
      v9 = v8;
      if (v5)
      {
        v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "earlierDate:", v5));

        v5 = (void *)v10;
      }
      else
      {
        v5 = v8;
      }
    }
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  }
  while (v4);

  if (!v5)
    goto LABEL_14;
  return v5;
}

- (void)_scheduleLongTermRebuild
{
  xpc_object_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  id v9;
  NSObject *v10;
  _QWORD handler[5];
  uint8_t buf[4];
  void *v13;

  -[PHMeCardGeocoder _unscheduleLongTermRebuild](self, "_unscheduleLongTermRebuild");
  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHMeCardGeocoder _dateOfOldestAddress](self, "_dateOfOldestAddress"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dateByAddingTimeInterval:", 2592000.0));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  if (objc_msgSend(v5, "compare:", v6) == (id)-1)
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateByAddingTimeInterval:", 86400.0));

    v5 = (void *)v7;
  }
  objc_msgSend(v5, "timeIntervalSinceNow");
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_DELAY, (uint64_t)v8);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_GRACE_PERIOD, 147600);
  v9 = sub_1000C5588();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Scheduling a wake-and-rebuild for at %@ with a one day grace period", buf, 0xCu);
  }

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10008C624;
  handler[3] = &unk_100286C78;
  handler[4] = self;
  xpc_activity_register("com.apple.MobilePhone.PHMeCardGeocoder.RebuildEverything", v3, handler);

}

- (void)_rebuildAddressArray
{
  id v3;
  NSObject *v4;
  NSMutableArray *v5;
  NSMutableArray *addresses;
  void *v7;
  void *v8;
  void *v9;
  _PHMeCardGeocoderAddress *v10;
  id v11;
  id v12;
  _BOOL4 v13;
  uint64_t *v14;
  void *v15;
  _PHMeCardGeocoderAddress *v16;
  id v17;
  NSObject *v18;
  void *v19;
  NSMutableArray *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  _PHMeCardGeocoderAddress *v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned int v29;
  id v30;
  NSObject *v31;
  uint64_t v32;
  _PHMeCardGeocoderAddress *v33;
  _PHMeCardGeocoderAddress *v34;
  id v35;
  NSObject *v36;
  id v37;
  NSObject *v38;
  id v39;
  _PHMeCardGeocoderAddress *v40;
  id v41;
  NSObject *v42;
  _PHMeCardGeocoderAddress *v43;
  id v44;
  id v45;
  uint64_t v46;
  void *i;
  id v48;
  _PHMeCardGeocoderAddress *v49;
  NSObject *obj;
  _PHMeCardGeocoderAddress *v51;
  PHMeCardGeocoder *v52;
  uint64_t v53;
  id v54;
  void *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  id v68;
  _BYTE v69[128];
  _BYTE v70[128];
  uint8_t v71[128];
  uint8_t buf[4];
  _PHMeCardGeocoderAddress *v73;
  _QWORD v74[3];

  v3 = sub_1000C5588();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Rebuilding me card cache...", buf, 2u);
  }

  if (!self->_addresses)
  {
    v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    addresses = self->_addresses;
    self->_addresses = v5;

  }
  v49 = (_PHMeCardGeocoderAddress *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithArray:", self->_addresses);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHMeCardGeocoder contactStore](self, "contactStore"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactFormatter descriptorForRequiredKeysForStyle:](CNContactFormatter, "descriptorForRequiredKeysForStyle:", 0));
  v74[0] = v8;
  v74[1] = CNContactPostalAddressesKey;
  v74[2] = CNContactTypeKey;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v74, 3));
  v68 = 0;
  v10 = (_PHMeCardGeocoderAddress *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_ios_meContactWithKeysToFetch:error:", v9, &v68));
  v11 = v68;

  v12 = sub_1000C5588();
  obj = objc_claimAutoreleasedReturnValue(v12);
  v13 = os_log_type_enabled(obj, OS_LOG_TYPE_DEFAULT);
  v14 = &qword_10023F000;
  v51 = v10;
  if (v10)
  {
    if (v13)
    {
      *(_DWORD *)buf = 138412290;
      v73 = v10;
      _os_log_impl((void *)&_mh_execute_header, obj, OS_LOG_TYPE_DEFAULT, "Found Me contact card %@.", buf, 0xCu);
    }

    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    obj = objc_claimAutoreleasedReturnValue(-[_PHMeCardGeocoderAddress postalAddresses](v10, "postalAddresses"));
    v54 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v64, v71, 16);
    if (v54)
    {
      v48 = v11;
      v53 = *(_QWORD *)v65;
      v52 = self;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v65 != v53)
            objc_enumerationMutation(obj);
          v16 = *(_PHMeCardGeocoderAddress **)(*((_QWORD *)&v64 + 1) + 8 * (_QWORD)v15);
          v17 = sub_1000C5588();
          v18 = objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v73 = v16;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Considering postal address labeled value %@.", buf, 0xCu);
          }

          v19 = (void *)objc_claimAutoreleasedReturnValue(-[_PHMeCardGeocoderAddress label](v16, "label"));
          if ((objc_msgSend(v19, "isEqualToString:", CNLabelHome) & 1) != 0
            || objc_msgSend(v19, "isEqualToString:", CNLabelWork))
          {
            v55 = v19;
            v62 = 0u;
            v63 = 0u;
            v60 = 0u;
            v61 = 0u;
            v20 = self->_addresses;
            v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
            if (v21)
            {
              v22 = v21;
              v23 = *(_QWORD *)v61;
LABEL_19:
              v24 = 0;
              while (1)
              {
                if (*(_QWORD *)v61 != v23)
                  objc_enumerationMutation(v20);
                v25 = *(_PHMeCardGeocoderAddress **)(*((_QWORD *)&v60 + 1) + 8 * v24);
                v26 = (void *)objc_claimAutoreleasedReturnValue(-[_PHMeCardGeocoderAddress labeledValue](v25, "labeledValue", v48));
                v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "value"));

                v28 = (void *)objc_claimAutoreleasedReturnValue(-[_PHMeCardGeocoderAddress value](v16, "value"));
                v29 = objc_msgSend(v27, "isEqual:", v28);

                if (v29)
                  break;

                if (v22 == (id)++v24)
                {
                  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
                  if (v22)
                    goto LABEL_19;
                  goto LABEL_30;
                }
              }
              if (-[_PHMeCardGeocoderAddress expired](v25, "expired"))
              {
                v30 = sub_1000C5588();
                v31 = objc_claimAutoreleasedReturnValue(v30);
                if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v73 = v25;
                  _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Existing address is expired, ignoring: %@", buf, 0xCu);
                }

                goto LABEL_30;
              }
              v33 = v25;

              if (!v33)
                goto LABEL_31;
              v37 = sub_1000C5588();
              v38 = objc_claimAutoreleasedReturnValue(v37);
              v19 = v55;
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v73 = v33;
                _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Found existing address, repurposing: %@", buf, 0xCu);
              }

              -[_PHMeCardGeocoderAddress removeObject:](v49, "removeObject:", v33);
              self = v52;
            }
            else
            {
LABEL_30:

LABEL_31:
              v19 = v55;
              v32 = EKUILabeledDisplayStringForContact(v51, v55);
              v33 = (_PHMeCardGeocoderAddress *)objc_claimAutoreleasedReturnValue(v32);
              v34 = -[_PHMeCardGeocoderAddress initWithLabeledValue:entityID:]([_PHMeCardGeocoderAddress alloc], "initWithLabeledValue:entityID:", v16, v33);
              v35 = sub_1000C5588();
              v36 = objc_claimAutoreleasedReturnValue(v35);
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v73 = v34;
                _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Totally new address encountered, adding: %@", buf, 0xCu);
              }

              self = v52;
              -[NSMutableArray addObject:](v52->_addresses, "addObject:", v34);

            }
          }

          v15 = (char *)v15 + 1;
        }
        while (v15 != v54);
        v39 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v64, v71, 16);
        v54 = v39;
      }
      while (v39);
      v11 = v48;
      v14 = &qword_10023F000;
    }
  }
  else if (v13)
  {
    v40 = (_PHMeCardGeocoderAddress *)objc_claimAutoreleasedReturnValue(-[PHMeCardGeocoder contactStore](self, "contactStore"));
    *(_DWORD *)buf = 138412290;
    v73 = v40;
    _os_log_impl((void *)&_mh_execute_header, obj, OS_LOG_TYPE_DEFAULT, "Could not retrieve a Me card using contact store %@.", buf, 0xCu);

  }
  v41 = sub_1000C5588();
  v42 = objc_claimAutoreleasedReturnValue(v41);
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = v14[19];
    v73 = v49;
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Removing unused addresses: %@", buf, 0xCu);
  }

  -[NSMutableArray removeObjectsInArray:](self->_addresses, "removeObjectsInArray:", v49);
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v43 = v49;
  v44 = -[_PHMeCardGeocoderAddress countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
  if (v44)
  {
    v45 = v44;
    v46 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v45; i = (char *)i + 1)
      {
        if (*(_QWORD *)v57 != v46)
          objc_enumerationMutation(v43);
        objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)i), "cancelGeocode", v48);
      }
      v45 = -[_PHMeCardGeocoderAddress countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
    }
    while (v45);
  }

  -[PHMeCardGeocoder _doWork](self, "_doWork");
  -[PHMeCardGeocoder _scheduleLongTermRebuild](self, "_scheduleLongTermRebuild");

}

- (NSArray)currentValidLocations
{
  void *v3;
  NSMutableArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_addresses;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v8), "locationDictionary", (_QWORD)v12));
        if (v9)
          objc_msgSend(v3, "addObject:", v9);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v3));
  return (NSArray *)v10;
}

- (BOOL)isActivelyUsing
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[_PHMeCardGeocoderPreferences sharedPreferences](_PHMeCardGeocoderPreferences, "sharedPreferences"));
  v3 = objc_msgSend(v2, "isActivelyUsing");

  return v3;
}

- (void)setActivelyUsing:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *workQueue;
  _QWORD block[5];
  uint8_t buf[16];

  v3 = a3;
  if (-[PHMeCardGeocoder isActivelyUsing](self, "isActivelyUsing") != a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[_PHMeCardGeocoderPreferences sharedPreferences](_PHMeCardGeocoderPreferences, "sharedPreferences"));
    objc_msgSend(v5, "setActivelyUsing:", v3);

    if (v3)
    {
      v6 = sub_1000C5588();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Since we're actively using geocoder, scheduling quicker start times for geocoding", buf, 2u);
      }

      workQueue = self->_workQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10008CFE4;
      block[3] = &unk_100284898;
      block[4] = self;
      dispatch_async(workQueue, block);
    }
  }
}

- (void)handleCNContactStoreDidChangeNotification:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  _QWORD block[5];
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_opt_class(self, v7);
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    *(_DWORD *)buf = 138412546;
    v14 = v8;
    v15 = 2112;
    v16 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", buf, 0x16u);

  }
  v11 = objc_claimAutoreleasedReturnValue(-[PHMeCardGeocoder workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008D298;
  block[3] = &unk_100284898;
  block[4] = self;
  dispatch_async(v11, block);

}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (NSMutableArray)addresses
{
  return self->_addresses;
}

- (void)setAddresses:(id)a3
{
  objc_storeStrong((id *)&self->_addresses, a3);
}

- (PCPersistentTimer)networkPreferencesTimeoutTimer
{
  return self->_networkPreferencesTimeoutTimer;
}

- (NSDate)lastScheduledTime
{
  return self->_lastScheduledTime;
}

- (void)setLastScheduledTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastScheduledTime, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastScheduledTime, 0);
  objc_storeStrong((id *)&self->_networkPreferencesTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_addresses, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
}

@end
