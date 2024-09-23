@implementation BuddyFlowDiverter

- (BuddyFlowDiverter)initWithEnvironment:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  BuddyFlowDiverter *v8;
  objc_super v10;
  id location[2];
  id v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v12;
  v12 = 0;
  v10.receiver = v3;
  v10.super_class = (Class)BuddyFlowDiverter;
  v12 = -[BuddyFlowDiverter init](&v10, "init");
  objc_storeStrong(&v12, v12);
  if (v12)
  {
    objc_storeStrong((id *)v12 + 2, location[0]);
    v4 = +[BuddyDeviceManagementSupport sharedSupport](BuddyDeviceManagementSupport, "sharedSupport");
    v5 = (void *)*((_QWORD *)v12 + 1);
    *((_QWORD *)v12 + 1) = v4;

    v6 = objc_msgSend(location[0], "flowItemDispositionProvider");
    v7 = (void *)*((_QWORD *)v12 + 3);
    *((_QWORD *)v12 + 3) = v6;

  }
  v8 = (BuddyFlowDiverter *)v12;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v12, 0);
  return v8;
}

- (void)prepareWithCompletion:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  BuddyDeviceManagementSupport *v6;
  void **v7;
  int v8;
  int v9;
  void (*v10)(NSObject *, char);
  void *v11;
  id v12;
  uint8_t buf[15];
  os_log_type_t v14;
  id v15;
  id location[2];
  BuddyFlowDiverter *v17;

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
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Fetching skip keys...", buf, 2u);
  }
  objc_storeStrong(&v15, 0);
  v6 = -[BuddyFlowDiverter deviceManagementSupport](v17, "deviceManagementSupport");
  v7 = _NSConcreteStackBlock;
  v8 = -1073741824;
  v9 = 0;
  v10 = sub_1001068F0;
  v11 = &unk_100281A80;
  v12 = location[0];
  -[BuddyDeviceManagementSupport loadSkipKeys:](v6, "loadSkipKeys:", &v7);

  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)shouldSkipControllerClass:(Class)a3 reason:(id *)a4 humanReadableReason:(id *)a5
{
  id v5;
  unsigned __int8 v6;
  BuddyDeviceManagementSupport *v7;
  unsigned __int8 v8;
  id v9;
  unsigned __int8 v10;
  BuddyFlowItemDispositionProvider *v11;
  unint64_t v12;
  BuddyFlowItemDispositionProvider *v13;
  BOOL v14;
  BuddyFlowItemDispositionProvider *v15;
  BOOL v16;
  NSString *v17;
  uint64_t v18;
  id v19;
  os_log_t oslog;
  NSString *v22;
  BOOL v23;
  BOOL v24;
  unint64_t v25;
  char v26;
  char v27;
  id *v28;
  id *v29;
  Class aClass;
  SEL v31;
  BuddyFlowDiverter *v32;
  uint8_t buf[24];

  v32 = self;
  v31 = a2;
  aClass = a3;
  v29 = a4;
  v28 = a5;
  v5 = +[BuddyCloudConfigManager sharedManager](BuddyCloudConfigManager, "sharedManager");
  v6 = objc_msgSend(v5, "cloudConfigWantsToSkipControllerClass:", aClass);

  if ((v6 & 1) != 0)
  {
    if (v28)
      *v28 = objc_retainAutorelease(CFSTR("cloud configuration"));
    if (v29)
      *v29 = objc_retainAutorelease(&off_100290DA8);
    return 1;
  }
  v7 = -[BuddyFlowDiverter deviceManagementSupport](v32, "deviceManagementSupport");
  v8 = -[BuddyDeviceManagementSupport deviceManagementWantsToSkipControllerClass:](v7, "deviceManagementWantsToSkipControllerClass:", aClass);

  if ((v8 & 1) != 0)
  {
    if (v28)
      *v28 = objc_retainAutorelease(CFSTR("device management"));
    if (v29)
      *v29 = objc_retainAutorelease(&off_100290DC0);
    return 1;
  }
  if ((-[objc_class conformsToProtocol:](aClass, "conformsToProtocol:", &OBJC_PROTOCOL___BFFFlowItem) & 1) == 0)
    return 0;
  v27 = +[UIApplication isRunningInStoreDemoMode](UIApplication, "isRunningInStoreDemoMode") & 1;
  if ((objc_opt_respondsToSelector(aClass, "hiddenFromStoreDemoMode") & 1) != 0
    && (-[objc_class hiddenFromStoreDemoMode](aClass, "hiddenFromStoreDemoMode") & 1) != 0
    && (v27 & 1) != 0)
  {
    if (v28)
      *v28 = objc_retainAutorelease(CFSTR("store demo mode"));
    if (v29)
      *v29 = objc_retainAutorelease(&off_100290DD8);
    return 1;
  }
  v9 = +[BuddyCloudConfigManager sharedManager](BuddyCloudConfigManager, "sharedManager");
  v10 = objc_msgSend(v9, "isMultiUser");

  v26 = v10 & 1;
  if ((objc_opt_respondsToSelector(aClass, "hiddenFromMultiUser") & 1) != 0
    && (-[objc_class hiddenFromMultiUser](aClass, "hiddenFromMultiUser") & 1) != 0
    && (v26 & 1) != 0)
  {
    if (v28)
      *v28 = objc_retainAutorelease(CFSTR("multi user"));
    if (v29)
      *v29 = objc_retainAutorelease(&off_100290DF0);
    return 1;
  }
  v25 = (unint64_t)-[objc_class applicableDispositions](aClass, "applicableDispositions");
  v11 = -[BuddyFlowDiverter flowItemDispositionProvider](v32, "flowItemDispositionProvider");
  v12 = -[BuddyFlowItemDispositionProvider dispositions](v11, "dispositions");

  if (!v12)
    return 0;
  v13 = -[BuddyFlowDiverter flowItemDispositionProvider](v32, "flowItemDispositionProvider");
  v14 = (-[BuddyFlowItemDispositionProvider dispositions](v13, "dispositions") & 2) == 2;

  v24 = v14;
  v15 = -[BuddyFlowDiverter flowItemDispositionProvider](v32, "flowItemDispositionProvider");
  v16 = (v25 & -[BuddyFlowItemDispositionProvider dispositions](v15, "dispositions")) != 0;

  v23 = v16;
  if (v16)
    return 0;
  if (v24)
  {
    v17 = NSStringFromClass(aClass);
    v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unexpected flow item (%@) with disposition prior disposition determination"), v17);

    oslog = (os_log_t)(id)_BYLoggingFacility(v18);
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      sub_100038C28((uint64_t)buf, (uint64_t)v22);
      _os_log_error_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    objc_exception_throw(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", v22, 0, 0));
  }
  if (v28)
  {
    v19 = (id)BYStringForFlowItemDispositions(v25);
    *v28 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("inapplicable disposition (%@)"), v19);

  }
  if (v29)
    *v29 = objc_retainAutorelease(&off_100290DD8);
  return 1;
}

