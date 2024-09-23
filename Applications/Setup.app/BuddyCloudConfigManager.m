@implementation BuddyCloudConfigManager

- (void)_setProfileConnection:(id)a3
{
  id location[2];
  BuddyCloudConfigManager *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v4->_profileConnection, location[0]);
  objc_storeStrong(location, 0);
}

- (id)profileConnection
{
  MCProfileConnection *v2;
  MCProfileConnection *profileConnection;

  if (!self->_profileConnection)
  {
    v2 = (MCProfileConnection *)+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection", a2);
    profileConnection = self->_profileConnection;
    self->_profileConnection = v2;

  }
  return self->_profileConnection;
}

+ (id)sharedManager
{
  id location;
  dispatch_once_t *v4;

  v4 = (dispatch_once_t *)&unk_1002EEBC0;
  location = 0;
  objc_storeStrong(&location, &stru_100283A80);
  if (*v4 != -1)
    dispatch_once(v4, location);
  objc_storeStrong(&location, 0);
  return (id)qword_1002EEBB8;
}

- (BuddyCloudConfigManager)init
{
  dispatch_queue_t v2;
  void *v3;
  const char *v4;
  NSObject *v5;
  uint64_t v6;
  BuddyCloudConfigManager *v7;
  os_log_t oslog;
  void **handler;
  int v11;
  int v12;
  id (*v13)(NSObject *, int);
  void *v14;
  id v15;
  int v16;
  int out_token;
  objc_super v18;
  SEL v19;
  id location;
  uint8_t buf[24];

  v19 = a2;
  location = 0;
  v18.receiver = self;
  v18.super_class = (Class)BuddyCloudConfigManager;
  location = -[BuddyCloudConfigManager init](&v18, "init");
  objc_storeStrong(&location, location);
  if (location)
  {
    v2 = dispatch_queue_create("Cloud Config Manager SkipKey Queue", 0);
    v3 = (void *)*((_QWORD *)location + 4);
    *((_QWORD *)location + 4) = v2;

    out_token = 0;
    v16 = 0;
    v4 = (const char *)objc_msgSend(MCProfileListChangedNotification, "cStringUsingEncoding:", 4);
    v5 = *((_QWORD *)location + 4);
    handler = _NSConcreteStackBlock;
    v11 = -1073741824;
    v12 = 0;
    v13 = sub_100167A6C;
    v14 = &unk_100283AA8;
    v15 = location;
    v6 = notify_register_dispatch(v4, &out_token, v5, &handler);
    v16 = v6;
    if ((_DWORD)v6)
    {
      oslog = (os_log_t)(id)_BYLoggingFacility(v6);
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        sub_100167B20((uint64_t)buf, MCProfileListChangedNotification, v16);
        _os_log_error_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_ERROR, "Could not register for %{public}@ notification. Error: %{public}d", buf, 0x12u);
      }
      objc_storeStrong((id *)&oslog, 0);
    }
    objc_storeStrong(&v15, 0);
  }
  v7 = (BuddyCloudConfigManager *)location;
  objc_storeStrong(&location, 0);
  return v7;
}

- (void)setCloudConfigurationDetails:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  NSObject *skipKeysQueue;
  void **block;
  int v7;
  int v8;
  id (*v9)(uint64_t);
  void *v10;
  BuddyCloudConfigManager *v11;
  id v12;
  os_log_type_t v13;
  os_log_t v14;
  os_log_type_t v15;
  os_log_t oslog;
  id location[2];
  BuddyCloudConfigManager *v18;
  uint8_t v19[16];
  uint8_t buf[24];

  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v18->_cloudConfigurationDetails != location[0]
    && (objc_msgSend(location[0], "isEqualToDictionary:", v18->_cloudConfigurationDetails) & 1) == 0)
  {
    objc_storeStrong((id *)&v18->_cloudConfigurationDetails, location[0]);
    oslog = (os_log_t)(id)_BYLoggingFacility(v3);
    v15 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_1000342B4((uint64_t)buf, (uint64_t)v18->_cloudConfigurationDetails);
      _os_log_impl((void *)&_mh_execute_header, oslog, v15, "Cloud Config changed: %p", buf, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    v14 = (os_log_t)(id)_BYLoggingFacility(v4);
    v13 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      sub_100038C28((uint64_t)v19, (uint64_t)v18->_cloudConfigurationDetails);
      _os_log_debug_impl((void *)&_mh_execute_header, v14, v13, "%@", v19, 0xCu);
    }
    objc_storeStrong((id *)&v14, 0);
    skipKeysQueue = v18->skipKeysQueue;
    block = _NSConcreteStackBlock;
    v7 = -1073741824;
    v8 = 0;
    v9 = sub_100167D6C;
    v10 = &unk_100280D00;
    v11 = v18;
    v12 = location[0];
    dispatch_sync(skipKeysQueue, &block);
    objc_storeStrong(&v12, 0);
    objc_storeStrong((id *)&v11, 0);
  }
  objc_storeStrong(location, 0);
}

- (NSDictionary)cloudConfigurationDetails
{
  id v2;
  id v3;

  if (!self->_cloudConfigurationDetails)
  {
    v2 = -[BuddyCloudConfigManager profileConnection](self, "profileConnection", a2);
    v3 = objc_msgSend(v2, "cloudConfigurationDetails");
    -[BuddyCloudConfigManager setCloudConfigurationDetails:](self, "setCloudConfigurationDetails:", v3);

  }
  return self->_cloudConfigurationDetails;
}

