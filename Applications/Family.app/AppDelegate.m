@implementation AppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  return 1;
}

- (void)applicationDidEnterBackground:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = _FALogSystem(self, a2, a3);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Family app in background", v5, 2u);
  }

}

- (void)applicationWillEnterForeground:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = _FALogSystem(self, a2, a3);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Family app in foreground", v5, 2u);
  }

}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = objc_alloc((Class)UISceneConfiguration);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "role"));

  v8 = objc_msgSend(v6, "initWithName:sessionRole:", CFSTR("Default Configuration"), v7);
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentFamilyCircleStateController, 0);
}

@end
