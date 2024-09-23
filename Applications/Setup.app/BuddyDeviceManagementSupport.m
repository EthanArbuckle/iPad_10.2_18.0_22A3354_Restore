@implementation BuddyDeviceManagementSupport

+ (id)sharedSupport
{
  id location;
  dispatch_once_t *v4;

  v4 = (dispatch_once_t *)&unk_1002EEC80;
  location = 0;
  objc_storeStrong(&location, &stru_100284480);
  if (*v4 != -1)
    dispatch_once(v4, location);
  objc_storeStrong(&location, 0);
  return (id)qword_1002EEC78;
}

- (BuddyDeviceManagementSupport)init
{
  BuddyDeviceManagementSupport *v2;
  dispatch_queue_t v3;
  BuddyDeviceManagementProvider *v4;
  BuddyDeviceManagementSupport *v5;
  objc_super v7;
  SEL v8;
  id location;

  v8 = a2;
  location = 0;
  v7.receiver = self;
  v7.super_class = (Class)BuddyDeviceManagementSupport;
  v2 = -[BuddyDeviceManagementSupport init](&v7, "init");
  location = v2;
  objc_storeStrong(&location, v2);
  if (v2)
  {
    v3 = dispatch_queue_create("Skip Keys Queue", 0);
    objc_msgSend(location, "setSkipKeysQueue:", v3);

    v4 = objc_alloc_init(BuddyDeviceManagementProvider);
    objc_msgSend(location, "setDeviceManagementProvider:", v4);

  }
  v5 = (BuddyDeviceManagementSupport *)location;
  objc_storeStrong(&location, 0);
  return v5;
}

- (NSArray)skipKeys
{
  OS_dispatch_queue *v2;
  id v3;
  id v4;
  void **block;
  int v7;
  int v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11[2];
  uint64_t v12;
  uint64_t *v13;
  int v14;
  int v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18[2];
  BuddyDeviceManagementSupport *v19;

  v19 = self;
  v18[1] = (id)a2;
  v12 = 0;
  v13 = &v12;
  v14 = 838860800;
  v15 = 48;
  v16 = sub_1001BDBE4;
  v17 = sub_1001BDC14;
  v18[0] = 0;
  v2 = -[BuddyDeviceManagementSupport skipKeysQueue](self, "skipKeysQueue");
  block = _NSConcreteStackBlock;
  v7 = -1073741824;
  v8 = 0;
  v9 = sub_1001BDC20;
  v10 = &unk_100281780;
  v11[1] = &v12;
  v11[0] = v19;
  dispatch_sync((dispatch_queue_t)v2, &block);

  if (!v13[5])
  {
    v3 = objc_alloc((Class)NSString);
    objc_exception_throw(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("Skip Keys Not Loaded"), objc_msgSend(v3, "initWithFormat:", CFSTR("Skip keys were attempted to be access before they were loaded. didAttemptToFetchSkipKeys: %d. didFetchSkipKeysSuccessfully: %d"), v19->_didAttemptToFetchSkipKeys, v19->_didFetchSkipKeysSuccessfully), 0));
  }
  v4 = (id)v13[5];
  objc_storeStrong(v11, 0);
  _Block_object_dispose(&v12, 8);
  objc_storeStrong(v18, 0);
  return (NSArray *)v4;
}

- (void)loadSkipKeys:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  _WORD v6[7];
  os_log_type_t v7;
  os_log_t oslog;
  id location[2];
  BuddyDeviceManagementSupport *v10;

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
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Loading skip keys", (uint8_t *)v6, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  -[BuddyDeviceManagementSupport _loadSkipKeysWithCurrentTry:completion:](v10, "_loadSkipKeysWithCurrentTry:completion:", 0, location[0]);
  objc_storeStrong(location, 0);
}

- (void)_loadSkipKeysWithCurrentTry:(int)a3 completion:(id)a4
{
  BuddyDeviceManagementSupport *v4;
  void **v5;
  int v6;
  int v7;
  void (*v8)(uint64_t, char);
  void *v9;
  BuddyDeviceManagementSupport *v10;
  id v11;
  id v12;
  id v13;
  int v14;
  id from;
  int v16;
  void **v17;
  int v18;
  int v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  id v22;
  id v23;
  id location;
  int v25;
  SEL v26;
  BuddyDeviceManagementSupport *v27;

  v27 = self;
  v26 = a2;
  v25 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v17 = _NSConcreteStackBlock;
  v18 = -1073741824;
  v19 = 0;
  v20 = sub_1001BDEF0;
  v21 = &unk_100281A80;
  v22 = location;
  v23 = objc_retainBlock(&v17);
  v16 = 2;
  objc_initWeak(&from, v27);
  -[BuddyDeviceManagementSupport setDidAttemptToFetchSkipKeys:](v27, "setDidAttemptToFetchSkipKeys:", 1);
  v4 = v27;
  v5 = _NSConcreteStackBlock;
  v6 = -1073741824;
  v7 = 0;
  v8 = sub_1001BDF30;
  v9 = &unk_1002844D0;
  v14 = v25;
  v10 = v27;
  v11 = v23;
  objc_copyWeak(&v13, &from);
  v12 = location;
  -[BuddyDeviceManagementSupport _loadSkipKeys:](v4, "_loadSkipKeys:", &v5);
  objc_storeStrong(&v12, 0);
  objc_destroyWeak(&v13);
  objc_storeStrong(&v11, 0);
  objc_storeStrong((id *)&v10, 0);
  objc_destroyWeak(&from);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&location, 0);
}

