@implementation PearlSplashController

- (PearlSplashController)init
{
  PearlSplashController *v2;
  objc_super v4;
  SEL v5;
  id location;

  v5 = a2;
  location = 0;
  v4.receiver = self;
  v4.super_class = (Class)PearlSplashController;
  location = -[PearlSplashController init](&v4, "init");
  objc_storeStrong(&location, location);
  if (location)
    objc_msgSend(location, "setFaceIDViewControllerDelegate:", location);
  v2 = (PearlSplashController *)location;
  objc_storeStrong(&location, 0);
  return v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  BYPaneFeatureAnalyticsManager *v3;
  objc_super v4;
  BOOL v5;
  SEL v6;
  PearlSplashController *v7;

  v7 = self;
  v6 = a2;
  v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)PearlSplashController;
  -[PearlSplashController viewWillAppear:](&v4, "viewWillAppear:", a3);
  v3 = -[PearlSplashController paneFeatureAnalyticsManager](v7, "paneFeatureAnalyticsManager");
  -[BYPaneFeatureAnalyticsManager clearActionForFeature:](v3, "clearActionForFeature:", 13);

}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSetupBiometric;
}

+ (unint64_t)applicableDispositions
{
  return 20;
}

+ (BOOL)hiddenFromStoreDemoMode
{
  return 1;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  id v3;
  unsigned __int8 v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  NSObject *v8;
  void **block;
  int v10;
  int v11;
  void (*v12)(uint64_t);
  void *v13;
  PearlSplashController *v14;
  id v15;
  char v16;
  int v17;
  uint8_t buf[7];
  char v19;
  os_log_t oslog;
  char v21;
  id location[2];
  PearlSplashController *v23;

  v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[PearlSplashController capabilities](v23, "capabilities");
  v4 = objc_msgSend(v3, "supportsPearl");

  v21 = v4 & 1;
  if ((v4 & 1) != 0)
  {
    v8 = dispatch_get_global_queue(25, 0);
    block = _NSConcreteStackBlock;
    v10 = -1073741824;
    v11 = 0;
    v12 = sub_10010B3DC;
    v13 = &unk_100280EB8;
    v14 = v23;
    v16 = v21 & 1;
    v15 = location[0];
    dispatch_async(v8, &block);

    objc_storeStrong(&v15, 0);
    objc_storeStrong((id *)&v14, 0);
    v17 = 0;
  }
  else
  {
    if (location[0])
      v5 = (*((uint64_t (**)(id, _QWORD))location[0] + 2))(location[0], 0);
    oslog = (os_log_t)(id)_BYLoggingFacility(v5);
    v19 = 2;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      v6 = oslog;
      v7 = v19;
      sub_100038C3C(buf);
      _os_log_debug_impl((void *)&_mh_execute_header, v6, v7, "PearlSplashController: Hardware does not support Face ID", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    v17 = 1;
  }
  objc_storeStrong(location, 0);
}

- (void)startOver
{
  -[PearlSplashController willStartOver](self, "willStartOver", a2, self);
}

- (void)controllerWasPopped
{
  objc_super v2;
  SEL v3;
  PearlSplashController *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)PearlSplashController;
  -[PearlSplashController controllerWasPopped](&v2, "controllerWasPopped");
}

- (id)passcodeForFaceIDViewController:(id)a3
{
  id v3;
  id v4;
  id location[2];
  PearlSplashController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[PearlSplashController passcodeCacheManager](v7, "passcodeCacheManager");
  v4 = objc_msgSend(v3, "cachedPasscode");

  objc_storeStrong(location, 0);
  return v4;
}

