@implementation BuddySIMManager

+ (id)sharedManager
{
  id location;
  dispatch_once_t *v4;

  v4 = (dispatch_once_t *)&unk_1002EEC10;
  location = 0;
  objc_storeStrong(&location, &stru_1002841E8);
  if (*v4 != -1)
    dispatch_once(v4, location);
  objc_storeStrong(&location, 0);
  return (id)qword_1002EEC18;
}

- (BuddySIMManager)init
{
  BuddySIMManager *v2;
  id v3;
  BuddySIMManager *v4;
  objc_super v6;
  SEL v7;
  id location;

  v7 = a2;
  location = 0;
  v6.receiver = self;
  v6.super_class = (Class)BuddySIMManager;
  v2 = -[BuddySIMManager init](&v6, "init");
  location = v2;
  objc_storeStrong(&location, v2);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc((Class)BYTelephonyStateNotifier), "initForNotifying");
    objc_msgSend(location, "setTelephonyStateNotifier:", v3);

  }
  v4 = (BuddySIMManager *)location;
  objc_storeStrong(&location, 0);
  return v4;
}

- (void)allowSIMUnlock
{
  NSObject *v2;
  os_log_type_t v3;
  BYTelephonyStateNotifier *v4;
  _WORD v5[3];
  os_log_type_t v6;
  os_log_t oslog[2];
  BuddySIMManager *v8;

  v8 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility(self);
  v6 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = oslog[0];
    v3 = v6;
    sub_100038C3C(v5);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Allowing SIM unlock...", (uint8_t *)v5, 2u);
  }
  objc_storeStrong((id *)oslog, 0);
  v4 = -[BuddySIMManager telephonyStateNotifier](v8, "telephonyStateNotifier");
  -[BYTelephonyStateNotifier notifySIMUnlockStateChangedTo:](v4, "notifySIMUnlockStateChangedTo:", 1);

}

- (void)disallowSIMUnlock
{
  NSObject *v2;
  os_log_type_t v3;
  BYTelephonyStateNotifier *v4;
  _WORD v5[3];
  os_log_type_t v6;
  os_log_t oslog[2];
  BuddySIMManager *v8;

  v8 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility(self);
  v6 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = oslog[0];
    v3 = v6;
    sub_100038C3C(v5);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Disallowing SIM unlock...", (uint8_t *)v5, 2u);
  }
  objc_storeStrong((id *)oslog, 0);
  v4 = -[BuddySIMManager telephonyStateNotifier](v8, "telephonyStateNotifier");
  -[BYTelephonyStateNotifier notifySIMUnlockStateChangedTo:](v4, "notifySIMUnlockStateChangedTo:", 2);

}

- (BYTelephonyStateNotifier)telephonyStateNotifier
{
  return self->_telephonyStateNotifier;
}

- (void)setTelephonyStateNotifier:(id)a3
{
  objc_storeStrong((id *)&self->_telephonyStateNotifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telephonyStateNotifier, 0);
}

@end
