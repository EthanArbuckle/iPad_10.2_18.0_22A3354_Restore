@implementation BuddyActivationConfiguration

+ (id)currentConfiguration
{
  id location;
  dispatch_once_t *v4;

  v4 = (dispatch_once_t *)&unk_1002EECF0;
  location = 0;
  objc_storeStrong(&location, &stru_100284658);
  if (*v4 != -1)
    dispatch_once(v4, location);
  objc_storeStrong(&location, 0);
  return (id)qword_1002EECF8;
}

- (BuddyActivationConfiguration)init
{
  id v3;
  BuddyActivationConfiguration *v4;
  id location;

  v3 = +[BYPreferencesController buddyPreferencesExcludedFromBackup](BYPreferencesController, "buddyPreferencesExcludedFromBackup", a2, self);
  location = -[BuddyActivationConfiguration initWithBuddyPreferencesExcludedFromBackup:](self, "initWithBuddyPreferencesExcludedFromBackup:", v3);
  objc_storeStrong(&location, location);

  v4 = (BuddyActivationConfiguration *)location;
  objc_storeStrong(&location, 0);
  return v4;
}

- (BuddyActivationConfiguration)initWithBuddyPreferencesExcludedFromBackup:(id)a3
{
  id v3;
  BuddyActivationConfiguration *v4;
  id v5;
  dispatch_queue_t v6;
  dispatch_queue_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  dispatch_queue_t v13;
  NSObject *v14;
  BuddyActivationConfiguration *v15;
  void **v17;
  uint64_t v18;
  id (*v19)(uint64_t);
  void *v20;
  id v21;
  objc_super v22;
  id location[2];
  id v24;

  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v24;
  v24 = 0;
  v22.receiver = v3;
  v22.super_class = (Class)BuddyActivationConfiguration;
  v4 = -[BuddyActivationConfiguration init](&v22, "init");
  v24 = v4;
  objc_storeStrong(&v24, v4);
  if (v4)
  {
    v5 = objc_alloc_init((Class)NSMutableSet);
    objc_msgSend(v24, "setDelegates:", v5);

    v6 = dispatch_queue_create("Activation Configuration Delegates Queue", 0);
    objc_msgSend(v24, "setDelegateQueue:", v6);

    v7 = dispatch_queue_create("Telephony Queue", 0);
    objc_msgSend(v24, "setTelephonyQueue:", v7);

    v8 = objc_alloc((Class)CoreTelephonyClient);
    v9 = objc_msgSend(v24, "telephonyQueue");
    v10 = objc_msgSend(v8, "initWithQueue:", v9);
    objc_msgSend(v24, "setTelephonyClient:", v10);

    v11 = v24;
    v12 = objc_msgSend(v24, "telephonyClient");
    objc_msgSend(v12, "setDelegate:", v11);

    objc_msgSend(v24, "setBuddyPreferencesExcludedFromBackup:", location[0]);
    objc_msgSend(v24, "setCellularActivationMethod:", 0);
    objc_msgSend(v24, "setActivationMethodChanged:", 1);
    v13 = dispatch_queue_create("Activation State Queue", 0);
    objc_msgSend(v24, "setActivationStateQueue:", v13);

    v14 = objc_msgSend(v24, "activationStateQueue");
    v17 = _NSConcreteStackBlock;
    v18 = 3221225472;
    v19 = sub_1001CCA8C;
    v20 = &unk_100280730;
    v21 = v24;
    dispatch_async(v14, &v17);

    objc_msgSend(v24, "_registerForActivationStateNotification", v17, v18, v19, v20);
    objc_storeStrong(&v21, 0);
  }
  v15 = (BuddyActivationConfiguration *)v24;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v24, 0);
  return v15;
}

- (void)addDelegate:(id)a3
{
  NSObject *v3;
  void **block;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  BuddyActivationConfiguration *v9;
  id v10;
  id location[2];
  BuddyActivationConfiguration *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyActivationConfiguration delegateQueue](v12, "delegateQueue");
  block = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_1001CCBBC;
  v8 = &unk_100280D00;
  v9 = v12;
  v10 = location[0];
  dispatch_async(v3, &block);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)removeDelegate:(id)a3
{
  NSObject *v3;
  void **block;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  BuddyActivationConfiguration *v9;
  id v10;
  id location[2];
  BuddyActivationConfiguration *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyActivationConfiguration delegateQueue](v12, "delegateQueue");
  block = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_1001CCCFC;
  v8 = &unk_100280D00;
  v9 = v12;
  v10 = location[0];
  dispatch_async(v3, &block);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)notifyDelegatesConfigurationChanged:(BOOL)a3
{
  OS_dispatch_queue *v3;
  void **v4;
  int v5;
  int v6;
  id (*v7)(uint64_t);
  void *v8;
  BuddyActivationConfiguration *v9;
  BOOL v10;
  BOOL v11;
  SEL v12;
  BuddyActivationConfiguration *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  v3 = -[BuddyActivationConfiguration delegateQueue](self, "delegateQueue");
  v4 = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_1001CCE08;
  v8 = &unk_100280B18;
  v9 = v13;
  v10 = v11;
  dispatch_async((dispatch_queue_t)v3, &v4);

  objc_storeStrong((id *)&v9, 0);
}