- (void)faceIDViewController:(id)a3 didCompleteWithResult:(unint64_t)a4 pushedViewControllers:(id)a5
{
  id v7;
  id v8;
  BYFlowSkipController *v9;
  id v10;
  id v11;
  NSPredicate *v12;
  id v13;
  BFFFlowItemDelegate *v14;
  BYFlowSkipController *v15;
  BFFFlowItemDelegate *v16;
  NSNumber *v17;
  id v18;
  BYPaneFeatureAnalyticsManager *v19;
  BFFFlowItemDelegate *v20;
  id v21;
  id v22;
  os_log_type_t v23;
  os_log_t oslog;
  id v25;
  id v26;
  id v27;
  unint64_t v28;
  id location[2];
  PearlSplashController *v30;
  uint8_t buf[24];

  v30 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v28 = a4;
  v27 = 0;
  objc_storeStrong(&v27, a5);
  if (-[PearlSplashController enrollmentConfiguration](v30, "enrollmentConfiguration") == (id)3
    || -[PearlSplashController enrollmentConfiguration](v30, "enrollmentConfiguration") == (id)1)
  {
    v7 = -[PearlSplashController buddyPreferences](v30, "buddyPreferences");
    objc_msgSend(v7, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("FaceIDPeriocularPresented"));

  }
  v8 = objc_msgSend(v27, "mutableCopy");
  v26 = v8;
  if (v28 && v28 != 3)
  {
    if (v28 == 1)
    {
      if (-[PearlSplashController enrollmentConfiguration](v30, "enrollmentConfiguration") != (id)3)
      {
        v15 = -[PearlSplashController flowSkipController](v30, "flowSkipController");
        -[BYFlowSkipController didSkipFlow:](v15, "didSkipFlow:", BYFlowSkipIdentifierFaceID);

      }
      objc_msgSend(v26, "removeObject:", v30);
      v16 = -[PearlSplashController delegate](v30, "delegate");
      -[BFFFlowItemDelegate removeViewControllersOnNextPush:](v16, "removeViewControllersOnNextPush:", v26);

    }
    else
    {
      oslog = (os_log_t)(id)_BYLoggingFacility(v8);
      v23 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        sub_1000342B4((uint64_t)buf, v28);
        _os_log_impl((void *)&_mh_execute_header, oslog, v23, "PearlSplashController got unexpected BFFFaceIDViewController completion result %lu", buf, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
    }
  }
  else
  {
    v9 = -[PearlSplashController flowSkipController](v30, "flowSkipController");
    -[BYFlowSkipController didCompleteFlow:](v9, "didCompleteFlow:", BYFlowSkipIdentifierFaceID);

    v10 = -[PearlSplashController navigationController](v30, "navigationController");
    v11 = objc_msgSend(v10, "viewControllers");
    v12 = +[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &stru_100282FB8);
    v13 = objc_msgSend(v11, "filteredArrayUsingPredicate:", v12);
    v25 = objc_msgSend(v13, "firstObject");

    if (v25)
      objc_msgSend(v26, "addObject:", v25);
    v14 = -[PearlSplashController delegate](v30, "delegate");
    -[BFFFlowItemDelegate removeViewControllersOnNextPush:](v14, "removeViewControllersOnNextPush:", v26);

    objc_storeStrong(&v25, 0);
  }
  v22 = &off_100290E20;
  if (-[PearlSplashController enrollmentConfiguration](v30, "enrollmentConfiguration") == (id)3)
    objc_storeStrong(&v22, &off_100290E38);
  v21 = v22;
  if (!v28)
  {
    v17 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)-[PearlSplashController enrollmentConfiguration](v30, "enrollmentConfiguration") + 1000);
    v18 = v21;
    v21 = v17;

  }
  v19 = -[PearlSplashController paneFeatureAnalyticsManager](v30, "paneFeatureAnalyticsManager");
  -[BYPaneFeatureAnalyticsManager recordActionWithValue:previousValue:forFeature:](v19, "recordActionWithValue:previousValue:forFeature:", v21, v22, 13);

  v20 = -[PearlSplashController delegate](v30, "delegate");
  -[BFFFlowItemDelegate flowItemDone:](v20, "flowItemDone:", v30);

  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(location, 0);
}

- (MCProfileConnection)managedConfiguration
{
  return self->managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->managedConfiguration, a3);
}

- (BYFlowSkipController)flowSkipController
{
  return self->flowSkipController;
}

- (void)setFlowSkipController:(id)a3
{
  objc_storeStrong((id *)&self->flowSkipController, a3);
}

- (BYPaneFeatureAnalyticsManager)paneFeatureAnalyticsManager
{
  return self->paneFeatureAnalyticsManager;
}

- (void)setPaneFeatureAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->paneFeatureAnalyticsManager, a3);
}

- (BFFFlowItemDelegate)delegate
{
  return (BFFFlowItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->paneFeatureAnalyticsManager, 0);
  objc_storeStrong((id *)&self->flowSkipController, 0);
  objc_storeStrong((id *)&self->managedConfiguration, 0);
}

@end