- (void)_loadSkipKeys:(id)a3
{
  BuddyDeviceManagementProvider *v3;
  void **v4;
  int v5;
  int v6;
  void (*v7)(uint64_t, void *);
  void *v8;
  BuddyDeviceManagementSupport *v9;
  id v10;
  id location[2];
  BuddyDeviceManagementSupport *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyDeviceManagementSupport deviceManagementProvider](v12, "deviceManagementProvider");
  v4 = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_1001BE3DC;
  v8 = &unk_1002844F8;
  v9 = v12;
  v10 = location[0];
  -[BuddyDeviceManagementProvider loadSkipKeys:](v3, "loadSkipKeys:", &v4);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)shouldDisallowProximityAdvertisement
{
  OS_dispatch_queue *v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t buf[15];
  os_log_type_t v8;
  os_log_t oslog;
  void **block;
  int v11;
  int v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15[2];
  uint64_t v16;
  uint64_t *v17;
  int v18;
  int v19;
  void (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22[2];
  BuddyDeviceManagementSupport *v23;
  char v24;

  v23 = self;
  v22[1] = (id)a2;
  v16 = 0;
  v17 = &v16;
  v18 = 838860800;
  v19 = 48;
  v20 = sub_1001BDBE4;
  v21 = sub_1001BDC14;
  v22[0] = 0;
  v2 = -[BuddyDeviceManagementSupport skipKeysQueue](self, "skipKeysQueue");
  block = _NSConcreteStackBlock;
  v11 = -1073741824;
  v12 = 0;
  v13 = sub_1001BE720;
  v14 = &unk_100281780;
  v15[1] = &v16;
  v15[0] = v23;
  dispatch_sync((dispatch_queue_t)v2, &block);

  if (v17[5])
  {
    v24 = objc_msgSend((id)v17[5], "containsObject:", kMCCCSkipSetupTapToSetup) & 1;
  }
  else
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v3);
    v8 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v4 = oslog;
      v5 = v8;
      sub_100038C3C(buf);
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "Temporary disallowance of proximity advertisement until skip keys are loaded", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    v24 = 1;
  }
  objc_storeStrong(v15, 0);
  _Block_object_dispose(&v16, 8);
  objc_storeStrong(v22, 0);
  return v24 & 1;
}

- (BOOL)deviceManagementWantsToSkipControllerClass:(Class)a3
{
  unsigned __int8 v3;
  int v5;
  char v6;
  NSArray *v7;
  id location;
  Class v9;
  SEL v10;
  BuddyDeviceManagementSupport *v11;
  char v12;

  v11 = self;
  v10 = a2;
  v9 = a3;
  if ((objc_opt_respondsToSelector(a3, "cloudConfigSkipKey") & 1) == 0)
    goto LABEL_10;
  location = -[objc_class cloudConfigSkipKey](v9, "cloudConfigSkipKey");
  v6 = 0;
  v3 = 0;
  if (location)
  {
    v7 = -[BuddyDeviceManagementSupport skipKeys](v11, "skipKeys");
    v6 = 1;
    v3 = -[NSArray containsObject:](v7, "containsObject:", location);
  }
  if ((v6 & 1) != 0)

  if ((v3 & 1) != 0)
  {
    v12 = 1;
    v5 = 1;
  }
  else
  {
    v5 = 0;
  }
  objc_storeStrong(&location, 0);
  if (!v5)
LABEL_10:
    v12 = 0;
  return v12 & 1;
}

- (float)_delayBetweenLoadSkipKeysRetriesInSeconds
{
  return 1.0;
}

- (BuddyDeviceManagementProvider)deviceManagementProvider
{
  return (BuddyDeviceManagementProvider *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDeviceManagementProvider:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void)setSkipKeys:(id)a3
{
  objc_storeStrong((id *)&self->_skipKeys, a3);
}

- (OS_dispatch_queue)skipKeysQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSkipKeysQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (BOOL)didAttemptToFetchSkipKeys
{
  return self->_didAttemptToFetchSkipKeys;
}

- (void)setDidAttemptToFetchSkipKeys:(BOOL)a3
{
  self->_didAttemptToFetchSkipKeys = a3;
}

- (BOOL)didFetchSkipKeysSuccessfully
{
  return self->_didFetchSkipKeysSuccessfully;
}

- (void)setDidFetchSkipKeysSuccessfully:(BOOL)a3
{
  self->_didFetchSkipKeysSuccessfully = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_skipKeysQueue, 0);
  objc_storeStrong((id *)&self->_skipKeys, 0);
  objc_storeStrong((id *)&self->_deviceManagementProvider, 0);
}

@end
