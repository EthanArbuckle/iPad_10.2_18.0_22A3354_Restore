@implementation BuddyEnrollmentChannelDiscoveryController

+ (BOOL)controllerNeedsToRun
{
  id v2;
  unsigned __int8 v3;
  BOOL v4;
  char v6;
  id v7;
  char v8;
  id v9;
  char v10;
  id v11;
  BOOL v12;

  v2 = +[BuddyCloudConfigManager sharedManager](BuddyCloudConfigManager, "sharedManager");
  v3 = objc_msgSend(v2, "hasCloudConfiguration");
  v10 = 0;
  v8 = 0;
  v6 = 0;
  v4 = 0;
  if ((v3 & 1) != 0)
  {
    v11 = +[BuddyCloudConfigManager sharedManager](BuddyCloudConfigManager, "sharedManager");
    v10 = 1;
    v9 = objc_msgSend(v11, "cloudConfigurationDetails");
    v8 = 1;
    v7 = objc_msgSend(v9, "objectForKeyedSubscript:", kCCEnrollmentServerKey);
    v6 = 1;
    v4 = v7 != 0;
  }
  v12 = v4;
  if ((v6 & 1) != 0)

  if ((v8 & 1) != 0)
  if ((v10 & 1) != 0)

  return v12;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  BuddyEnrollmentCoordinator *v3;
  unint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  BuddyEnrollmentCoordinator *v14;
  id v15;
  id v16;
  void **v17;
  int v18;
  int v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  id v22;
  uint8_t v23[15];
  char v24;
  os_log_t oslog;
  id v26;
  id v27;
  int v28;
  uint8_t buf[15];
  os_log_type_t v30;
  id v31;
  id location[2];
  BuddyEnrollmentChannelDiscoveryController *v33;

  v33 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyEnrollmentChannelDiscoveryController enrollmentCoordinator](v33, "enrollmentCoordinator");
  v4 = -[BuddyEnrollmentCoordinator mdmEnrollmentChannel](v3, "mdmEnrollmentChannel");

  if (v4)
  {
    v31 = (id)_BYLoggingFacility(v5);
    v30 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v31, OS_LOG_TYPE_DEFAULT))
    {
      v6 = v31;
      v7 = v30;
      sub_100038C3C(buf);
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "We have fetched enrollment channel before. Skipping...", buf, 2u);
    }
    objc_storeStrong(&v31, 0);
    (*((void (**)(id, _QWORD))location[0] + 2))(location[0], 0);
    v28 = 1;
  }
  else
  {
    v8 = +[BuddyCloudConfigManager sharedManager](BuddyCloudConfigManager, "sharedManager");
    v27 = objc_msgSend(v8, "cloudConfigurationDetails");

    v9 = objc_msgSend(v27, "objectForKeyedSubscript:", kCCEnrollmentServerKey);
    v10 = objc_msgSend(v9, "objectForKeyedSubscript:", kCCEnrollmentURLKey);
    v26 = +[NSURL URLWithString:](NSURL, "URLWithString:", v10);

    if (v26)
    {
      v14 = -[BuddyEnrollmentChannelDiscoveryController enrollmentCoordinator](v33, "enrollmentCoordinator");
      v15 = objc_msgSend(v27, "objectForKeyedSubscript:", kCCEnrollmentServerKey);
      v16 = objc_msgSend(v15, "objectForKeyedSubscript:", kCCEnrollmentAnchorCertificatesKey);
      v17 = _NSConcreteStackBlock;
      v18 = -1073741824;
      v19 = 0;
      v20 = sub_10011B0D8;
      v21 = &unk_100280780;
      v22 = location[0];
      -[BuddyEnrollmentCoordinator discoverAndStoreEnrollmentChannelWithEnrollmentURL:certificateDatas:completionHandler:](v14, "discoverAndStoreEnrollmentChannelWithEnrollmentURL:certificateDatas:completionHandler:", v26, v16, &v17);

      objc_storeStrong(&v22, 0);
      v28 = 0;
    }
    else
    {
      oslog = (os_log_t)(id)_BYLoggingFacility(v11);
      v24 = 16;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        v12 = oslog;
        v13 = v24;
        sub_100038C3C(v23);
        _os_log_error_impl((void *)&_mh_execute_header, v12, v13, "No enrollment URL!", v23, 2u);
      }
      objc_storeStrong((id *)&oslog, 0);
      (*((void (**)(id, _QWORD))location[0] + 2))(location[0], 0);
      v28 = 1;
    }
    objc_storeStrong(&v26, 0);
    objc_storeStrong(&v27, 0);
  }
  objc_storeStrong(location, 0);
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 14;
}

- (BuddyEnrollmentCoordinator)enrollmentCoordinator
{
  return self->enrollmentCoordinator;
}

- (void)setEnrollmentCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->enrollmentCoordinator, a3);
}

- (BFFFlowItemDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (BFFFlowItemDelegate *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->enrollmentCoordinator, 0);
}

@end
