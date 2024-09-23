@implementation BYSoftwareUpdateCache

- (void)scanUsingCache:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4;
  void (**v5)(id, id, id, _QWORD);
  SUDescriptor *v6;
  SUDescriptor *v7;
  id v8;
  NSObject *v9;
  void **v10;
  int v11;
  int v12;
  void (*v13)(uint64_t, void *, void *);
  void *v14;
  BYSoftwareUpdateCache *v15;
  id v16;
  id v17;
  id v18;
  int v19;
  char v20;
  id v21;
  id location;
  BOOL v23;
  SEL v24;
  BYSoftwareUpdateCache *v25;

  v25 = self;
  v24 = a2;
  v23 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v20 = 0;
  v4 = 0;
  if (v23)
  {
    v21 = -[BYSoftwareUpdateCache preferredUpdate](v25, "preferredUpdate");
    v20 = 1;
    v4 = 0;
    if (v21)
      v4 = location != 0;
  }
  if ((v20 & 1) != 0)

  if (v4)
  {
    v5 = (void (**)(id, id, id, _QWORD))location;
    v6 = -[BYSoftwareUpdateCache preferredUpdate](v25, "preferredUpdate");
    v7 = -[BYSoftwareUpdateCache latestUpdate](v25, "latestUpdate");
    v5[2](v5, v6, v7, 0);

    v19 = 1;
  }
  else
  {
    v18 = objc_alloc_init((Class)SUScanOptions);
    objc_msgSend(v18, "setForced:", 1);
    objc_msgSend(v18, "setIdentifier:", CFSTR("com.apple.purplebuddy.software_update"));
    v8 = objc_alloc((Class)SUManagerClient);
    v9 = dispatch_get_global_queue(0, 0);
    v17 = objc_msgSend(v8, "initWithDelegate:queue:clientType:", 0, v9, 1);

    v10 = _NSConcreteStackBlock;
    v11 = -1073741824;
    v12 = 0;
    v13 = sub_10017B918;
    v14 = &unk_100283E08;
    v15 = v25;
    v16 = location;
    objc_msgSend(v17, "scanForUpdates:withScanResults:", v18, &v10);
    objc_storeStrong(&v16, 0);
    objc_storeStrong((id *)&v15, 0);
    objc_storeStrong(&v17, 0);
    objc_storeStrong(&v18, 0);
    v19 = 0;
  }
  objc_storeStrong(&location, 0);
}

- (void)scanUsingCache:(BOOL)a3 allowBootstrap:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v5;
  void (**v6)(id, id, id, _QWORD);
  SUDescriptor *v7;
  SUDescriptor *v8;
  id v9;
  id v10;
  uint64_t v11;
  NSString *v12;
  id v13;
  BYSoftwareUpdateCache *v14;
  BOOL v15;
  void **v16;
  int v17;
  int v18;
  void (*v19)(uint64_t, void *, void *, void *);
  void *v20;
  id v21;
  id v22;
  BOOL v23;
  char v24;
  id v25;
  char v26;
  id v27;
  os_log_type_t v28;
  os_log_t oslog;
  id obj;
  id v31;
  id v32;
  id v33;
  id v34;
  int v35;
  char v36;
  SUDescriptor *v37;
  id location;
  BOOL v39;
  BOOL v40;
  SEL v41;
  BYSoftwareUpdateCache *v42;
  uint8_t buf[24];

  v42 = self;
  v41 = a2;
  v40 = a3;
  v39 = a4;
  location = 0;
  objc_storeStrong(&location, a5);
  v36 = 0;
  v5 = 0;
  if (v40)
  {
    v37 = -[BYSoftwareUpdateCache preferredUpdate](v42, "preferredUpdate");
    v36 = 1;
    v5 = 0;
    if (v37)
      v5 = location != 0;
  }
  if ((v36 & 1) != 0)

  if (v5)
  {
    v6 = (void (**)(id, id, id, _QWORD))location;
    v7 = -[BYSoftwareUpdateCache preferredUpdate](v42, "preferredUpdate");
    v8 = -[BYSoftwareUpdateCache latestUpdate](v42, "latestUpdate");
    v6[2](v6, v7, v8, 0);

    v35 = 1;
  }
  else
  {
    v34 = 0;
    if (v39)
    {
      v33 = dispatch_queue_create("Telephony Queue", 0);
      v32 = objc_msgSend(objc_alloc((Class)CoreTelephonyClient), "initWithQueue:", v33);
      v31 = 0;
      obj = 0;
      v9 = objc_msgSend(v32, "usingBootstrapDataService:", &obj);
      objc_storeStrong(&v31, obj);
      v10 = v34;
      v34 = v9;

      if (v34)
      {
        if ((objc_msgSend(v34, "BOOLValue") & 1) != 0)
        {
          v13 = +[CTCellularPlanManager sharedManager](CTCellularPlanManager, "sharedManager");
          objc_msgSend(v13, "setUserInPurchaseFlow:", 1);

        }
      }
      else
      {
        oslog = (os_log_t)(id)_BYLoggingFacility(v11);
        v28 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          v26 = 0;
          v24 = 0;
          if ((_BYIsInternalInstall() & 1) != 0)
          {
            v12 = (NSString *)v31;
          }
          else if (v31)
          {
            v27 = objc_msgSend(v31, "domain");
            v26 = 1;
            v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v27, objc_msgSend(v31, "code"));
            v25 = v12;
            v24 = 1;
          }
          else
          {
            v12 = 0;
          }
          sub_100039500((uint64_t)buf, (uint64_t)v12);
          _os_log_error_impl((void *)&_mh_execute_header, oslog, v28, "Unable to get bootstrap status for software update scan: %{public}@", buf, 0xCu);
          if ((v24 & 1) != 0)

          if ((v26 & 1) != 0)
        }
        objc_storeStrong((id *)&oslog, 0);
      }
      objc_storeStrong(&v31, 0);
      objc_storeStrong(&v32, 0);
      objc_storeStrong(&v33, 0);
    }
    v14 = v42;
    v15 = v40;
    v16 = _NSConcreteStackBlock;
    v17 = -1073741824;
    v18 = 0;
    v19 = sub_10017BFE4;
    v20 = &unk_100283808;
    v23 = v39;
    v21 = v34;
    v22 = location;
    -[BYSoftwareUpdateCache scanUsingCache:withCompletion:](v14, "scanUsingCache:withCompletion:", v15, &v16);
    objc_storeStrong(&v22, 0);
    objc_storeStrong(&v21, 0);
    objc_storeStrong(&v34, 0);
    v35 = 0;
  }
  objc_storeStrong(&location, 0);
}