- (void)notifyDelegatesConfigurationChanged:(BOOL)a3 isActivated:(BOOL)a4
{
  OS_dispatch_queue *v4;
  void **v5;
  int v6;
  int v7;
  void (*v8)(uint64_t);
  void *v9;
  BuddyActivationConfiguration *v10;
  BOOL v11;
  BOOL v12;
  BOOL v13;
  BOOL v14;
  SEL v15;
  BuddyActivationConfiguration *v16;

  v16 = self;
  v15 = a2;
  v14 = a3;
  v13 = a4;
  v4 = -[BuddyActivationConfiguration delegateQueue](self, "delegateQueue");
  v5 = _NSConcreteStackBlock;
  v6 = -1073741824;
  v7 = 0;
  v8 = sub_1001CCF1C;
  v9 = &unk_100281DC8;
  v10 = v16;
  v11 = v14;
  v12 = v13;
  dispatch_async((dispatch_queue_t)v4, &v5);

  objc_storeStrong((id *)&v10, 0);
}

- (BOOL)isActivated
{
  void *v2;
  uint64_t v3;
  NSString *v4;
  char v6;
  NSString *v7;
  char v8;
  id v9;
  os_log_t oslog;
  id obj;
  id v12;
  id location[3];
  char v14;
  uint8_t buf[24];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  obj = 0;
  v2 = (void *)MAEGetActivationStateWithError(&obj);
  objc_storeStrong(location, obj);
  v12 = v2;
  if (location[0])
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v3);
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      v8 = 0;
      v6 = 0;
      if ((_BYIsInternalInstall() & 1) != 0)
      {
        v4 = (NSString *)location[0];
      }
      else if (location[0])
      {
        v9 = objc_msgSend(location[0], "domain");
        v8 = 1;
        v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v9, objc_msgSend(location[0], "code"));
        v7 = v4;
        v6 = 1;
      }
      else
      {
        v4 = 0;
      }
      sub_100039500((uint64_t)buf, (uint64_t)v4);
      _os_log_error_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_ERROR, "Failed to get activation state: %{public}@", buf, 0xCu);
      if ((v6 & 1) != 0)

      if ((v8 & 1) != 0)
    }
    objc_storeStrong((id *)&oslog, 0);
    v14 = 0;
  }
  else
  {
    v14 = (objc_msgSend(v12, "isEqualToString:", kMAActivationStateUnactivated) ^ 1) & 1;
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v14 & 1;
}

- (BOOL)hasActivated
{
  NSObject *v2;
  void **v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  id v9[4];
  uint64_t v10;
  uint64_t *v11;
  int v12;
  int v13;
  char v14;
  SEL v15;
  BuddyActivationConfiguration *v16;

  v16 = self;
  v15 = a2;
  v10 = 0;
  v11 = &v10;
  v12 = 0x20000000;
  v13 = 32;
  v14 = 0;
  v2 = -[BuddyActivationConfiguration activationStateQueue](self, "activationStateQueue");
  v4 = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_1001CD388;
  v8 = &unk_100281780;
  v9[1] = &v10;
  v9[0] = v16;
  dispatch_sync(v2, &v4);

  LOBYTE(v2) = *((_BYTE *)v11 + 24);
  objc_storeStrong(v9, 0);
  _Block_object_dispose(&v10, 8);
  return v2 & 1;
}

- (BOOL)supportsCellularActivation
{
  unint64_t v2;
  char v4;

  v2 = -[BuddyActivationConfiguration cellularActivationMethod](self, "cellularActivationMethod");
  if (v2)
  {
    if (v2 - 1 < 2)
      v4 = 1;
  }
  else
  {
    v4 = 0;
  }
  return v4 & 1;
}

