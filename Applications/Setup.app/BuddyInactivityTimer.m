@implementation BuddyInactivityTimer

- (BuddyInactivityTimer)init
{
  BuddyInactivityTimer *v2;
  id v4;
  objc_super v5;
  SEL v6;
  id location;

  v6 = a2;
  location = 0;
  v5.receiver = self;
  v5.super_class = (Class)BuddyInactivityTimer;
  location = -[BuddyInactivityTimer init](&v5, "init");
  objc_storeStrong(&location, location);
  if (location)
  {
    v4 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
    objc_msgSend(v4, "addObserver:selector:name:object:", location, "_batteryStateDidChange", UIDeviceBatteryStateDidChangeNotification, 0);
    objc_storeStrong(&v4, 0);
  }
  v2 = (BuddyInactivityTimer *)location;
  objc_storeStrong(&location, 0);
  return v2;
}

- (void)stop
{
  PCPersistentTimer *v2;
  BOOL v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  PCPersistentTimer *v7;
  _WORD v8[3];
  os_log_type_t v9;
  os_log_t oslog[2];
  BuddyInactivityTimer *v11;

  v11 = self;
  oslog[1] = (os_log_t)a2;
  v2 = -[BuddyInactivityTimer timer](self, "timer");
  v3 = v2 == 0;

  if (!v3)
  {
    oslog[0] = (os_log_t)(id)_BYLoggingFacility(v4);
    v9 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      v5 = oslog[0];
      v6 = v9;
      sub_100038C3C(v8);
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Stopping inactivity timer...", (uint8_t *)v8, 2u);
    }
    objc_storeStrong((id *)oslog, 0);
    v7 = -[BuddyInactivityTimer timer](v11, "timer");
    -[PCPersistentTimer invalidate](v7, "invalidate");

    -[BuddyInactivityTimer setTimer:](v11, "setTimer:", 0);
  }
}

- (void)start
{
  PCPersistentTimer *v2;
  UIApplication *v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  UIDevice *v8;
  id v9;
  uint64_t v10;
  UIDevice *v11;
  NSObject *v12;
  void **block;
  int v14;
  int v15;
  void (*v16)(uint64_t);
  void *v17;
  BuddyInactivityTimer *v18;
  os_log_type_t v19;
  os_log_t v20;
  uint8_t buf[15];
  os_log_type_t v22;
  os_log_t oslog;
  id v24;
  SEL v25;
  BuddyInactivityTimer *v26;
  uint8_t v27[24];

  v26 = self;
  v25 = a2;
  v2 = -[BuddyInactivityTimer timer](self, "timer");

  if (!v2)
  {
    v3 = +[UIApplication sharedApplication](UIApplication, "sharedApplication");
    v4 = -[UIApplication applicationState](v3, "applicationState");

    v24 = v4;
    if (v4 == (id)2 || v24 == (id)1)
    {
      v8 = +[UIDevice currentDevice](UIDevice, "currentDevice");
      v9 = -[UIDevice batteryState](v8, "batteryState");

      if (v9 == (id)1)
      {
        v12 = dispatch_get_global_queue(0, 0);
        block = _NSConcreteStackBlock;
        v14 = -1073741824;
        v15 = 0;
        v16 = sub_10012591C;
        v17 = &unk_100280730;
        v18 = v26;
        dispatch_async(v12, &block);

        objc_storeStrong((id *)&v18, 0);
      }
      else
      {
        v20 = (os_log_t)(id)_BYLoggingFacility(v10);
        v19 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v11 = +[UIDevice currentDevice](UIDevice, "currentDevice");
          sub_1000342B4((uint64_t)v27, -[UIDevice batteryState](v11, "batteryState"));
          _os_log_impl((void *)&_mh_execute_header, v20, v19, "Device is not unplugged (%ld); not starting inactivity timer...",
            v27,
            0xCu);

        }
        objc_storeStrong((id *)&v20, 0);
      }
    }
    else
    {
      oslog = (os_log_t)(id)_BYLoggingFacility(v5);
      v22 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        v6 = oslog;
        v7 = v22;
        sub_100038C3C(buf);
        _os_log_impl((void *)&_mh_execute_header, v6, v7, "Setup is still active; not starting inactivity timer...",
          buf,
          2u);
      }
      objc_storeStrong((id *)&oslog, 0);
    }
  }
}

- (void)_timerFired:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  PCPersistentTimer *v6;
  FMDFMIPManager *v7;
  void **v8;
  int v9;
  int v10;
  void (*v11)(NSObject *, void *, void *);
  void *v12;
  BuddyInactivityTimer *v13;
  uint8_t buf[15];
  os_log_type_t v15;
  id v16;
  id location[2];
  BuddyInactivityTimer *v18;

  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = (id)_BYLoggingFacility(v3);
  v15 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v16;
    v5 = v15;
    sub_100038C3C(buf);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Inactivity timer fired; determining if we should shutdown...",
      buf,
      2u);
  }
  objc_storeStrong(&v16, 0);
  v6 = -[BuddyInactivityTimer timer](v18, "timer");
  -[PCPersistentTimer invalidate](v6, "invalidate");

  -[BuddyInactivityTimer setTimer:](v18, "setTimer:", 0);
  v7 = +[FMDFMIPManager sharedInstance](FMDFMIPManager, "sharedInstance");
  v8 = _NSConcreteStackBlock;
  v9 = -1073741824;
  v10 = 0;
  v11 = sub_100125EF8;
  v12 = &unk_100283310;
  v13 = v18;
  -[FMDFMIPManager activationLockInfoFromDeviceWithCompletion:](v7, "activationLockInfoFromDeviceWithCompletion:", &v8);

  objc_storeStrong((id *)&v13, 0);
  objc_storeStrong(location, 0);
}