- (void)scanUsingCache:(BOOL)a3 allowBootstrap:(BOOL)a4 retry:(BOOL)a5 withCompletion:(id)a6
{
  id location;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  SEL v10;
  BYSoftwareUpdateCache *v11;

  v11 = self;
  v10 = a2;
  v9 = a3;
  v8 = a4;
  v7 = a5;
  location = 0;
  objc_storeStrong(&location, a6);
  if (v7)
    -[BYSoftwareUpdateCache _scanUsingCache:allowBootstrap:attemptsAllowed:withCompletion:](v11, "_scanUsingCache:allowBootstrap:attemptsAllowed:withCompletion:", v9, v8, 3, location);
  else
    -[BYSoftwareUpdateCache scanUsingCache:allowBootstrap:withCompletion:](v11, "scanUsingCache:allowBootstrap:withCompletion:", v9, v8, location);
  objc_storeStrong(&location, 0);
}

- (void)reset
{
  NSObject *v2;
  os_log_type_t v3;
  _WORD v4[3];
  os_log_type_t v5;
  os_log_t oslog[2];
  BYSoftwareUpdateCache *v7;

  v7 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility(self);
  v5 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = oslog[0];
    v3 = v5;
    sub_100038C3C(v4);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Resetting software update cache...", (uint8_t *)v4, 2u);
  }
  objc_storeStrong((id *)oslog, 0);
  -[BYSoftwareUpdateCache setPreferredUpdate:](v7, "setPreferredUpdate:", 0);
  -[BYSoftwareUpdateCache setLatestUpdate:](v7, "setLatestUpdate:", 0);
  -[BYSoftwareUpdateCache setLastScanDate:](v7, "setLastScanDate:", 0);
}

- (void)_scanUsingCache:(BOOL)a3 allowBootstrap:(BOOL)a4 attemptsAllowed:(unint64_t)a5 withCompletion:(id)a6
{
  id location;
  unint64_t v7;
  BOOL v8;
  BOOL v9;
  SEL v10;
  BYSoftwareUpdateCache *v11;

  v11 = self;
  v10 = a2;
  v9 = a3;
  v8 = a4;
  v7 = a5;
  location = 0;
  objc_storeStrong(&location, a6);
  -[BYSoftwareUpdateCache _scanUsingCache:allowBootstrap:attemptCount:attemptsAllowed:withCompletion:](v11, "_scanUsingCache:allowBootstrap:attemptCount:attemptsAllowed:withCompletion:", v9, v8, 0, v7, location);
  objc_storeStrong(&location, 0);
}

- (void)_scanUsingCache:(BOOL)a3 allowBootstrap:(BOOL)a4 attemptCount:(unint64_t)a5 attemptsAllowed:(unint64_t)a6 withCompletion:(id)a7
{
  BYSoftwareUpdateCache *v7;
  BOOL v8;
  BOOL v9;
  void **v10;
  int v11;
  int v12;
  void (*v13)(uint64_t, void *, void *, void *);
  void *v14;
  BYSoftwareUpdateCache *v15;
  id v16[3];
  BOOL v17;
  BOOL v18;
  id location;
  void *v20;
  void *v21;
  BOOL v22;
  BOOL v23;
  SEL v24;
  BYSoftwareUpdateCache *v25;

  v25 = self;
  v24 = a2;
  v23 = a3;
  v22 = a4;
  v21 = (void *)a5;
  v20 = (void *)a6;
  location = 0;
  objc_storeStrong(&location, a7);
  v7 = v25;
  v8 = v23;
  v9 = v22;
  v10 = _NSConcreteStackBlock;
  v11 = -1073741824;
  v12 = 0;
  v13 = sub_10017C3B4;
  v14 = &unk_100283E58;
  v16[1] = v21;
  v16[2] = v20;
  v16[0] = location;
  v15 = v25;
  v17 = v23;
  v18 = v22;
  -[BYSoftwareUpdateCache scanUsingCache:allowBootstrap:withCompletion:](v7, "scanUsingCache:allowBootstrap:withCompletion:", v8, v9, &v10);
  objc_storeStrong((id *)&v15, 0);
  objc_storeStrong(v16, 0);
  objc_storeStrong(&location, 0);
}

- (unint64_t)_retryDelaySecondsForAttemptCount:(unint64_t)a3
{
  return 5 * (a3 + 1);
}

- (SUDescriptor)preferredUpdate
{
  return (SUDescriptor *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPreferredUpdate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (SUDescriptor)latestUpdate
{
  return (SUDescriptor *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLatestUpdate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSDate)lastScanDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLastScanDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastScanDate, 0);
  objc_storeStrong((id *)&self->_latestUpdate, 0);
  objc_storeStrong((id *)&self->_preferredUpdate, 0);
}

@end