- (BOOL)hasCloudConfiguration
{
  NSDictionary *v2;
  BOOL v3;

  v2 = -[BuddyCloudConfigManager cloudConfigurationDetails](self, "cloudConfigurationDetails", a2, self);
  v3 = v2 != 0;

  return v3;
}

- (void)cloudConfigMayHaveChanged
{
  id v2;
  id location[2];
  BuddyCloudConfigManager *v4;

  v4 = self;
  location[1] = (id)a2;
  v2 = -[BuddyCloudConfigManager profileConnection](self, "profileConnection");
  location[0] = objc_msgSend(v2, "cloudConfigurationDetails");

  if (location[0])
    -[BuddyCloudConfigManager setCloudConfigurationDetails:](v4, "setCloudConfigurationDetails:", location[0]);
  objc_storeStrong(location, 0);
}

- (BOOL)cloudConfigWantsToSkipControllerClass:(Class)a3
{
  NSObject *skipKeysQueue;
  char v4;
  void **block;
  int v7;
  int v8;
  void (*v9)(uint64_t);
  void *v10;
  BuddyCloudConfigManager *v11;
  id v12[2];
  id location;
  uint64_t v14;
  uint64_t *v15;
  int v16;
  int v17;
  char v18;
  Class v19;
  SEL v20;
  BuddyCloudConfigManager *v21;

  v21 = self;
  v20 = a2;
  v19 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x20000000;
  v17 = 32;
  v18 = 0;
  if ((objc_opt_respondsToSelector(a3, "cloudConfigSkipKey") & 1) != 0)
  {
    location = -[objc_class cloudConfigSkipKey](v19, "cloudConfigSkipKey");
    if (location)
    {
      skipKeysQueue = v21->skipKeysQueue;
      block = _NSConcreteStackBlock;
      v7 = -1073741824;
      v8 = 0;
      v9 = sub_100168058;
      v10 = &unk_100283AD0;
      v11 = v21;
      v12[0] = location;
      v12[1] = &v14;
      dispatch_sync(skipKeysQueue, &block);
      objc_storeStrong(v12, 0);
      objc_storeStrong((id *)&v11, 0);
    }
    objc_storeStrong(&location, 0);
  }
  v4 = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return v4 & 1;
}

- (BOOL)isMultiUser
{
  unsigned __int8 v2;
  unsigned __int8 v3;
  unsigned __int8 v4;
  char v6;
  id v7;
  char v8;
  NSDictionary *v9;
  BOOL v11;

  v2 = +[BYManagedAppleIDBootstrap isMultiUser](BYManagedAppleIDBootstrap, "isMultiUser");
  v8 = 0;
  v6 = 0;
  v3 = 1;
  if ((v2 & 1) == 0)
  {
    v4 = +[BYManagedAppleIDBootstrap isSettingUpMultiUser](BYManagedAppleIDBootstrap, "isSettingUpMultiUser");
    v3 = 1;
    if ((v4 & 1) == 0)
    {
      v9 = -[BuddyCloudConfigManager cloudConfigurationDetails](self, "cloudConfigurationDetails");
      v8 = 1;
      v7 = -[NSDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", kMCCCIsMultiUserKey);
      v6 = 1;
      v3 = objc_msgSend(v7, "BOOLValue");
    }
  }
  v11 = v3 & 1;
  if ((v6 & 1) != 0)

  if ((v8 & 1) != 0)
  return v11;
}

- (void)_updateSkipKeysWithCachedDetails:(id)a3
{
  id v3;
  id v4;
  id v5;
  NSSet *v6;
  NSSet *skipSetupKeys;
  uint64_t v8;
  os_log_t oslog;
  id v10;
  id location[2];
  BuddyCloudConfigManager *v12;
  uint8_t buf[24];

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = +[NSMutableSet set](NSMutableSet, "set");
  v3 = +[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection");
  v4 = objc_msgSend(v3, "skipSetupKeys");
  objc_msgSend(v10, "addObjectsFromArray:", v4);

  v5 = objc_msgSend(location[0], "objectForKeyedSubscript:", kMCCCSkipSetupKey);
  objc_msgSend(v10, "addObjectsFromArray:", v5);

  v6 = (NSSet *)objc_msgSend(v10, "copy");
  skipSetupKeys = v12->_skipSetupKeys;
  v12->_skipSetupKeys = v6;

  oslog = (os_log_t)(id)_BYLoggingFacility(v8);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    sub_100038C28((uint64_t)buf, (uint64_t)v12->_skipSetupKeys);
    _os_log_debug_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEBUG, "Skip keys are: %@", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)hasPreviouslyRetrievedMDMv1EnrollmentProfile
{
  return self->_hasPreviouslyRetrievedMDMv1EnrollmentProfile;
}

- (void)setHasPreviouslyRetrievedMDMv1EnrollmentProfile:(BOOL)a3
{
  self->_hasPreviouslyRetrievedMDMv1EnrollmentProfile = a3;
}

- (DMCReturnToServiceController)mdmReturnToServiceController
{
  return self->_mdmReturnToServiceController;
}

- (void)setMdmReturnToServiceController:(id)a3
{
  objc_storeStrong((id *)&self->_mdmReturnToServiceController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mdmReturnToServiceController, 0);
  objc_storeStrong((id *)&self->skipKeysQueue, 0);
  objc_storeStrong((id *)&self->_skipSetupKeys, 0);
  objc_storeStrong((id *)&self->_cloudConfigurationDetails, 0);
  objc_storeStrong((id *)&self->_profileConnection, 0);
}

@end
