@implementation BuddySceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  unint64_t i;
  id v16;
  id v17;
  unsigned __int8 v18;
  SetupController *v19;
  uint64_t v20;
  SetupController *v21;
  os_log_t v22;
  char v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  void **v29;
  int v30;
  int v31;
  SetupController *(*v32)(uint64_t);
  void *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  int v37;
  int v38;
  char v39;
  os_log_type_t v40;
  os_log_t oslog;
  id v42;
  id v43;
  id location[3];
  uint8_t v45[16];
  uint8_t v46[128];
  uint8_t buf[56];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v43 = 0;
  objc_storeStrong(&v43, a4);
  v42 = 0;
  objc_storeStrong(&v42, a5);
  oslog = (os_log_t)(id)_BYLoggingFacility(v7);
  v40 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v8 = location[0];
    v9 = v43;
    v10 = v42;
    v11 = objc_msgSend(v42, "URLContexts");
    sub_1000D9634((uint64_t)buf, (uint64_t)v8, (uint64_t)v9, (uint64_t)v10, (uint64_t)v11);
    _os_log_impl((void *)&_mh_execute_header, oslog, v40, "scene: %@ willConnectToSession: %@ options: %@ URL contexts %@", buf, 0x2Au);

  }
  objc_storeStrong((id *)&oslog, 0);
  v35 = 0;
  v36 = &v35;
  v37 = 0x20000000;
  v38 = 32;
  v39 = 0;
  v29 = _NSConcreteStackBlock;
  v30 = -1073741824;
  v31 = 0;
  v32 = sub_1000D9664;
  v33 = &unk_100282768;
  v34 = &v35;
  +[BuddyApplicationAndSceneSharedStorage ensureSetupControllerWithFactoryBlock:](BuddyApplicationAndSceneSharedStorage, "ensureSetupControllerWithFactoryBlock:", &v29);
  v27 = 0u;
  v26 = 0u;
  v25 = 0u;
  v24 = 0u;
  v12 = objc_msgSend(v42, "URLContexts");
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v46, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i < (unint64_t)v13; ++i)
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v12);
        v28 = *(id *)(*((_QWORD *)&v24 + 1) + 8 * i);
        v16 = objc_msgSend(v28, "URL");
        v17 = objc_msgSend(v16, "absoluteString");
        v18 = objc_msgSend(v17, "isEqualToString:", BYSetupAssistantLaunchMigrationSourceUIURL);

        if ((v18 & 1) != 0)
        {
          v19 = +[BuddyApplicationAndSceneSharedStorage setupController](BuddyApplicationAndSceneSharedStorage, "setupController");
          -[SetupController setLaunchedForMigration:](v19, "setLaunchedForMigration:", 1);

        }
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v46, 16);
    }
    while (v13);
  }

  v23 = 0;
  v23 = (*((_BYTE *)v36 + 24) ^ 1) & 1;
  if ((v23 & 1) != 0)
  {
    v22 = (os_log_t)(id)_BYLoggingFacility(v20);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      sub_1000806F4((uint64_t)v45, (uint64_t)"-[BuddySceneDelegate scene:willConnectToSession:options:]");
      _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s was called multiple times!", v45, 0xCu);
    }
    objc_storeStrong((id *)&v22, 0);
  }
  else
  {
    v21 = +[BuddyApplicationAndSceneSharedStorage setupController](BuddyApplicationAndSceneSharedStorage, "setupController");
    -[SetupController runWithScene:](v21, "runWithScene:", location[0]);

  }
  _Block_object_dispose(&v35, 8);
  objc_storeStrong(&v42, 0);
  objc_storeStrong(&v43, 0);
  objc_storeStrong(location, 0);
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  SetupController *v5;
  unsigned __int8 v6;
  id v7;
  id v8;
  uint64_t v9;
  unint64_t i;
  id v11;
  id v12;
  char v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  _WORD v17[7];
  char v18;
  os_log_t oslog;
  _QWORD __b[8];
  id v21;
  char v22;
  id v23;
  id location[3];
  _BYTE v25[128];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v23 = 0;
  objc_storeStrong(&v23, a4);
  v5 = +[BuddyApplicationAndSceneSharedStorage setupController](BuddyApplicationAndSceneSharedStorage, "setupController");
  v6 = -[SetupController launchedForMigration](v5, "launchedForMigration");

  v22 = v6 & 1;
  memset(__b, 0, sizeof(__b));
  v7 = v23;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", __b, v25, 16);
  if (v8)
  {
    v9 = *(_QWORD *)__b[2];
    do
    {
      for (i = 0; i < (unint64_t)v8; ++i)
      {
        if (*(_QWORD *)__b[2] != v9)
          objc_enumerationMutation(v7);
        v21 = *(id *)(__b[1] + 8 * i);
        v11 = objc_msgSend(v21, "URL");
        v12 = objc_msgSend(v11, "absoluteString");
        v13 = 0;
        if ((objc_msgSend(v12, "isEqualToString:", BYSetupAssistantLaunchMigrationSourceUIURL) & 1) != 0)
          v13 = v22 ^ 1;

        if ((v13 & 1) != 0)
        {
          oslog = (os_log_t)(id)_BYLoggingFacility(v14);
          v18 = 17;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_FAULT))
          {
            v15 = oslog;
            v16 = v18;
            sub_100038C3C(v17);
            _os_log_fault_impl((void *)&_mh_execute_header, v15, v16, "Attempted to launch Setup for source migration after it's already running", (uint8_t *)v17, 2u);
          }
          objc_storeStrong((id *)&oslog, 0);
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", __b, v25, 16);
    }
    while (v8);
  }

  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
}

- (void)sceneWillResignActive:(id)a3
{
  SetupController *v3;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = +[BuddyApplicationAndSceneSharedStorage setupController](BuddyApplicationAndSceneSharedStorage, "setupController");
  -[SetupController willResignActive](v3, "willResignActive");

  objc_storeStrong(location, 0);
}

- (void)sceneDidBecomeActive:(id)a3
{
  SetupController *v3;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = +[BuddyApplicationAndSceneSharedStorage setupController](BuddyApplicationAndSceneSharedStorage, "setupController");
  -[SetupController didBecomeActive](v3, "didBecomeActive");

  objc_storeStrong(location, 0);
}

- (void)sceneDidEnterBackground:(id)a3
{
  SetupController *v3;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = +[BuddyApplicationAndSceneSharedStorage setupController](BuddyApplicationAndSceneSharedStorage, "setupController");
  -[SetupController didEnterBackground](v3, "didEnterBackground");

  objc_storeStrong(location, 0);
}

@end