- (void)_batteryStateDidChange
{
  -[BuddyInactivityTimer stop](self, "stop", a2);
  -[BuddyInactivityTimer start](self, "start");
}

- (void)_removePowerLog
{
  NSObject *v2;
  os_log_type_t v3;
  _BOOL8 v4;
  NSObject *v5;
  os_log_type_t v6;
  NSObject *v7;
  os_log_type_t v8;
  _WORD v9[3];
  char v10;
  os_log_t v11;
  uint8_t v12[7];
  os_log_type_t v13;
  os_log_t v14;
  uint8_t buf[7];
  os_log_type_t v16;
  os_log_t oslog[3];

  oslog[2] = &self->super;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility(self);
  v16 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = oslog[0];
    v3 = v16;
    sub_100038C3C(buf);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Removing power log...", buf, 2u);
  }
  objc_storeStrong((id *)oslog, 0);
  v4 = +[BuddyPowerLog removeLog](BuddyPowerLog, "removeLog");
  if (v4)
  {
    v14 = (os_log_t)(id)_BYLoggingFacility(v4);
    v13 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v5 = v14;
      v6 = v13;
      sub_100038C3C(v12);
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Successfully removed power log", v12, 2u);
    }
    objc_storeStrong((id *)&v14, 0);
  }
  else
  {
    v11 = (os_log_t)(id)_BYLoggingFacility(v4);
    v10 = 16;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v7 = v11;
      v8 = v10;
      sub_100038C3C(v9);
      _os_log_error_impl((void *)&_mh_execute_header, v7, v8, "Failed to remove power log", (uint8_t *)v9, 2u);
    }
    objc_storeStrong((id *)&v11, 0);
  }
}

- (void)_enableShelfLifeMode
{
  void *v2;
  NSObject *v3;
  os_log_type_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  NSObject *v14;
  os_log_type_t v15;
  _WORD v16[3];
  char v17;
  os_log_t v18;
  uint8_t v19[15];
  os_log_type_t v20;
  os_log_t v21;
  id v22;
  uint8_t v23[15];
  char v24;
  os_log_t v25;
  char v26;
  int v27;
  uint8_t v28[7];
  os_log_type_t v29;
  os_log_t oslog;
  id v31;
  id v32;
  uint8_t buf[15];
  os_log_type_t v34;
  id location[4];

  location[3] = self;
  location[2] = (id)a2;
  v2 = (void *)MGGetProductType(self, a2);
  location[1] = v2;
  if (v2 == (void *)1169082144
    || v2 == (void *)3001488778
    || v2 == (void *)3885279870
    || v2 == (void *)4201643249)
  {
    location[0] = (id)_BYLoggingFacility(v2);
    v34 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
    {
      v3 = location[0];
      v4 = v34;
      sub_100038C3C(buf);
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "Not enabling shelf life mode; hardware supports older variant",
        buf,
        2u);
    }
    objc_storeStrong(location, 0);
  }
  else
  {
    v32 = objc_alloc_init(BuddySMC);
    v31 = CFSTR("BCSL");
    v5 = objc_msgSend(v32, "hasKey:", CFSTR("BCSL"));
    if ((v5 & 1) != 0)
    {
      v26 = 1;
      v8 = objc_msgSend(v32, "writeNumber:forKey:", 1, CFSTR("BCSL"));
      if ((v8 & 1) != 0)
      {
        v22 = objc_msgSend(v32, "numberForKey:", CFSTR("BCSL"));
        v11 = objc_msgSend(v22, "intValue");
        if ((_DWORD)v11 == 2)
        {
          v21 = (os_log_t)(id)_BYLoggingFacility(v11);
          v20 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            v12 = v21;
            v13 = v20;
            sub_100038C3C(v19);
            _os_log_impl((void *)&_mh_execute_header, v12, v13, "Successfully enabled shelf life mode", v19, 2u);
          }
          objc_storeStrong((id *)&v21, 0);
        }
        else
        {
          v18 = (os_log_t)(id)_BYLoggingFacility(v11);
          v17 = 16;
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            v14 = v18;
            v15 = v17;
            sub_100038C3C(v16);
            _os_log_error_impl((void *)&_mh_execute_header, v14, v15, "Failed to validate shelf life mode was enabled", (uint8_t *)v16, 2u);
          }
          objc_storeStrong((id *)&v18, 0);
        }
        objc_storeStrong(&v22, 0);
        v27 = 0;
      }
      else
      {
        v25 = (os_log_t)(id)_BYLoggingFacility(v8);
        v24 = 16;
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v9 = v25;
          v10 = v24;
          sub_100038C3C(v23);
          _os_log_error_impl((void *)&_mh_execute_header, v9, v10, "Failed to enable shelf life mode", v23, 2u);
        }
        objc_storeStrong((id *)&v25, 0);
        v27 = 1;
      }
    }
    else
    {
      oslog = (os_log_t)(id)_BYLoggingFacility(v5);
      v29 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        v6 = oslog;
        v7 = v29;
        sub_100038C3C(v28);
        _os_log_impl((void *)&_mh_execute_header, v6, v7, "Not enabling shelf life mode; hardware does not support it",
          v28,
          2u);
      }
      objc_storeStrong((id *)&oslog, 0);
      v27 = 1;
    }
    objc_storeStrong(&v31, 0);
    objc_storeStrong(&v32, 0);
  }
}

- (PCPersistentTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
}

@end
