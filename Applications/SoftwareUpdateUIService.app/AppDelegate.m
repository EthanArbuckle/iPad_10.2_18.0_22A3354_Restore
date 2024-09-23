@implementation AppDelegate

- (void)applicationDidFinishLaunching:(id)a3
{
  NSObject *log;
  os_log_type_t type;
  uint8_t v5[15];
  os_log_type_t v6;
  id v7;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = (id)SUSUILog();
  v6 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
  {
    log = v7;
    type = v6;
    sub_1000020A4(v5);
    _os_log_impl((void *)&_mh_execute_header, log, type, "App did finish launching.", v5, 2u);
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v6;
  id v7;
  id v8;
  id v11;
  id v12;
  id v13;
  id location[3];
  uint8_t v15[24];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = 0;
  objc_storeStrong(&v13, a4);
  v12 = 0;
  objc_storeStrong(&v12, a5);
  v11 = (id)SUSUILog();
  if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
  {
    sub_1000061C4((uint64_t)v15, (uint64_t)"-[AppDelegate application:configurationForConnectingSceneSession:options:]");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v11, OS_LOG_TYPE_DEFAULT, "%s", v15, 0xCu);
  }
  objc_storeStrong(&v11, 0);
  v6 = objc_alloc((Class)UISceneConfiguration);
  v7 = objc_msgSend(v13, "role");
  v8 = objc_msgSend(v6, "initWithName:sessionRole:", CFSTR("Default Configuration"));

  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  return v8;
}

- (void)application:(id)a3 didDiscardSceneSessions:(id)a4
{
  os_log_t oslog;
  id v6;
  id location[3];
  uint8_t v8[24];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  oslog = (os_log_t)(id)SUSUILog();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_1000061C4((uint64_t)v8, (uint64_t)"-[AppDelegate application:didDiscardSceneSessions:]");
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "%s", v8, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

@end