- (void)didSkipControllerClass:(Class)a3 forReason:(id)a4
{
  char *v4;
  Class v5;
  BYEnvironment *v6;
  id location;
  Class v8;
  SEL v9;
  BuddyFlowDiverter *v10;

  v10 = self;
  v9 = a2;
  v8 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v4 = (char *)objc_msgSend(location, "unsignedIntegerValue");
  if (v4 && (unint64_t)(v4 - 1) <= 2)
  {
    if ((objc_opt_respondsToSelector(v8, "skippedByCloudConfigWithEnvironment:") & 1) != 0)
    {
      v5 = v8;
      v6 = -[BuddyFlowDiverter environment](v10, "environment");
      -[objc_class skippedByCloudConfigWithEnvironment:](v5, "skippedByCloudConfigWithEnvironment:", v6);

    }
    else if ((objc_opt_respondsToSelector(v8, "skippedByCloudConfig") & 1) != 0)
    {
      -[objc_class skippedByCloudConfig](v8, "skippedByCloudConfig");
    }
  }
  objc_storeStrong(&location, 0);
}

- (BuddyDeviceManagementSupport)deviceManagementSupport
{
  return self->_deviceManagementSupport;
}

- (void)setDeviceManagementSupport:(id)a3
{
  objc_storeStrong((id *)&self->_deviceManagementSupport, a3);
}

- (BYEnvironment)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_environment, a3);
}

- (BuddyFlowItemDispositionProvider)flowItemDispositionProvider
{
  return self->_flowItemDispositionProvider;
}

- (void)setFlowItemDispositionProvider:(id)a3
{
  objc_storeStrong((id *)&self->_flowItemDispositionProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flowItemDispositionProvider, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_deviceManagementSupport, 0);
}

@end