- (unint64_t)cellularActivationMethod
{
  _BOOL8 v2;
  NSObject *v3;
  os_log_type_t v4;
  CoreTelephonyClient *v5;
  id v6;
  uint64_t v7;
  NSString *v8;
  CoreTelephonyClient *v9;
  id v10;
  uint64_t v11;
  NSString *v12;
  id v13;
  unsigned __int8 v14;
  os_log_t v16;
  BOOL v17;
  char v18;
  id v19;
  char v20;
  id v21;
  os_log_type_t v22;
  os_log_t v23;
  id v24;
  id v25;
  char v26;
  id v27;
  char v28;
  id v29;
  os_log_type_t v30;
  os_log_t oslog;
  id obj;
  id v33;
  id v34;
  uint64_t v35;
  uint8_t buf[7];
  char v37;
  os_log_t location[2];
  BuddyActivationConfiguration *v39;
  uint8_t v40[32];
  uint8_t v41[16];
  uint8_t v42[24];

  v39 = self;
  location[1] = (os_log_t)a2;
  v2 = -[BuddyActivationConfiguration activationMethodChanged](self, "activationMethodChanged");
  if (v2)
  {
    location[0] = (os_log_t)(id)_BYLoggingFacility(v2);
    v37 = 2;
    if (os_log_type_enabled(location[0], OS_LOG_TYPE_DEBUG))
    {
      v3 = location[0];
      v4 = v37;
      sub_100038C3C(buf);
      _os_log_debug_impl((void *)&_mh_execute_header, v3, v4, "Updating cellular activation method...", buf, 2u);
    }
    objc_storeStrong((id *)location, 0);
    v35 = 0;
    v34 = 0;
    v5 = -[BuddyActivationConfiguration telephonyClient](v39, "telephonyClient");
    obj = 0;
    v6 = -[CoreTelephonyClient getConnectionAvailability:connectionType:error:](v5, "getConnectionAvailability:connectionType:error:", 0, 9, &obj);
    objc_storeStrong(&v34, obj);
    v33 = v6;

    if (v33)
    {
      if ((objc_msgSend(v33, "available") & 1) != 0)
        v35 = 2;
    }
    else
    {
      oslog = (os_log_t)(id)_BYLoggingFacility(v7);
      v30 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        v28 = 0;
        v26 = 0;
        if ((_BYIsInternalInstall() & 1) != 0)
        {
          v8 = (NSString *)v34;
        }
        else if (v34)
        {
          v29 = objc_msgSend(v34, "domain");
          v28 = 1;
          v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v29, objc_msgSend(v34, "code"));
          v27 = v8;
          v26 = 1;
        }
        else
        {
          v8 = 0;
        }
        sub_100039500((uint64_t)v42, (uint64_t)v8);
        _os_log_impl((void *)&_mh_execute_header, oslog, v30, "Unable to get availability status to see if cellular activation is supported: %{public}@", v42, 0xCu);
        if ((v26 & 1) != 0)

        if ((v28 & 1) != 0)
      }
      objc_storeStrong((id *)&oslog, 0);
    }
    v9 = -[BuddyActivationConfiguration telephonyClient](v39, "telephonyClient");
    v24 = v34;
    v10 = -[CoreTelephonyClient usingBootstrapDataService:](v9, "usingBootstrapDataService:", &v24);
    objc_storeStrong(&v34, v24);
    v25 = v10;

    if (v25)
    {
      v13 = objc_msgSend(v25, "BOOLValue");
      if ((v13 & 1) != 0)
        v35 = 1;
    }
    else
    {
      v23 = (os_log_t)(id)_BYLoggingFacility(v11);
      v22 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v20 = 0;
        v18 = 0;
        if ((_BYIsInternalInstall() & 1) != 0)
        {
          v12 = (NSString *)v34;
        }
        else if (v34)
        {
          v21 = objc_msgSend(v34, "domain");
          v20 = 1;
          v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v21, objc_msgSend(v34, "code"));
          v19 = v12;
          v18 = 1;
        }
        else
        {
          v12 = 0;
        }
        sub_100039500((uint64_t)v41, (uint64_t)v12);
        _os_log_error_impl((void *)&_mh_execute_header, v23, v22, "Unable to get bootstrap status to see if cellular activation is supported: %{public}@", v41, 0xCu);
        if ((v18 & 1) != 0)

        if ((v20 & 1) != 0)
      }
      objc_storeStrong((id *)&v23, 0);
    }
    v17 = 0;
    v17 = v35 != v39->_cellularActivationMethod;
    v39->_cellularActivationMethod = v35;
    if (v17 || (byte_1002EECE8 & 1) == 0)
    {
      v16 = (os_log_t)(id)_BYLoggingFacility(v13);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v14 = -[BuddyActivationConfiguration _supportsCellularActivationForMethod:](v39, "_supportsCellularActivationForMethod:", v35);
        sub_100157674((uint64_t)v40, v14 & 1, v35);
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Supports Cellular Activation: %d (method is %ld)", v40, 0x12u);
      }
      objc_storeStrong((id *)&v16, 0);
      byte_1002EECE8 = 1;
    }
    -[BuddyActivationConfiguration setActivationMethodChanged:](v39, "setActivationMethodChanged:", 0);
    objc_storeStrong(&v25, 0);
    objc_storeStrong(&v33, 0);
    objc_storeStrong(&v34, 0);
  }
  return v39->_cellularActivationMethod;
}

- (BOOL)_supportsCellularActivationForMethod:(unint64_t)a3
{
  char v4;

  if (a3)
  {
    if (a3 - 1 < 2)
      v4 = 1;
  }
  else
  {
    v4 = 0;
  }
  return v4 & 1;
}

- (void)_activationStateChanged
{
  NSObject *v2;
  void **block;
  int v4;
  int v5;
  void (*v6)(uint64_t);
  void *v7;
  id v8[2];
  BuddyActivationConfiguration *v9;

  v9 = self;
  v8[1] = (id)a2;
  v2 = dispatch_get_global_queue(0, 0);
  block = _NSConcreteStackBlock;
  v4 = -1073741824;
  v5 = 0;
  v6 = sub_1001CDA68;
  v7 = &unk_100280730;
  v8[0] = v9;
  dispatch_async(v2, &block);

  objc_storeStrong(v8, 0);
}

- (void)_registerForActivationStateNotification
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_1001CDBE0, CFSTR("com.apple.mobile.lockdown.activation_state"), 0, CFNotificationSuspensionBehaviorCoalesce);
}

- (void)connectionStateChanged:(id)a3 connection:(int)a4 dataConnectionStatusInfo:(id)a5
{
  id v7;
  int v8;
  id location[2];
  BuddyActivationConfiguration *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = a4;
  v7 = 0;
  objc_storeStrong(&v7, a5);
  -[BuddyActivationConfiguration setActivationMethodChanged:](v10, "setActivationMethodChanged:", 1);
  -[BuddyActivationConfiguration notifyDelegatesConfigurationChanged:](v10, "notifyDelegatesConfigurationChanged:", 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)connectionAvailability:(id)a3 availableConnections:(id)a4
{
  id v5;
  id location[2];
  BuddyActivationConfiguration *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = 0;
  objc_storeStrong(&v5, a4);
  -[BuddyActivationConfiguration setActivationMethodChanged:](v7, "setActivationMethodChanged:", 1);
  -[BuddyActivationConfiguration notifyDelegatesConfigurationChanged:](v7, "notifyDelegatesConfigurationChanged:", 0);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)internetConnectionAvailability:(BOOL)a3
{
  -[BuddyActivationConfiguration setActivationMethodChanged:](self, "setActivationMethodChanged:", 1);
  -[BuddyActivationConfiguration notifyDelegatesConfigurationChanged:](self, "notifyDelegatesConfigurationChanged:", 0);
}

- (void)setHasActivated:(BOOL)a3
{
  self->_hasActivated = a3;
}

- (void)setCellularActivationMethod:(unint64_t)a3
{
  self->_cellularActivationMethod = a3;
}

- (NSMutableSet)delegates
{
  return (NSMutableSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDelegates:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (OS_dispatch_queue)delegateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDelegateQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (CoreTelephonyClient)telephonyClient
{
  return (CoreTelephonyClient *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTelephonyClient:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (OS_dispatch_queue)telephonyQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (void)setTelephonyQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (BYPreferencesController)buddyPreferencesExcludedFromBackup
{
  return self->_buddyPreferencesExcludedFromBackup;
}

- (void)setBuddyPreferencesExcludedFromBackup:(id)a3
{
  objc_storeStrong((id *)&self->_buddyPreferencesExcludedFromBackup, a3);
}

- (BOOL)activationMethodChanged
{
  return self->_activationMethodChanged;
}

- (void)setActivationMethodChanged:(BOOL)a3
{
  self->_activationMethodChanged = a3;
}

- (BOOL)initialActivationState
{
  return self->_initialActivationState;
}

- (void)setInitialActivationState:(BOOL)a3
{
  self->_initialActivationState = a3;
}

- (OS_dispatch_queue)activationStateQueue
{
  return self->_activationStateQueue;
}

- (void)setActivationStateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_activationStateQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationStateQueue, 0);
  objc_storeStrong((id *)&self->_buddyPreferencesExcludedFromBackup, 0);
  objc_storeStrong((id *)&self->_telephonyQueue, 0);
  objc_storeStrong((id *)&self->_telephonyClient, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
}

@end
