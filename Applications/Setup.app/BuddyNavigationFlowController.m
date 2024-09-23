@implementation BuddyNavigationFlowController

+ (void)preheat
{
  +[BuddyWiFiController preheat](BuddyWiFiController, "preheat", a2, a1);
  sub_100063984();
}

- (BuddyNavigationFlowController)initWithNavigator:(id)a3 usingRestoreProvider:(id)a4 usingFlowDiverter:(id)a5 environment:(id)a6
{
  id v9;
  BuddyNavigationFlowController *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  dispatch_queue_t v18;
  void *v19;
  BuddyNavigationFlowController *v20;
  objc_super v22;
  id v23;
  id v24;
  id obj;
  id location[2];
  id v27;

  v27 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  obj = 0;
  objc_storeStrong(&obj, a4);
  v24 = 0;
  objc_storeStrong(&v24, a5);
  v23 = 0;
  objc_storeStrong(&v23, a6);
  v9 = v27;
  v27 = 0;
  v22.receiver = v9;
  v22.super_class = (Class)BuddyNavigationFlowController;
  v10 = -[BuddyNavigationFlowController init](&v22, "init");
  v27 = v10;
  objc_storeStrong(&v27, v10);
  if (v10)
  {
    objc_storeStrong((id *)v27 + 10, location[0]);
    objc_msgSend(*((id *)v27 + 10), "addDelegateObserver:", v27);
    objc_storeWeak((id *)v27 + 11, obj);
    v11 = objc_alloc((Class)BFFFlowStarter);
    v12 = objc_msgSend(v11, "initWithFlowDiverter:", v24);
    v13 = (void *)*((_QWORD *)v27 + 12);
    *((_QWORD *)v27 + 12) = v12;

    v14 = objc_alloc_init((Class)NSMutableArray);
    v15 = (void *)*((_QWORD *)v27 + 13);
    *((_QWORD *)v27 + 13) = v14;

    v16 = objc_alloc_init((Class)NSMutableArray);
    v17 = (void *)*((_QWORD *)v27 + 19);
    *((_QWORD *)v27 + 19) = v16;

    objc_storeStrong((id *)v27 + 18, v23);
    v18 = dispatch_queue_create("Navigation Queue", 0);
    v19 = (void *)*((_QWORD *)v27 + 22);
    *((_QWORD *)v27 + 22) = v18;

    dispatch_suspend(*((dispatch_object_t *)v27 + 22));
  }
  v20 = (BuddyNavigationFlowController *)v27;
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&obj, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v27, 0);
  return v20;
}

- (BuddyNavigationFlowController)initWithNavigationController:(id)a3 usingRestoreProvider:(id)a4 usingFlowDiverter:(id)a5 environment:(id)a6
{
  BuddyNavigationFlowNavigator *v9;
  id v10;
  BuddyNavigationFlowController *v11;
  id v13;
  id v14;
  id v15;
  id v16;
  id location[2];
  id v18;

  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = 0;
  objc_storeStrong(&v16, a4);
  v15 = 0;
  objc_storeStrong(&v15, a5);
  v14 = 0;
  objc_storeStrong(&v14, a6);
  v9 = [BuddyNavigationFlowNavigator alloc];
  v13 = -[BuddyNavigationFlowNavigator initWithNavigationController:](v9, "initWithNavigationController:", location[0]);
  v10 = v18;
  v18 = 0;
  v18 = objc_msgSend(v10, "initWithNavigator:usingRestoreProvider:usingFlowDiverter:environment:", v13, v16, v15, v14);
  v11 = (BuddyNavigationFlowController *)v18;
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v18, 0);
  return v11;
}

- (void)setupInitialFlowWithCompletion:(id)a3
{
  BuddyWiFiController *v3;
  BuddyNavigationFlowController *v4;
  BuddyWiFiController *v5;
  BuddyNavigationFlowController *v6;
  BuddyWiFiController *v7;
  BYEnvironment *v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  BFFFlowStarter *v12;
  void **v13;
  int v14;
  int v15;
  void (*v16)(id *);
  void *v17;
  BuddyNavigationFlowController *v18;
  id v19;
  uint8_t buf[15];
  os_log_type_t v21;
  os_log_t oslog;
  id location[2];
  BuddyNavigationFlowController *v24;

  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = objc_alloc_init(BuddyWiFiController);
  -[BuddyNavigationFlowController setWifiController:](v24, "setWifiController:", v3);

  v4 = v24;
  v5 = -[BuddyNavigationFlowController wifiController](v24, "wifiController");
  -[BuddyWiFiController setDelegate:](v5, "setDelegate:", v4);

  v6 = v24;
  v7 = -[BuddyNavigationFlowController wifiController](v24, "wifiController");
  v8 = -[BuddyNavigationFlowController environment](v24, "environment");
  -[BuddyNavigationFlowController _injectDependencies:withEnvironment:](v6, "_injectDependencies:withEnvironment:", v7, v8);

  oslog = (os_log_t)(id)_BYLoggingFacility(v9);
  v21 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v10 = oslog;
    v11 = v21;
    sub_100038C3C(buf);
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Preparing flow starter...", buf, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v12 = -[BuddyNavigationFlowController flowStarter](v24, "flowStarter");
  v13 = _NSConcreteStackBlock;
  v14 = -1073741824;
  v15 = 0;
  v16 = sub_100063FA8;
  v17 = &unk_1002806E0;
  v18 = v24;
  v19 = location[0];
  -[BFFFlowStarter prepareWithCompletion:](v12, "prepareWithCompletion:", &v13);

  objc_storeStrong(&v19, 0);
  objc_storeStrong((id *)&v18, 0);
  objc_storeStrong(location, 0);
}

- (void)beginTapFreeSetUp
{
  OS_dispatch_queue *v2;
  void **block;
  int v4;
  int v5;
  void (*v6)(id *);
  void *v7;
  id v8[2];
  BuddyNavigationFlowController *v9;

  v9 = self;
  v8[1] = (id)a2;
  v2 = -[BuddyNavigationFlowController navigationQueue](self, "navigationQueue");
  block = _NSConcreteStackBlock;
  v4 = -1073741824;
  v5 = 0;
  v6 = sub_1000644CC;
  v7 = &unk_100280730;
  v8[0] = v9;
  dispatch_async((dispatch_queue_t)v2, &block);

  objc_storeStrong(v8, 0);
}

- (void)proceedPastLanguageLocalePane
{
  OS_dispatch_queue *v2;
  void **block;
  int v4;
  int v5;
  void (*v6)(id *);
  void *v7;
  id v8[2];
  BuddyNavigationFlowController *v9;

  v9 = self;
  v8[1] = (id)a2;
  v2 = -[BuddyNavigationFlowController navigationQueue](self, "navigationQueue");
  block = _NSConcreteStackBlock;
  v4 = -1073741824;
  v5 = 0;
  v6 = sub_100064878;
  v7 = &unk_100280730;
  v8[0] = v9;
  dispatch_async((dispatch_queue_t)v2, &block);

  objc_storeStrong(v8, 0);
}

- (void)proceedPastAppearancePane
{
  OS_dispatch_queue *v2;
  void **block;
  int v4;
  int v5;
  void (*v6)(id *);
  void *v7;
  id v8[2];
  BuddyNavigationFlowController *v9;

  v9 = self;
  v8[1] = (id)a2;
  v2 = -[BuddyNavigationFlowController navigationQueue](self, "navigationQueue");
  block = _NSConcreteStackBlock;
  v4 = -1073741824;
  v5 = 0;
  v6 = sub_100064AC8;
  v7 = &unk_100280730;
  v8[0] = v9;
  dispatch_async((dispatch_queue_t)v2, &block);

  objc_storeStrong(v8, 0);
}

- (void)setUpByComputer
{
  OS_dispatch_queue *v2;
  void **block;
  int v4;
  int v5;
  void (*v6)(id *);
  void *v7;
  id v8[2];
  BuddyNavigationFlowController *v9;

  v9 = self;
  v8[1] = (id)a2;
  v2 = -[BuddyNavigationFlowController navigationQueue](self, "navigationQueue");
  block = _NSConcreteStackBlock;
  v4 = -1073741824;
  v5 = 0;
  v6 = sub_100064D18;
  v7 = &unk_100280730;
  v8[0] = v9;
  dispatch_async((dispatch_queue_t)v2, &block);

  objc_storeStrong(v8, 0);
}

- (void)handleDebugGesture
{
  NSMutableArray *v2;
  id v3;
  char v4;
  NSMutableArray *v5;
  id v6;

  v2 = -[BuddyNavigationFlowController buddyControllers](self, "buddyControllers", a2);
  v3 = -[NSMutableArray lastObject](v2, "lastObject");
  v4 = objc_opt_respondsToSelector(v3, "handleDebugGesture");

  if ((v4 & 1) != 0)
  {
    v5 = -[BuddyNavigationFlowController buddyControllers](self, "buddyControllers");
    v6 = -[NSMutableArray lastObject](v5, "lastObject");
    objc_msgSend(v6, "handleDebugGesture");

  }
}

- (BOOL)currentlyShowingActivationFlow
{
  NSMutableArray *v2;
  id v3;
  uint64_t v4;
  char isKindOfClass;

  v2 = -[BuddyNavigationFlowController buddyControllers](self, "buddyControllers", a2, self);
  v3 = -[NSMutableArray lastObject](v2, "lastObject");
  v4 = objc_opt_class(ActivationController);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  return isKindOfClass & 1;
}

- (BOOL)isStartOverAllowed
{
  NSMutableArray *v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  BuddyNavigationFlowNavigator *v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  _WORD v11[3];
  os_log_type_t v12;
  os_log_t v13;
  id location;
  int v15;
  uint8_t buf[7];
  os_log_type_t v17;
  os_log_t oslog;
  id v19[2];
  BuddyNavigationFlowController *v20;
  char v21;

  v20 = self;
  v19[1] = (id)a2;
  v2 = -[BuddyNavigationFlowController buddyControllers](self, "buddyControllers");
  v19[0] = -[NSMutableArray lastObject](v2, "lastObject");

  if ((objc_opt_respondsToSelector(v19[0], "shouldAllowStartOver") & 1) == 0
    || (v3 = objc_msgSend(v19[0], "shouldAllowStartOver"), (v3 & 1) != 0))
  {
    v6 = -[BuddyNavigationFlowController navigator](v20, "navigator");
    location = -[BuddyNavigationFlowNavigator topViewController](v6, "topViewController");

    if ((objc_opt_respondsToSelector(location, "shouldAllowStartOver") & 1) == 0
      || (v7 = objc_msgSend(location, "shouldAllowStartOver"), (v7 & 1) != 0))
    {
      v21 = 1;
      v15 = 1;
    }
    else
    {
      v13 = (os_log_t)(id)_BYLoggingFacility(v7);
      v12 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v8 = v13;
        v9 = v12;
        sub_100038C3C(v11);
        _os_log_impl((void *)&_mh_execute_header, v8, v9, "Top view controller does not allow menu", (uint8_t *)v11, 2u);
      }
      objc_storeStrong((id *)&v13, 0);
      v21 = 0;
      v15 = 1;
    }
    objc_storeStrong(&location, 0);
  }
  else
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v3);
    v17 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v4 = oslog;
      v5 = v17;
      sub_100038C3C(buf);
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "Top flow item does not allow menu", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    v21 = 0;
    v15 = 1;
  }
  objc_storeStrong(v19, 0);
  return v21 & 1;
}

- (BFFFlowItem)topFlowItem
{
  NSMutableArray *v2;
  id v3;

  v2 = -[BuddyNavigationFlowController buddyControllers](self, "buddyControllers", a2, self);
  v3 = -[NSMutableArray lastObject](v2, "lastObject");

  return (BFFFlowItem *)v3;
}

- (id)_flowItemFollowingClass:(Class)a3
{
  BuddyFlowProducer *v3;
  id v4;
  unsigned __int8 v5;
  id v6;
  NSMutableArray *v7;
  NSPointerArray *v8;
  NSPointerArray *v9;
  NSMutableArray *v10;
  id v11;
  uint64_t v12;
  unint64_t i;
  NSPointerArray *v14;
  BuddyNavigationFlowNavigator *v15;
  id v16;
  id v17;
  uint64_t v18;
  unint64_t j;
  NSPointerArray *v20;
  uint64_t v21;
  NSPointerArray *v22;
  uint64_t v23;
  NSPointerArray *v24;
  os_log_t v26;
  os_log_type_t v27;
  os_log_t v28;
  os_log_type_t v29;
  os_log_t oslog;
  _QWORD v31[8];
  uint64_t v32;
  _QWORD __b[8];
  uint64_t v34;
  id v35;
  char v36;
  BYEnvironment *v37;
  int v38;
  id location;
  char v40;
  id v41;
  Class v42;
  SEL v43;
  BuddyNavigationFlowController *v44;
  id v45;
  uint8_t v46[16];
  uint8_t v47[16];
  uint8_t buf[24];
  _BYTE v49[128];
  _BYTE v50[128];

  v44 = self;
  v43 = a2;
  v42 = a3;
  v3 = -[BuddyNavigationFlowController flowProducer](self, "flowProducer");
  v41 = -[BuddyFlowProducer potentialNextFlowItemClassFollowingFlowItemClass:](v3, "potentialNextFlowItemClassFollowingFlowItemClass:", v42);

  v4 = objc_msgSend(v41, "conformsToProtocol:", &OBJC_PROTOCOL___BFFFlowItem);
  if ((v4 & 1) != 0)
  {
    v40 = -[BuddyNavigationFlowController _shouldTapFreeSetUpSkipControllerClass:](v44, "_shouldTapFreeSetUpSkipControllerClass:", v41);
    if (v40
      || ((location = -[BuddyNavigationFlowController _createConditionalFlowItemForClass:](v44, "_createConditionalFlowItemForClass:", v41)) == 0? (v38 = 0): (v45 = location, v38 = 1), objc_storeStrong(&location, 0), !v38))
    {
      v36 = 0;
      v5 = 0;
      if ((objc_opt_respondsToSelector(v41, "isTrailingWithEnvironment:") & 1) != 0)
      {
        v6 = v41;
        v37 = -[BuddyNavigationFlowController environment](v44, "environment");
        v36 = 1;
        v5 = objc_msgSend(v6, "isTrailingWithEnvironment:");
      }
      if ((v36 & 1) != 0)

      if ((v5 & 1) != 0)
      {
        v35 = -[BuddyNavigationFlowController _savedItemForClass:](v44, "_savedItemForClass:", v41);
        v7 = -[BuddyNavigationFlowController trailingControllers](v44, "trailingControllers");
        -[NSMutableArray addObject:](v7, "addObject:", v35);

        objc_storeStrong(&v35, 0);
      }
      if ((objc_msgSend(v41, "isEqual:", objc_opt_class(DeviceRestoreChoiceController)) & 1) != 0)
      {
        v8 = +[NSPointerArray weakObjectsPointerArray](NSPointerArray, "weakObjectsPointerArray");
        -[BuddyNavigationFlowController setWeakBuddyControllersPrecedingDeviceRestoreChoiceController:](v44, "setWeakBuddyControllersPrecedingDeviceRestoreChoiceController:", v8);

        v9 = +[NSPointerArray weakObjectsPointerArray](NSPointerArray, "weakObjectsPointerArray");
        -[BuddyNavigationFlowController setWeakViewControllersPrecedingDeviceRestoreChoiceController:](v44, "setWeakViewControllersPrecedingDeviceRestoreChoiceController:", v9);

        memset(__b, 0, sizeof(__b));
        v10 = -[BuddyNavigationFlowController buddyControllers](v44, "buddyControllers");
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", __b, v50, 16);
        if (v11)
        {
          v12 = *(_QWORD *)__b[2];
          do
          {
            for (i = 0; i < (unint64_t)v11; ++i)
            {
              if (*(_QWORD *)__b[2] != v12)
                objc_enumerationMutation(v10);
              v34 = *(_QWORD *)(__b[1] + 8 * i);
              v14 = -[BuddyNavigationFlowController weakBuddyControllersPrecedingDeviceRestoreChoiceController](v44, "weakBuddyControllersPrecedingDeviceRestoreChoiceController");
              -[NSPointerArray addPointer:](v14, "addPointer:", v34);

            }
            v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", __b, v50, 16);
          }
          while (v11);
        }

        memset(v31, 0, sizeof(v31));
        v15 = -[BuddyNavigationFlowController navigator](v44, "navigator");
        v16 = -[BuddyNavigationFlowNavigator viewControllers](v15, "viewControllers");

        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", v31, v49, 16);
        if (v17)
        {
          v18 = *(_QWORD *)v31[2];
          do
          {
            for (j = 0; j < (unint64_t)v17; ++j)
            {
              if (*(_QWORD *)v31[2] != v18)
                objc_enumerationMutation(v16);
              v32 = *(_QWORD *)(v31[1] + 8 * j);
              v20 = -[BuddyNavigationFlowController weakViewControllersPrecedingDeviceRestoreChoiceController](v44, "weakViewControllersPrecedingDeviceRestoreChoiceController");
              -[NSPointerArray addPointer:](v20, "addPointer:", v32);

            }
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", v31, v49, 16);
          }
          while (v17);
        }

        oslog = (os_log_t)(id)_BYLoggingFacility(v21);
        v29 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
        {
          v22 = -[BuddyNavigationFlowController weakBuddyControllersPrecedingDeviceRestoreChoiceController](v44, "weakBuddyControllersPrecedingDeviceRestoreChoiceController");
          sub_100038C28((uint64_t)buf, (uint64_t)v22);
          _os_log_debug_impl((void *)&_mh_execute_header, oslog, v29, "Skipping DeviceRestoreChoiceController but remembering buddy controllers preceding it: %@", buf, 0xCu);

        }
        objc_storeStrong((id *)&oslog, 0);
        v28 = (os_log_t)(id)_BYLoggingFacility(v23);
        v27 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          v24 = -[BuddyNavigationFlowController weakViewControllersPrecedingDeviceRestoreChoiceController](v44, "weakViewControllersPrecedingDeviceRestoreChoiceController");
          sub_100038C28((uint64_t)v47, (uint64_t)v24);
          _os_log_debug_impl((void *)&_mh_execute_header, v28, v27, "...and view controllers preceding it: %@", v47, 0xCu);

        }
        objc_storeStrong((id *)&v28, 0);
      }
      v45 = -[BuddyNavigationFlowController _flowItemFollowingClass:](v44, "_flowItemFollowingClass:", v41);
    }
  }
  else
  {
    if (v41)
    {
      v26 = (os_log_t)(id)_BYLoggingFacility(v4);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        sub_100039500((uint64_t)v46, (uint64_t)v41);
        _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Received a non-flow item class: %{public}@", v46, 0xCu);
      }
      objc_storeStrong((id *)&v26, 0);
    }
    v45 = 0;
  }
  return v45;
}

- (id)_createConditionalFlowItemForClass:(Class)a3
{
  BFFFlowStarter *v3;
  unsigned __int8 v4;
  BFFFlowStarter *v5;
  unsigned __int8 v6;
  int v8;
  id location;
  Class v11;
  SEL v12;
  BuddyNavigationFlowController *v13;
  id v14;

  v13 = self;
  v12 = a2;
  v11 = a3;
  if (-[BuddyNavigationFlowController _shouldTapFreeSetUpSkipControllerClass:](self, "_shouldTapFreeSetUpSkipControllerClass:", a3))
  {
    goto LABEL_9;
  }
  v3 = -[BuddyNavigationFlowController flowStarter](v13, "flowStarter");
  v4 = -[BFFFlowStarter controllerNeedsToRunForClass:](v3, "controllerNeedsToRunForClass:", v11);

  if ((v4 & 1) == 0)
    goto LABEL_9;
  location = -[BuddyNavigationFlowController _createFlowItemForClass:](v13, "_createFlowItemForClass:", v11);
  objc_msgSend(location, "setDelegate:", v13);
  v5 = -[BuddyNavigationFlowController flowStarter](v13, "flowStarter");
  v6 = -[BFFFlowStarter controllerNeedsToRunForFlowItem:](v5, "controllerNeedsToRunForFlowItem:", location);

  if ((v6 & 1) != 0)
  {
    v14 = location;
    v8 = 1;
  }
  else
  {
    if ((objc_opt_respondsToSelector(location, "controllerWillNotRun") & 1) != 0)
      objc_msgSend(location, "controllerWillNotRun");
    v8 = 0;
  }
  objc_storeStrong(&location, 0);
  if (!v8)
LABEL_9:
    v14 = 0;
  return v14;
}

- (id)_createFlowItemForClass:(Class)a3
{
  id v3;
  BuddyNavigationFlowNavigator *v4;
  BFFNavigationController *v5;
  BFFFlowStarter *v6;
  id v7;
  id v8;
  id v9;
  BuddyFlowProducer *v10;
  uint64_t (**v11)(id, id);
  id obj;
  int v14;
  id location;
  Class v16;
  SEL v17;
  BuddyNavigationFlowController *v18;
  id v19;

  v18 = self;
  v17 = a2;
  v16 = a3;
  location = -[BuddyNavigationFlowController _savedItemForClass:](self, "_savedItemForClass:", a3);
  if (location)
  {
    v19 = location;
    v14 = 1;
  }
  else
  {
    if ((-[objc_class isSubclassOfClass:](v16, "isSubclassOfClass:", objc_opt_class(BFFFlow)) & 1) != 0)
    {
      v3 = [v16 alloc];
      v4 = -[BuddyNavigationFlowController navigator](v18, "navigator");
      v5 = -[BuddyNavigationFlowNavigator navigationController](v4, "navigationController");
      v6 = -[BuddyNavigationFlowController flowStarter](v18, "flowStarter");
      v7 = -[BuddyNavigationFlowController environmentInjector](v18, "environmentInjector");
      obj = objc_msgSend(v3, "initWithNavigationController:flowDelegate:flowStarter:dependencyInjector:", v5, v18, v6, v7);

      objc_msgSend(obj, "setFlowItemDelegate:", v18);
      objc_storeStrong(&location, obj);
      objc_storeStrong(&obj, 0);
    }
    else
    {
      v8 = objc_alloc_init(v16);
      v9 = location;
      location = v8;

    }
    v10 = -[BuddyNavigationFlowController flowProducer](v18, "flowProducer");
    -[BuddyFlowProducer configureFlowItem:](v10, "configureFlowItem:", location);

    v11 = (uint64_t (**)(id, id))-[BuddyNavigationFlowController environmentInjector](v18, "environmentInjector");
    v19 = (id)v11[2](v11, location);

    v14 = 1;
  }
  objc_storeStrong(&location, 0);
  return v19;
}

- (id)_savedItemForClass:(Class)a3
{
  id v3;
  uint64_t (**v4)(id, Class);
  BuddyWiFiController *v8;

  v3 = -[BuddyNavigationFlowController savedItemForClassBlock](self, "savedItemForClassBlock");

  if (v3)
  {
    v4 = (uint64_t (**)(id, Class))-[BuddyNavigationFlowController savedItemForClassBlock](self, "savedItemForClassBlock");
    v8 = (BuddyWiFiController *)(id)v4[2](v4, a3);

  }
  else if ((-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class(BuddyWiFiController)) & 1) != 0)
  {
    v8 = -[BuddyNavigationFlowController wifiController](self, "wifiController");
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (BOOL)_doesTapFreeSetUpAffectsClass:(Class)a3
{
  char v3;
  unsigned __int8 v4;

  v3 = objc_opt_respondsToSelector(a3, "controllerAffectedByTapFreeSetup");
  v4 = 0;
  if ((v3 & 1) != 0)
    v4 = -[objc_class controllerAffectedByTapFreeSetup](a3, "controllerAffectedByTapFreeSetup");
  return v4 & 1;
}

- (BOOL)_shouldTapFreeSetUpSkipControllerClass:(Class)a3
{
  unsigned __int8 v3;
  unsigned __int8 v4;

  v3 = -[BuddyNavigationFlowController isTapFreeSetUp](self, "isTapFreeSetUp");
  v4 = 0;
  if ((v3 & 1) != 0)
    v4 = -[BuddyNavigationFlowController _doesTapFreeSetUpAffectsClass:](self, "_doesTapFreeSetUpAffectsClass:", a3);
  return v4 & 1;
}

- (void)_flowItemDone:(id)a3 flow:(id)a4 nextItemClass:(Class)a5 nextItem:(id)a6
{
  id v9;
  uint64_t v10;
  BuddyLifecycleDelegate *v11;
  unsigned __int8 v12;
  BuddyLifecycleDelegate *v13;
  BuddyLifecycleDelegate *v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  BuddyFlowCloudConfigDelegate *v19;
  id v20;
  uint64_t v21;
  ProximitySetupController *v22;
  id v23;
  id v24;
  BuddyNavigationFlowController *v25;
  uint64_t v26;
  id v27;
  id v28;
  BuddyNavigationFlowController *v29;
  BYEnvironment *v30;
  unsigned __int8 v31;
  char v32;
  BOOL v33;
  char v34;
  BOOL v35;
  BuddyLifecycleDelegate *v36;
  BuddyLifecycleDelegate *v37;
  uint64_t v38;
  uint64_t v39;
  char isKindOfClass;
  uint64_t v41;
  NSDate *v42;
  BOOL v43;
  id v44;
  id v45;
  os_log_type_t v46;
  os_log_t oslog;
  char v48;
  BOOL v49;
  BOOL v50;
  BOOL v51;
  char v52;
  id v53;
  id v54;
  char v55;
  id v56;
  Class v57;
  id v58;
  id location[2];
  BuddyNavigationFlowController *v60;
  uint8_t buf[24];

  v60 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v58 = 0;
  objc_storeStrong(&v58, a4);
  v57 = a5;
  v56 = 0;
  objc_storeStrong(&v56, a6);
  v55 = 1;
  -[BuddyNavigationFlowController markFlowItemDone:](v60, "markFlowItemDone:", location[0]);
  v9 = v58;
  v10 = objc_opt_class(BuddyActivationFlow);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) == 0 || v56 || v57)
  {
    v17 = location[0];
    v18 = objc_opt_class(BuddyCloudConfigController);
    if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0)
    {
      v19 = -[BuddyNavigationFlowController flowCloudConfigurationDelegate](v60, "flowCloudConfigurationDelegate");
      -[BuddyFlowCloudConfigDelegate setNeedsConfigurationUpdate](v19, "setNeedsConfigurationUpdate");

    }
  }
  else
  {
    v11 = -[BuddyNavigationFlowController lifecycleDelegate](v60, "lifecycleDelegate");
    v12 = -[BuddyLifecycleDelegate shouldEndLifecycleForCause:](v11, "shouldEndLifecycleForCause:", 0);

    if ((v12 & 1) != 0)
    {
      v55 = 0;
      v13 = -[BuddyNavigationFlowController lifecycleDelegate](v60, "lifecycleDelegate");
      -[BuddyLifecycleDelegate willEndLifecycleDueToCause:allowDismissal:](v13, "willEndLifecycleDueToCause:allowDismissal:", 0, 1);

      v14 = -[BuddyNavigationFlowController lifecycleDelegate](v60, "lifecycleDelegate");
      -[BuddyLifecycleDelegate endLifecycleDueToCause:](v14, "endLifecycleDueToCause:", 0);

    }
    else
    {
      v15 = location[0];
      v16 = objc_opt_class(ActivationController);
      if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0
        && (objc_msgSend(location[0], "cdmaSelectionActivation") & 1) != 0)
      {
        v55 = 0;
        -[BuddyNavigationFlowController restartFlow](v60, "restartFlow");
      }
    }
  }
  v20 = location[0];
  v21 = objc_opt_class(BuddyProximitySetupController);
  if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0)
  {
    v22 = -[BuddyNavigationFlowController proximitySetupController](v60, "proximitySetupController");
    -[ProximitySetupController endAdvertisingProximitySetup](v22, "endAdvertisingProximitySetup");

  }
  if ((v55 & 1) != 0)
  {
    v54 = v56;
    if (!v54)
    {
      if (v57)
      {
        v23 = objc_alloc_init(v57);
        v24 = v54;
        v54 = v23;

        if ((objc_opt_respondsToSelector(v54, "setDelegate:") & 1) != 0)
          objc_msgSend(v54, "setDelegate:", v60);
      }
      else
      {
        v25 = v60;
        v26 = objc_opt_class(v58);
        if (!v26)
          v26 = objc_opt_class(location[0]);
        v27 = -[BuddyNavigationFlowController _flowItemFollowingClass:](v25, "_flowItemFollowingClass:", v26);
        v28 = v54;
        v54 = v27;

      }
    }
    v29 = v60;
    v30 = -[BuddyNavigationFlowController environment](v60, "environment");
    -[BuddyNavigationFlowController _injectDependencies:withEnvironment:](v29, "_injectDependencies:withEnvironment:", v54, v30);

    v52 = 0;
    v31 = 0;
    if (!v54)
    {
      v53 = -[BuddyNavigationFlowController lifecycleDelegate](v60, "lifecycleDelegate");
      v52 = 1;
      v31 = objc_msgSend(v53, "shouldEndLifecycleForCause:", 1);
    }
    if ((v52 & 1) != 0)

    if ((v31 & 1) != 0)
    {
      v51 = 0;
      v32 = objc_opt_respondsToSelector(v58, "allowedTerminationSources");
      v33 = 0;
      if ((v32 & 1) != 0)
        v33 = objc_msgSend(v58, "allowedTerminationSources") != 0;
      v51 = v33;
      v50 = 0;
      v34 = objc_opt_respondsToSelector(location[0], "allowedTerminationSources");
      v35 = 0;
      if ((v34 & 1) != 0)
        v35 = objc_msgSend(location[0], "allowedTerminationSources") != 0;
      v50 = v35;
      if (!v35)
      {
        if (v51)
        {
          v49 = ((unint64_t)objc_msgSend(v58, "allowedTerminationSources") & 1) == 1;
          v36 = -[BuddyNavigationFlowController lifecycleDelegate](v60, "lifecycleDelegate");
          -[BuddyLifecycleDelegate willEndLifecycleDueToCause:allowDismissal:](v36, "willEndLifecycleDueToCause:allowDismissal:", 1, v49);
        }
        else
        {
          v36 = -[BuddyNavigationFlowController lifecycleDelegate](v60, "lifecycleDelegate");
          -[BuddyLifecycleDelegate willEndLifecycleDueToCause:allowDismissal:](v36, "willEndLifecycleDueToCause:allowDismissal:", 1, 1);
        }

      }
      v37 = -[BuddyNavigationFlowController lifecycleDelegate](v60, "lifecycleDelegate");
      -[BuddyLifecycleDelegate endLifecycleDueToCause:](v37, "endLifecycleDueToCause:", 1);

    }
    v38 = -[BuddyNavigationFlowController _hasWiFiControllerInNavigationStack](v60, "_hasWiFiControllerInNavigationStack");
    if ((v38 & 1) == 0)
    {
      v38 = -[BuddyNavigationFlowController _stackHasOnlyCloudConfigurationItems](v60, "_stackHasOnlyCloudConfigurationItems");
      if ((v38 & 1) != 0)
      {
        v48 = 0;
        v39 = objc_opt_class(BuddyCloudConfigController);
        isKindOfClass = objc_opt_isKindOfClass(v54, v39);
        v38 = 1;
        if ((isKindOfClass & 1) == 0)
        {
          v41 = objc_opt_class(BuddyCloudConfigInstallationController);
          v38 = objc_opt_isKindOfClass(v54, v41);
        }
        v48 = v38 & 1;
        if ((v38 & 1) != 0)
        {
          -[BuddyNavigationFlowController setDidInsertWiFiPaneForCloudConfigurationFlow:](v60, "setDidInsertWiFiPaneForCloudConfigurationFlow:", 1);
          v38 = (uint64_t)-[BuddyNavigationFlowController _insertWiFiControllerAsFirstPane](v60, "_insertWiFiControllerAsFirstPane");
        }
      }
    }
    oslog = (os_log_t)(id)_BYLoggingFacility(v38);
    v46 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v45 = (id)objc_opt_class(location[0]);
      v44 = (id)objc_opt_class(v54);
      sub_10003A6BC((uint64_t)buf, (uint64_t)v45, (uint64_t)v44);
      _os_log_impl((void *)&_mh_execute_header, oslog, v46, "Following flow %{public}@ => %{public}@", buf, 0x16u);
      objc_storeStrong(&v44, 0);
      objc_storeStrong(&v45, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
    v42 = -[BuddyNavigationFlowController navigationStartDate](v60, "navigationStartDate");
    v43 = v42 == 0;

    if (v43)
      -[BuddyNavigationFlowController _beginEventForNavigationDuration](v60, "_beginEventForNavigationDuration");
    if (v54)
      -[BuddyNavigationFlowController pushFlowItem:inFlow:animated:](v60, "pushFlowItem:inFlow:animated:", v54, 0, 1);
    objc_storeStrong(&v54, 0);
  }
  objc_storeStrong(&v56, 0);
  objc_storeStrong(&v58, 0);
  objc_storeStrong(location, 0);
}

- (void)_startDisablingInteractionForExtendedInitialization
{
  BuddyNavigationFlowNavigator *v2;
  id v3;
  BOOL v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  NSMutableArray *v8;
  BuddyNavigationFlowNavigator *v9;
  NSMutableArray *v10;
  id v11;
  char v12;
  NSMutableArray *v13;
  id v14;
  BuddyNavigationFlowNavigator *v15;
  id v16;
  id v17;
  char v18;
  uint64_t v19;
  BuddyNavigationFlowNavigator *v20;
  id v21;
  id v22;
  char v23;
  NSMutableArray *v24;
  uint64_t v25;
  NSMutableArray *v26;
  BuddyNavigationFlowNavigator *v27;
  id v28;
  BuddyNavigationFlowNavigator *v29;
  id v30;
  id v31;
  BuddyNavigationFlowNavigator *v32;
  id v33;
  id v34;
  os_log_t v35;
  id v36;
  os_log_type_t v37;
  os_log_t v38;
  id v39;
  os_log_type_t v40;
  os_log_t v41;
  char v42;
  char v43;
  char v44;
  id location;
  uint8_t buf[7];
  os_log_type_t v47;
  os_log_t oslog;
  char v49;
  id v50;
  SEL v51;
  BuddyNavigationFlowController *v52;
  uint8_t v53[32];
  uint8_t v54[16];
  uint8_t v55[24];

  v52 = self;
  v51 = a2;
  v2 = -[BuddyNavigationFlowController navigator](self, "navigator");
  v3 = -[BuddyNavigationFlowNavigator viewControllers](v2, "viewControllers");
  v49 = 0;
  v4 = 0;
  if (!objc_msgSend(v3, "count"))
  {
    v50 = -[BuddyNavigationFlowController buddyControllers](v52, "buddyControllers");
    v49 = 1;
    v4 = objc_msgSend(v50, "count") == 0;
  }
  if ((v49 & 1) != 0)

  if (v4)
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v5);
    v47 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v6 = oslog;
      v7 = v47;
      sub_100038C3C(buf);
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Inserting interstitial spinner pane", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    location = objc_msgSend(objc_alloc((Class)BFFSpinnerController), "initWithSpinnerText:", &stru_100284738);
    v8 = -[BuddyNavigationFlowController buddyControllers](v52, "buddyControllers");
    -[NSMutableArray addObject:](v8, "addObject:", location);

    v9 = -[BuddyNavigationFlowController navigator](v52, "navigator");
    -[BuddyNavigationFlowNavigator pushViewController:animated:](v9, "pushViewController:animated:", location, 0);

    objc_storeStrong(&location, 0);
  }
  v44 = 0;
  v43 = 0;
  v10 = -[BuddyNavigationFlowController buddyControllers](v52, "buddyControllers");
  v11 = -[NSMutableArray lastObject](v10, "lastObject");
  v12 = objc_opt_respondsToSelector(v11, "shouldSuppressExtendedInitializationActivityIndicator");

  if ((v12 & 1) != 0)
  {
    v13 = -[BuddyNavigationFlowController buddyControllers](v52, "buddyControllers");
    v14 = -[NSMutableArray lastObject](v13, "lastObject");
    v44 = objc_msgSend(v14, "shouldSuppressExtendedInitializationActivityIndicator") & 1;

  }
  v15 = -[BuddyNavigationFlowController navigator](v52, "navigator");
  v16 = -[BuddyNavigationFlowNavigator viewControllers](v15, "viewControllers");
  v17 = objc_msgSend(v16, "lastObject");
  v18 = objc_opt_respondsToSelector(v17, "shouldSuppressExtendedInitializationActivityIndicator");

  if ((v18 & 1) != 0)
  {
    v20 = -[BuddyNavigationFlowController navigator](v52, "navigator");
    v21 = -[BuddyNavigationFlowNavigator viewControllers](v20, "viewControllers");
    v22 = objc_msgSend(v21, "lastObject");
    v43 = objc_msgSend(v22, "shouldSuppressExtendedInitializationActivityIndicator") & 1;

  }
  v42 = 0;
  v23 = 1;
  if ((v44 & 1) == 0)
    v23 = v43;
  v42 = v23;
  if ((v23 & 1) != 0)
  {
    v41 = (os_log_t)(id)_BYLoggingFacility(v19);
    v40 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      v24 = -[BuddyNavigationFlowController buddyControllers](v52, "buddyControllers");
      v39 = -[NSMutableArray lastObject](v24, "lastObject");
      sub_100039500((uint64_t)v55, (uint64_t)v39);
      _os_log_impl((void *)&_mh_execute_header, v41, v40, "Will suppress spinner over %{public}@", v55, 0xCu);

      objc_storeStrong(&v39, 0);
    }
    objc_storeStrong((id *)&v41, 0);
  }
  else
  {
    v38 = (os_log_t)(id)_BYLoggingFacility(v19);
    v37 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v26 = -[BuddyNavigationFlowController buddyControllers](v52, "buddyControllers");
      v36 = -[NSMutableArray lastObject](v26, "lastObject");
      sub_100039500((uint64_t)v54, (uint64_t)v36);
      _os_log_impl((void *)&_mh_execute_header, v38, v37, "Will NOT suppress spinner over %{public}@", v54, 0xCu);

      objc_storeStrong(&v36, 0);
    }
    objc_storeStrong((id *)&v38, 0);
  }
  if ((v42 & 1) == 0)
  {
    v27 = -[BuddyNavigationFlowController navigator](v52, "navigator");
    v28 = -[BuddyNavigationFlowNavigator topViewController](v27, "topViewController");
    +[BFFViewControllerSpinnerManager startAnimatingSpinnerFor:identifier:](BFFViewControllerSpinnerManager, "startAnimatingSpinnerFor:identifier:", v28, CFSTR("BuddyNavigationFlowController"));

  }
  v35 = (os_log_t)(id)_BYLoggingFacility(v25);
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
  {
    v29 = -[BuddyNavigationFlowController navigator](v52, "navigator");
    v30 = -[BuddyNavigationFlowNavigator view](v29, "view");
    v31 = objc_msgSend(v30, "window");
    sub_100066BA8((uint64_t)v53, (uint64_t)"-[BuddyNavigationFlowController _startDisablingInteractionForExtendedInitialization]", (uint64_t)v31);
    _os_log_debug_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "%s setUserInteractionEnabled NO %p", v53, 0x16u);

  }
  objc_storeStrong((id *)&v35, 0);
  v32 = -[BuddyNavigationFlowController navigator](v52, "navigator");
  v33 = -[BuddyNavigationFlowNavigator view](v32, "view");
  v34 = objc_msgSend(v33, "window");
  objc_msgSend(v34, "setUserInteractionEnabled:", 0);

}

- (void)_stopDisablingInteractionForExtendedInitialization
{
  BuddyNavigationFlowNavigator *v2;
  id v3;
  id v4;
  BuddyNavigationFlowNavigator *v5;
  id v6;
  id v7;
  os_log_t oslog[2];
  BuddyNavigationFlowController *v9;
  uint8_t buf[24];

  v9 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility(+[BFFViewControllerSpinnerManager stopAnimatingSpinnerFor:](BFFViewControllerSpinnerManager, "stopAnimatingSpinnerFor:", CFSTR("BuddyNavigationFlowController")));
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEBUG))
  {
    v2 = -[BuddyNavigationFlowController navigator](v9, "navigator");
    v3 = -[BuddyNavigationFlowNavigator view](v2, "view");
    v4 = objc_msgSend(v3, "window");
    sub_100066BA8((uint64_t)buf, (uint64_t)"-[BuddyNavigationFlowController _stopDisablingInteractionForExtendedInitialization]", (uint64_t)v4);
    _os_log_debug_impl((void *)&_mh_execute_header, oslog[0], OS_LOG_TYPE_DEBUG, "%s setUserInteractionEnabled YES %p", buf, 0x16u);

  }
  objc_storeStrong((id *)oslog, 0);
  v5 = -[BuddyNavigationFlowController navigator](v9, "navigator");
  v6 = -[BuddyNavigationFlowNavigator view](v5, "view");
  v7 = objc_msgSend(v6, "window");
  objc_msgSend(v7, "setUserInteractionEnabled:", 1);

}

- (void)_performExtendedInitializationForFlowItem:(id)a3 willBegin:(id)a4 withCompletion:(id)a5
{
  uint64_t v7;
  id v8;
  void **v9;
  int v10;
  int v11;
  void (*v12)(NSObject *, char);
  void *v13;
  id v14;
  id v15;
  BuddyNavigationFlowController *v16;
  id v17[2];
  _QWORD v18[2];
  int v19;
  int v20;
  char v21;
  id v22;
  id v23;
  os_log_type_t v24;
  id v25;
  int v26;
  id v27;
  id v28;
  id location[2];
  BuddyNavigationFlowController *v30;
  uint8_t buf[24];

  v30 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v28 = 0;
  objc_storeStrong(&v28, a4);
  v27 = 0;
  objc_storeStrong(&v27, a5);
  v7 = objc_opt_respondsToSelector(location[0], "performExtendedInitializationWithCompletion:");
  if ((v7 & 1) != 0)
  {
    if (v28)
      v7 = (*((uint64_t (**)(void))v28 + 2))();
    v25 = (id)_BYLoggingFacility(v7);
    v24 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_DEFAULT))
    {
      v23 = (id)objc_opt_class(location[0]);
      sub_100039500((uint64_t)buf, (uint64_t)v23);
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v25, v24, "Running extended initialization for %{public}@", buf, 0xCu);
      objc_storeStrong(&v23, 0);
    }
    objc_storeStrong(&v25, 0);
    v22 = +[NSDate date](NSDate, "date");
    v18[0] = 0;
    v18[1] = v18;
    v19 = 0x20000000;
    v20 = 32;
    v21 = 0;
    v8 = location[0];
    v9 = _NSConcreteStackBlock;
    v10 = -1073741824;
    v11 = 0;
    v12 = sub_1000670C0;
    v13 = &unk_1002810C8;
    v17[1] = v18;
    v14 = location[0];
    v15 = v22;
    v16 = v30;
    v17[0] = v27;
    objc_msgSend(v8, "performExtendedInitializationWithCompletion:", &v9);
    objc_storeStrong(v17, 0);
    objc_storeStrong((id *)&v16, 0);
    objc_storeStrong(&v15, 0);
    objc_storeStrong(&v14, 0);
    _Block_object_dispose(v18, 8);
    objc_storeStrong(&v22, 0);
    v26 = 0;
  }
  else
  {
    if (v27)
      (*((void (**)(id, uint64_t))v27 + 2))(v27, 1);
    v26 = 1;
  }
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(location, 0);
}

- (void)_pushFlowItem:(id)a3 inFlow:(id)a4 withExtendedInitialization:(BOOL)a5 animated:(BOOL)a6 willPushFlowItem:(id)a7
{
  BuddyFlowProducer *v11;
  id v12;
  BuddyFlowProducer *v13;
  uint64_t v14;
  NSDate *v15;
  BOOL v16;
  BuddyNavigationFlowController *v17;
  NSMutableArray *v18;
  id v19;
  id v20;
  uint64_t v21;
  BuddyNavigationFlowController *v22;
  id v23;
  NSMutableArray *v24;
  BuddyNavigationFlowController *v25;
  id v26;
  id v27;
  uint64_t v28;
  id v29;
  BuddyNavigationFlowNavigator *v30;
  BFFNavigationController *v31;
  BuddyNavigationFlowController *v32;
  id v33;
  BOOL v34;
  void **v35;
  int v36;
  int v37;
  void (*v38)(uint64_t, void *);
  void *v39;
  id v40;
  BuddyNavigationFlowController *v41;
  id v42;
  BOOL v43;
  void **v44;
  int v45;
  int v46;
  id (*v47)(uint64_t);
  void *v48;
  BuddyNavigationFlowController *v49;
  id v50;
  id v51;
  void **v52;
  int v53;
  int v54;
  id (*v55)(uint64_t, char);
  void *v56;
  BuddyNavigationFlowController *v57;
  id v58;
  id v59;
  id v60;
  BOOL v61;
  void **v62;
  int v63;
  int v64;
  id (*v65)(uint64_t);
  void *v66;
  BuddyNavigationFlowController *v67;
  void **v68;
  int v69;
  int v70;
  id (*v71)(uint64_t, char);
  void *v72;
  BuddyNavigationFlowController *v73;
  id v74;
  id v75;
  id v76;
  id v77;
  BOOL v78;
  void **v79;
  int v80;
  int v81;
  id (*v82)(uint64_t);
  void *v83;
  BuddyNavigationFlowController *v84;
  id v85;
  id v86;
  os_log_type_t v87;
  id v88;
  id v89;
  id v90;
  id v91;
  BOOL v92;
  BOOL v93;
  id v94;
  id location[2];
  BuddyNavigationFlowController *v96;
  uint8_t buf[24];

  v96 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v94 = 0;
  objc_storeStrong(&v94, a4);
  v93 = a5;
  v92 = a6;
  v91 = 0;
  objc_storeStrong(&v91, a7);
  if (location[0] && !-[BuddyNavigationFlowController _isFlowItemAllowed:](v96, "_isFlowItemAllowed:", location[0]))
  {
    v11 = -[BuddyNavigationFlowController flowProducer](v96, "flowProducer");
    v90 = objc_msgSend((id)objc_opt_class(v11), "allowedFlowItems");

    v12 = location[0];
    v13 = -[BuddyNavigationFlowController flowProducer](v96, "flowProducer");
    v89 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", CFSTR("Attempted to push disallowed flow item (%@) from producer (%@) with %ld allowed flow items: %@"), v12, v13, objc_msgSend(v90, "count"), v90);

    v88 = (id)_BYLoggingFacility(v14);
    v87 = OS_LOG_TYPE_FAULT;
    if (os_log_type_enabled((os_log_t)v88, OS_LOG_TYPE_FAULT))
    {
      sub_100038C28((uint64_t)buf, (uint64_t)v89);
      _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)v88, v87, "%@", buf, 0xCu);
    }
    objc_storeStrong(&v88, 0);
    objc_storeStrong(&v89, 0);
    objc_storeStrong(&v90, 0);
  }
  v15 = -[BuddyNavigationFlowController navigationStartDate](v96, "navigationStartDate");
  v16 = v15 == 0;

  if (v16)
    -[BuddyNavigationFlowController _beginEventForNavigationDuration](v96, "_beginEventForNavigationDuration");
  v17 = v96;
  v18 = -[BuddyNavigationFlowController buddyControllers](v96, "buddyControllers");
  v19 = -[NSMutableArray lastObject](v18, "lastObject");
  v86 = -[BuddyNavigationFlowController _lastNonFlowFlowItemRelativeToFlowItem:](v17, "_lastNonFlowFlowItemRelativeToFlowItem:", v19);

  v20 = location[0];
  v21 = objc_opt_class(BFFFlow);
  if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0)
  {
    v85 = location[0];
    if (v93)
    {
      v22 = v96;
      v23 = location[0];
      v79 = _NSConcreteStackBlock;
      v80 = -1073741824;
      v81 = 0;
      v82 = sub_100067DB4;
      v83 = &unk_100280730;
      v84 = v96;
      v68 = _NSConcreteStackBlock;
      v69 = -1073741824;
      v70 = 0;
      v71 = sub_100067DDC;
      v72 = &unk_1002810F0;
      v77 = v91;
      v73 = v96;
      v74 = v85;
      v78 = v92;
      v75 = v94;
      v76 = location[0];
      -[BuddyNavigationFlowController _performExtendedInitializationForFlowItem:willBegin:withCompletion:](v22, "_performExtendedInitializationForFlowItem:willBegin:withCompletion:", v23, &v79, &v68);
      objc_storeStrong(&v76, 0);
      objc_storeStrong(&v75, 0);
      objc_storeStrong(&v74, 0);
      objc_storeStrong((id *)&v73, 0);
      objc_storeStrong(&v77, 0);
      objc_storeStrong((id *)&v84, 0);
    }
    else
    {
      if (v91)
        (*((void (**)(id, uint64_t))v91 + 2))(v91, 1);
      -[BuddyNavigationFlowController _endEventForNavigationDurationFromFlowItem:toFlowItem:](v96, "_endEventForNavigationDurationFromFlowItem:toFlowItem:", v86, v85);
      v24 = -[BuddyNavigationFlowController buddyControllers](v96, "buddyControllers");
      -[NSMutableArray addObject:](v24, "addObject:", v85);

      objc_msgSend(v85, "startFlowAnimated:", v92);
    }
    objc_storeStrong(&v85, 0);
  }
  else if (v93)
  {
    v25 = v96;
    v26 = location[0];
    v62 = _NSConcreteStackBlock;
    v63 = -1073741824;
    v64 = 0;
    v65 = sub_100067E94;
    v66 = &unk_100280730;
    v67 = v96;
    v52 = _NSConcreteStackBlock;
    v53 = -1073741824;
    v54 = 0;
    v55 = sub_100067EBC;
    v56 = &unk_100281118;
    v60 = v91;
    v57 = v96;
    v58 = location[0];
    v59 = v94;
    v61 = v92;
    -[BuddyNavigationFlowController _performExtendedInitializationForFlowItem:willBegin:withCompletion:](v25, "_performExtendedInitializationForFlowItem:willBegin:withCompletion:", v26, &v62, &v52);
    objc_storeStrong(&v59, 0);
    objc_storeStrong(&v58, 0);
    objc_storeStrong((id *)&v57, 0);
    objc_storeStrong(&v60, 0);
    objc_storeStrong((id *)&v67, 0);
  }
  else
  {
    if (v91)
      (*((void (**)(id, uint64_t))v91 + 2))(v91, 1);
    v27 = location[0];
    v28 = objc_opt_class(UIViewController);
    if ((objc_opt_isKindOfClass(v27, v28) & 1) == 0
      && (objc_opt_respondsToSelector(location[0], "setNavigationController:") & 1) != 0)
    {
      v29 = location[0];
      v30 = -[BuddyNavigationFlowController navigator](v96, "navigator");
      v31 = -[BuddyNavigationFlowNavigator navigationController](v30, "navigationController");
      objc_msgSend(v29, "setNavigationController:", v31);

    }
    -[BuddyNavigationFlowController _stopDisablingInteractionForExtendedInitialization](v96, "_stopDisablingInteractionForExtendedInitialization");
    v32 = v96;
    v33 = location[0];
    v34 = v92;
    v44 = _NSConcreteStackBlock;
    v45 = -1073741824;
    v46 = 0;
    v47 = sub_100067F58;
    v48 = &unk_100281000;
    v49 = v96;
    v50 = v86;
    v51 = location[0];
    v35 = _NSConcreteStackBlock;
    v36 = -1073741824;
    v37 = 0;
    v38 = sub_100067F8C;
    v39 = &unk_100281140;
    v40 = location[0];
    v41 = v96;
    v43 = v92;
    v42 = v94;
    -[BuddyNavigationFlowController _presentViewControllerForBuddyController:animated:willPresentViewController:completion:](v32, "_presentViewControllerForBuddyController:animated:willPresentViewController:completion:", v33, v34, &v44, &v35);
    objc_storeStrong(&v42, 0);
    objc_storeStrong((id *)&v41, 0);
    objc_storeStrong(&v40, 0);
    objc_storeStrong(&v51, 0);
    objc_storeStrong(&v50, 0);
    objc_storeStrong((id *)&v49, 0);
  }
  objc_storeStrong(&v86, 0);
  objc_storeStrong(&v91, 0);
  objc_storeStrong(&v94, 0);
  objc_storeStrong(location, 0);
}

- (void)_presentViewControllerForBuddyController:(id)a3 animated:(BOOL)a4 willPresentViewController:(id)a5 completion:(id)a6
{
  NSMutableArray *v9;
  double v10;
  double v11;
  id v12;
  BuddyNavigationFlowController *v13;
  BuddyNavigationFlowNavigator *v14;
  BFFNavigationController *v15;
  BuddyNavigationFlowNavigator *v16;
  id v17;
  BOOL v18;
  BuddyNavigationFlowNavigator *v19;
  BuddyNavigationFlowNavigator *v20;
  NSMutableArray *v21;
  id v22;
  char v23;
  uint64_t v24;
  NSMutableArray *v25;
  id v26;
  NSMutableArray *v27;
  id v28;
  const __CFString *v29;
  uint64_t v30;
  BuddyNavigationFlowNavigator *v31;
  id v32;
  BuddyNavigationFlowNavigator *v33;
  id v34;
  id v35;
  BuddyNavigationFlowNavigator *v36;
  id v37;
  id v38;
  uint64_t v39;
  id v40;
  BuddyNavigationFlowNavigator *v41;
  BFFNavigationController *v42;
  NSObject *v43;
  void **block;
  int v45;
  int v46;
  void (*v47);
  void *v48;
  id v49;
  id v50;
  BuddyNavigationFlowController *v51;
  id v52;
  id v53[3];
  void **v54;
  int v55;
  int v56;
  void (*v57)(uint64_t, void *);
  void *v58;
  BuddyNavigationFlowController *v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64[3];
  id v65;
  id v66;
  id v67;
  os_log_type_t v68;
  os_log_t v69;
  _QWORD v70[2];
  int v71;
  int v72;
  char v73;
  _QWORD v74[2];
  int v75;
  int v76;
  char v77;
  os_log_type_t v78;
  os_log_t v79;
  id v80;
  os_log_type_t v81;
  os_log_t oslog;
  char v83;
  void **v84;
  int v85;
  int v86;
  uint64_t (*v87)(uint64_t);
  void *v88;
  id v89;
  id v90;
  void **v91;
  int v92;
  int v93;
  uint64_t (*v94)(uint64_t);
  void *v95;
  id v96;
  id v97;
  id v98;
  void **v99;
  int v100;
  int v101;
  void (*v102)(_QWORD *);
  void *v103;
  BuddyNavigationFlowController *v104;
  id v105;
  id v106;
  __int128 v107;
  __int128 v108;
  id v109;
  char v110;
  id v111;
  id v112;
  id v113;
  BOOL v114;
  id location[2];
  BuddyNavigationFlowController *v116;
  uint8_t v117[16];
  uint8_t v118[32];
  uint8_t buf[32];

  v116 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v114 = a4;
  v113 = 0;
  objc_storeStrong(&v113, a5);
  v112 = 0;
  objc_storeStrong(&v112, a6);
  v111 = -[BuddyNavigationFlowController _viewControllerForBuddyController:](v116, "_viewControllerForBuddyController:", location[0]);
  if (v111)
  {
    -[BuddyNavigationFlowController _hideBackButtonIfNecessaryOnFlowItem:withViewController:](v116, "_hideBackButtonIfNecessaryOnFlowItem:withViewController:", location[0], v111);
    if (v113)
      (*((void (**)(void))v113 + 2))();
    v9 = -[BuddyNavigationFlowController buddyControllers](v116, "buddyControllers");
    -[NSMutableArray addObject:](v9, "addObject:", location[0]);

    v110 = 0;
    if ((objc_opt_respondsToSelector(location[0], "shouldPresentModally") & 1) != 0)
      v110 = objc_msgSend(location[0], "shouldPresentModally") & 1;
    if ((v110 & 1) != 0)
    {
      v109 = objc_msgSend(objc_alloc((Class)BFFNavigationController), "initWithRootViewController:", v111);
      objc_msgSend(v109, "setModalPresentationStyle:", 2);
      +[OBWelcomeController preferredContentSize](OBWelcomeController, "preferredContentSize");
      *(double *)&v108 = v10;
      *((double *)&v108 + 1) = v11;
      v107 = v108;
      objc_msgSend(v109, "setForcedPreferredContentSize:", v10, v11);
      v12 = +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
      objc_msgSend(v12, "applyThemeToNavigationController:", v109);

      v13 = v116;
      v14 = -[BuddyNavigationFlowController navigator](v116, "navigator");
      v15 = -[BuddyNavigationFlowNavigator navigationController](v14, "navigationController");
      -[BuddyNavigationFlowController navigationController:willShowViewController:operation:animated:](v13, "navigationController:willShowViewController:operation:animated:", v15, v111, 1, 1);

      v16 = -[BuddyNavigationFlowController navigator](v116, "navigator");
      v17 = v109;
      v18 = v114;
      v99 = _NSConcreteStackBlock;
      v100 = -1073741824;
      v101 = 0;
      v102 = sub_100068F00;
      v103 = &unk_100281168;
      v104 = v116;
      v105 = v111;
      v106 = v112;
      -[BuddyNavigationFlowNavigator presentViewController:animated:completion:](v16, "presentViewController:animated:completion:", v17, v18, &v99);

      objc_storeStrong(&v106, 0);
      objc_storeStrong(&v105, 0);
      objc_storeStrong((id *)&v104, 0);
      objc_storeStrong(&v109, 0);
    }
    else if (v114)
    {
      v98 = -[BuddyNavigationFlowController _shieldColorForNewTopFlowItemPush](v116, "_shieldColorForNewTopFlowItemPush");
      v19 = -[BuddyNavigationFlowController navigator](v116, "navigator");
      if (v98)
      {
        v91 = _NSConcreteStackBlock;
        v92 = -1073741824;
        v93 = 0;
        v94 = sub_100068FA4;
        v95 = &unk_100281190;
        v97 = v112;
        v96 = v111;
        -[BuddyNavigationFlowNavigator pushViewController:usingShieldColor:completion:](v19, "pushViewController:usingShieldColor:completion:", v111, v98, &v91);

        objc_storeStrong(&v96, 0);
        objc_storeStrong(&v97, 0);
      }
      else
      {
        v84 = _NSConcreteStackBlock;
        v85 = -1073741824;
        v86 = 0;
        v87 = sub_100068FE0;
        v88 = &unk_100281190;
        v90 = v112;
        v89 = v111;
        -[BuddyNavigationFlowNavigator pushViewController:completion:](v19, "pushViewController:completion:", v111, &v84);

        objc_storeStrong(&v89, 0);
        objc_storeStrong(&v90, 0);
      }
      objc_storeStrong(&v98, 0);
    }
    else
    {
      v20 = -[BuddyNavigationFlowController navigator](v116, "navigator");
      -[BuddyNavigationFlowNavigator pushViewController:animated:](v20, "pushViewController:animated:", v111, 0);

      if (v112)
        (*((void (**)(id, id))v112 + 2))(v112, v111);
    }
  }
  else if ((objc_opt_respondsToSelector(location[0], "presentHostedViewControllerOnNavigationController:completion:") & 1) != 0)
  {
    v83 = 0;
    v21 = -[BuddyNavigationFlowController buddyControllers](v116, "buddyControllers");
    v22 = -[NSMutableArray lastObject](v21, "lastObject");
    v23 = objc_opt_respondsToSelector(v22, "shouldSuppressExtendedInitializationActivityIndicator");

    if ((v23 & 1) != 0)
    {
      v25 = -[BuddyNavigationFlowController buddyControllers](v116, "buddyControllers");
      v26 = -[NSMutableArray lastObject](v25, "lastObject");
      v83 = objc_msgSend(v26, "shouldSuppressExtendedInitializationActivityIndicator") & 1;

    }
    oslog = (os_log_t)(id)_BYLoggingFacility(v24);
    v81 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v27 = -[BuddyNavigationFlowController buddyControllers](v116, "buddyControllers");
      v28 = -[NSMutableArray lastObject](v27, "lastObject");
      v80 = v28;
      if ((v83 & 1) != 0)
        v29 = CFSTR("YEP");
      else
        v29 = CFSTR("NERP");
      sub_10003A6BC((uint64_t)buf, (uint64_t)v28, (uint64_t)v29);
      _os_log_impl((void *)&_mh_execute_header, oslog, v81, "Should suppress spinner over %{public}@: %{public}@", buf, 0x16u);

      objc_storeStrong(&v80, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
    if ((v83 & 1) == 0)
    {
      v31 = -[BuddyNavigationFlowController navigator](v116, "navigator");
      v32 = -[BuddyNavigationFlowNavigator topViewController](v31, "topViewController");
      +[BFFViewControllerSpinnerManager startAnimatingSpinnerFor:identifier:](BFFViewControllerSpinnerManager, "startAnimatingSpinnerFor:identifier:", v32, CFSTR("BuddyNavigationFlowController"));

    }
    v79 = (os_log_t)(id)_BYLoggingFacility(v30);
    v78 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
    {
      v33 = -[BuddyNavigationFlowController navigator](v116, "navigator");
      v34 = -[BuddyNavigationFlowNavigator view](v33, "view");
      v35 = objc_msgSend(v34, "window");
      sub_100066BA8((uint64_t)v118, (uint64_t)"-[BuddyNavigationFlowController _presentViewControllerForBuddyController:animated:willPresentViewController:completion:]", (uint64_t)v35);
      _os_log_debug_impl((void *)&_mh_execute_header, v79, v78, "%s setUserInteractionEnabled NO %p", v118, 0x16u);

    }
    objc_storeStrong((id *)&v79, 0);
    v36 = -[BuddyNavigationFlowController navigator](v116, "navigator");
    v37 = -[BuddyNavigationFlowNavigator view](v36, "view");
    v38 = objc_msgSend(v37, "window");
    objc_msgSend(v38, "setUserInteractionEnabled:", 0);

    v74[0] = 0;
    v74[1] = v74;
    v75 = 0x20000000;
    v76 = 32;
    v77 = 0;
    v70[0] = 0;
    v70[1] = v70;
    v71 = 0x20000000;
    v72 = 32;
    v73 = 0;
    v69 = (os_log_t)(id)_BYLoggingFacility(v39);
    v68 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      v67 = (id)objc_opt_class(location[0]);
      sub_100039500((uint64_t)v117, (uint64_t)v67);
      _os_log_impl((void *)&_mh_execute_header, v69, v68, "Running hosted view controller creation for %{public}@", v117, 0xCu);
      objc_storeStrong(&v67, 0);
    }
    objc_storeStrong((id *)&v69, 0);
    v66 = dispatch_semaphore_create(0);
    v65 = +[NSDate date](NSDate, "date");
    v40 = location[0];
    v41 = -[BuddyNavigationFlowController navigator](v116, "navigator");
    v42 = -[BuddyNavigationFlowNavigator navigationController](v41, "navigationController");
    v54 = _NSConcreteStackBlock;
    v55 = -1073741824;
    v56 = 0;
    v57 = sub_10006901C;
    v58 = &unk_1002811B8;
    v59 = v116;
    v64[1] = v74;
    v64[2] = v70;
    v60 = v66;
    v61 = location[0];
    v62 = v65;
    v63 = v113;
    v64[0] = v112;
    objc_msgSend(v40, "presentHostedViewControllerOnNavigationController:completion:", v42, &v54);

    if ((objc_opt_respondsToSelector(location[0], "cancelHostedPresentation") & 1) != 0)
    {
      v43 = dispatch_get_global_queue(-2, 0);
      block = _NSConcreteStackBlock;
      v45 = -1073741824;
      v46 = 0;
      v47 = sub_100069428;
      v48 = &unk_100281208;
      v49 = v66;
      v50 = location[0];
      v53[1] = v70;
      v51 = v116;
      v53[2] = v74;
      v53[0] = v112;
      v52 = v111;
      dispatch_async(v43, &block);

      objc_storeStrong(&v52, 0);
      objc_storeStrong(v53, 0);
      objc_storeStrong((id *)&v51, 0);
      objc_storeStrong(&v50, 0);
      objc_storeStrong(&v49, 0);
    }
    objc_storeStrong(v64, 0);
    objc_storeStrong(&v63, 0);
    objc_storeStrong(&v62, 0);
    objc_storeStrong(&v61, 0);
    objc_storeStrong(&v60, 0);
    objc_storeStrong((id *)&v59, 0);
    objc_storeStrong(&v65, 0);
    objc_storeStrong(&v66, 0);
    _Block_object_dispose(v70, 8);
    _Block_object_dispose(v74, 8);
  }
  else if (v112)
  {
    (*((void (**)(id, _QWORD))v112 + 2))(v112, 0);
  }
  objc_storeStrong(&v111, 0);
  objc_storeStrong(&v112, 0);
  objc_storeStrong(&v113, 0);
  objc_storeStrong(location, 0);
}

- (id)_shieldColorForNewTopFlowItemPush
{
  NSMutableArray *v2;
  char v3;
  unsigned __int8 v4;
  id location[3];
  UIColor *v7;

  location[2] = self;
  location[1] = (id)a2;
  v2 = -[BuddyNavigationFlowController buddyControllers](self, "buddyControllers");
  location[0] = -[NSMutableArray lastObject](v2, "lastObject");

  v3 = objc_opt_respondsToSelector(location[0], "hasBlackBackground");
  v4 = 0;
  if ((v3 & 1) != 0)
    v4 = objc_msgSend(location[0], "hasBlackBackground");
  if ((v4 & 1) != 0)
    v7 = +[UIColor blackColor](UIColor, "blackColor");
  else
    v7 = 0;
  objc_storeStrong(location, 0);
  return v7;
}

- (id)_viewControllerForBuddyController:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  id v9;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  if ((objc_opt_respondsToSelector(location[0], "viewController") & 1) != 0)
  {
    v3 = objc_msgSend(location[0], "viewController");
    v4 = v9;
    v9 = v3;

  }
  else
  {
    v5 = location[0];
    v6 = objc_opt_class(UIViewController);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
      objc_storeStrong(&v9, location[0]);
  }
  v7 = v9;
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return v7;
}

- (void)_hideBackButtonIfNecessaryOnFlowItem:(id)a3 withViewController:(id)a4
{
  NSMutableArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  unsigned __int8 v11;
  unsigned __int8 v12;
  uint64_t v13;
  id v14;
  id v15;
  os_log_type_t v16;
  os_log_t oslog;
  int v18;
  char v19;
  id v20;
  char v21;
  char v22;
  id v23;
  _QWORD __b[8];
  id obj;
  id v26;
  id v27;
  id location[2];
  BuddyNavigationFlowController *v29;
  uint8_t buf[24];
  _BYTE v31[128];

  v29 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v27 = 0;
  objc_storeStrong(&v27, a4);
  v26 = 0;
  memset(__b, 0, sizeof(__b));
  v5 = -[BuddyNavigationFlowController buddyControllers](v29, "buddyControllers");
  v6 = -[NSMutableArray reverseObjectEnumerator](v5, "reverseObjectEnumerator");

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", __b, v31, 16);
  if (v7)
  {
    v8 = *(_QWORD *)__b[2];
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)__b[2] != v8)
        objc_enumerationMutation(v6);
      obj = *(id *)(__b[1] + 8 * v9);
      v23 = -[BuddyNavigationFlowController _viewControllerForBuddyController:](v29, "_viewControllerForBuddyController:", obj);
      v22 = 0;
      v10 = objc_opt_respondsToSelector(obj, "isEphemeral");
      v11 = 0;
      if ((v10 & 1) != 0)
        v11 = objc_msgSend(obj, "isEphemeral");
      v22 = v11 & 1;
      v21 = 0;
      v19 = 0;
      v12 = 0;
      if (v23)
      {
        v20 = -[BuddyNavigationFlowController viewControllersToRemoveOnPush](v29, "viewControllersToRemoveOnPush");
        v19 = 1;
        v12 = objc_msgSend(v20, "containsObject:", v23);
      }
      if ((v19 & 1) != 0)

      v21 = v12 & 1;
      if (!v23 || (v22 & 1) != 0 || (v21 & 1) != 0)
      {
        v18 = 0;
      }
      else
      {
        objc_storeStrong(&v26, obj);
        v18 = 2;
      }
      objc_storeStrong(&v23, 0);
      if (v18)
        break;
      if (++v9 >= (unint64_t)v7)
      {
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", __b, v31, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_20;
      }
    }
  }
  else
  {
LABEL_20:
    v18 = 0;
  }

  oslog = (os_log_t)(id)_BYLoggingFacility(v13);
  v16 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (id)objc_opt_class(v26);
    sub_100039500((uint64_t)buf, (uint64_t)v15);
    _os_log_impl((void *)&_mh_execute_header, oslog, v16, "Considering %{public}@ for back button", buf, 0xCu);
    objc_storeStrong(&v15, 0);
  }
  objc_storeStrong((id *)&oslog, 0);
  if (v26
    && (objc_opt_respondsToSelector(v26, "controllerAllowsNavigatingBack") & 1) != 0
    && (objc_msgSend(v26, "controllerAllowsNavigatingBack") & 1) == 0)
  {
    v14 = objc_msgSend(v27, "navigationItem");
    objc_msgSend(v14, "setHidesBackButton:", 1);

  }
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(location, 0);
}

- (void)removeViewControllerFromNavHierarchy:(id)a3
{
  BuddyNavigationFlowNavigator *v3;
  id v4;
  BuddyNavigationFlowNavigator *v5;
  id v6;
  id location[2];
  BuddyNavigationFlowController *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyNavigationFlowController navigator](v8, "navigator");
  v4 = -[BuddyNavigationFlowNavigator viewControllers](v3, "viewControllers");
  v6 = objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v6, "removeObject:", location[0]);
  v5 = -[BuddyNavigationFlowController navigator](v8, "navigator");
  -[BuddyNavigationFlowNavigator setViewControllers:animated:](v5, "setViewControllers:animated:", v6, 0);

  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)_updateNavigationBackButtonTitleForViewController:(id)a3
{
  id v3;
  id v4;
  id v5;
  BuddyNavigationFlowController *v6;
  NSMutableArray *v7;
  id v8;
  id v9;
  id v10;
  NSMutableArray *v11;
  objc_class *v12;
  id v13;
  id v14;
  id v15;
  os_log_type_t v16;
  os_log_t oslog;
  id v18;
  int v19;
  id v20;
  id location[2];
  BuddyNavigationFlowController *v22;
  uint8_t buf[24];

  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = objc_msgSend(location[0], "navigationItem");
  objc_msgSend(v3, "setBackButtonDisplayMode:", 1);

  v4 = objc_msgSend(location[0], "navigationItem");
  v5 = objc_msgSend(v4, "backButtonTitle");

  if (v5)
  {
LABEL_13:
    v19 = 0;
    goto LABEL_14;
  }
  v6 = v22;
  v7 = -[BuddyNavigationFlowController buddyControllers](v22, "buddyControllers");
  v8 = -[NSMutableArray lastObject](v7, "lastObject");
  v9 = -[BuddyNavigationFlowController _viewControllerForBuddyController:](v6, "_viewControllerForBuddyController:", v8);
  v10 = location[0];

  if (v9 != v10
    || ((v11 = -[BuddyNavigationFlowController buddyControllers](v22, "buddyControllers"),
         v20 = -[NSMutableArray lastObject](v11, "lastObject"),
         v11,
         (objc_opt_respondsToSelector(v20, "isEphemeral") & 1) == 0)
     || (objc_msgSend(v20, "isEphemeral") & 1) == 0
      ? (v19 = 0)
      : (v19 = 1),
        objc_storeStrong(&v20, 0),
        !v19))
  {
    v18 = -[BuddyNavigationFlowController _titleForViewController:](v22, "_titleForViewController:", location[0]);
    if (!v18)
    {
      oslog = (os_log_t)(id)_BYLoggingFacility(0);
      v16 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        v12 = (objc_class *)objc_opt_class(location[0]);
        v15 = NSStringFromClass(v12);
        sub_100038C28((uint64_t)buf, (uint64_t)v15);
        _os_log_error_impl((void *)&_mh_execute_header, oslog, v16, "Unable to determine title for view controller %@", buf, 0xCu);

        objc_storeStrong(&v15, 0);
      }
      objc_storeStrong((id *)&oslog, 0);
    }
    v13 = v18;
    v14 = objc_msgSend(location[0], "navigationItem");
    objc_msgSend(v14, "setBackButtonTitle:", v13);

    objc_storeStrong(&v18, 0);
    goto LABEL_13;
  }
LABEL_14:
  objc_storeStrong(location, 0);
}

- (id)_titleForViewController:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  id v10;
  id v11;
  int v12;
  id location[3];
  id v14;

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = objc_msgSend(location[0], "title");

  if (v3)
  {
    v14 = objc_msgSend(location[0], "title");
    v12 = 1;
  }
  else
  {
    v4 = location[0];
    v5 = objc_opt_class(OBWelcomeController);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v11 = location[0];
      v6 = objc_msgSend(v11, "headerView");
      v14 = objc_msgSend(v6, "title");

      v12 = 1;
      objc_storeStrong(&v11, 0);
    }
    else
    {
      v7 = location[0];
      v8 = objc_opt_class(RUIPage);
      if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
      {
        v10 = location[0];
        v14 = objc_msgSend(v10, "navTitle");
        v12 = 1;
        objc_storeStrong(&v10, 0);
      }
      else
      {
        v14 = 0;
        v12 = 1;
      }
    }
  }
  objc_storeStrong(location, 0);
  return v14;
}

- (id)_flowForFlowItem:(id)a3
{
  NSMutableArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  unsigned __int8 v11;
  int v13;
  id v14;
  _QWORD __b[8];
  id v16;
  id location[2];
  BuddyNavigationFlowController *v18;
  id v19;
  _BYTE v20[128];

  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  memset(__b, 0, sizeof(__b));
  v3 = -[BuddyNavigationFlowController buddyControllers](v18, "buddyControllers");
  v4 = -[NSMutableArray reverseObjectEnumerator](v3, "reverseObjectEnumerator");

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", __b, v20, 16);
  if (v5)
  {
    v6 = *(_QWORD *)__b[2];
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)__b[2] != v6)
        objc_enumerationMutation(v4);
      v16 = *(id *)(__b[1] + 8 * v7);
      v8 = v16;
      v9 = objc_opt_class(BFFFlow);
      if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
      {
        v14 = v16;
        v10 = objc_msgSend(v14, "controllers");
        v11 = objc_msgSend(v10, "containsObject:", location[0]);

        if ((v11 & 1) != 0)
        {
          v19 = v14;
          v13 = 1;
        }
        else
        {
          v13 = 0;
        }
        objc_storeStrong(&v14, 0);
        if (v13)
          break;
      }
      if (++v7 >= (unint64_t)v5)
      {
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", __b, v20, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_13;
      }
    }
  }
  else
  {
LABEL_13:
    v13 = 0;
  }

  if (!v13)
    v19 = 0;
  objc_storeStrong(location, 0);
  return v19;
}

- (BOOL)_isFlowItemAllowed:(id)a3
{
  BuddyFlowProducer *v3;
  id v5;
  id location[2];
  BuddyNavigationFlowController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyNavigationFlowController flowProducer](v7, "flowProducer");
  v5 = objc_msgSend((id)objc_opt_class(v3), "allowedFlowItems");

  LOBYTE(v3) = objc_msgSend(v5, "containsObject:", objc_opt_class(location[0]));
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
  return v3 & 1;
}

- (id)_lastNonFlowFlowItemRelativeToFlowItem:(id)a3
{
  NSMutableArray *v3;
  uint64_t v4;
  NSMutableArray *v5;
  id v6;
  NSMutableArray *v7;
  char *v8;
  NSMutableArray *v9;
  id v10;
  id v11;
  id v12;
  id v14;
  id location[2];
  BuddyNavigationFlowController *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyNavigationFlowController buddyControllers](v16, "buddyControllers");
  v14 = -[NSMutableArray lastObject](v3, "lastObject");

  while (1)
  {
    v4 = objc_opt_class(BFFFlow);
    if ((objc_opt_isKindOfClass(v14, v4) & 1) == 0)
      break;
    v5 = -[BuddyNavigationFlowController buddyControllers](v16, "buddyControllers");
    v6 = -[NSMutableArray firstObject](v5, "firstObject");

    if (v14 == v6)
    {
      objc_storeStrong(&v14, 0);
      break;
    }
    v7 = -[BuddyNavigationFlowController buddyControllers](v16, "buddyControllers");
    v8 = (char *)-[NSMutableArray indexOfObject:](v7, "indexOfObject:", v14) - 1;

    v9 = -[BuddyNavigationFlowController buddyControllers](v16, "buddyControllers");
    v10 = -[NSMutableArray objectAtIndex:](v9, "objectAtIndex:", v8);
    v11 = v14;
    v14 = v10;

  }
  v12 = v14;
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
  return v12;
}

- (void)_beginEventForNavigationDuration
{
  NSDate *v2;

  v2 = +[NSDate date](NSDate, "date", a2);
  -[BuddyNavigationFlowController setNavigationStartDate:](self, "setNavigationStartDate:", v2);

}

- (void)_endEventForNavigationDurationFromFlowItem:(id)a3 toFlowItem:(id)a4
{
  NSDate *v5;
  objc_class *v6;
  BYAnalyticsManager *v7;
  objc_class *v8;
  NSString *v9;
  NSDate *v10;
  double v11;
  NSNumber *v12;
  NSDictionary *v13;
  NSString *v14;
  id v15;
  id location[2];
  BuddyNavigationFlowController *v17;
  _QWORD v18[3];
  _QWORD v19[3];

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = 0;
  objc_storeStrong(&v15, a4);
  v5 = -[BuddyNavigationFlowController navigationStartDate](v17, "navigationStartDate");
  LOBYTE(a4) = v5 == 0;

  if ((a4 & 1) != 0)
    objc_exception_throw(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("Attempted to add event for navigation duration without navigation start date"), 0, 0));
  v6 = (objc_class *)objc_opt_class(location[0]);
  v14 = NSStringFromClass(v6);
  if (!v14)
    objc_storeStrong((id *)&v14, CFSTR("(null)"));
  v7 = -[BuddyNavigationFlowController analyticsManager](v17, "analyticsManager", v14);
  v18[0] = CFSTR("startClass");
  v19[0] = v14;
  v18[1] = CFSTR("endClass");
  v8 = (objc_class *)objc_opt_class(v15);
  v9 = NSStringFromClass(v8);
  v19[1] = v9;
  v18[2] = CFSTR("duration");
  v10 = -[BuddyNavigationFlowController navigationStartDate](v17, "navigationStartDate");
  -[NSDate timeIntervalSinceNow](v10, "timeIntervalSinceNow");
  v12 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", -v11);
  v19[2] = v12;
  v13 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
  -[BYAnalyticsManager addEvent:withPayload:persist:](v7, "addEvent:withPayload:persist:", CFSTR("com.apple.setupassistant.ios.navigation.duration"), v13, 1);

  -[BuddyNavigationFlowController setNavigationStartDate:](v17, "setNavigationStartDate:", 0);
  objc_storeStrong((id *)&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
}

- (void)_resumeNavigationQueue
{
  OS_dispatch_queue *v2;

  v2 = -[BuddyNavigationFlowController navigationQueue](self, "navigationQueue", a2, self);
  dispatch_resume((dispatch_object_t)v2);

}

- (void)_setupInitialFlowFromInitialFlowItem:(id)a3 debutFlowItemClass:(Class)a4 completion:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  Class v14;
  uint64_t v15;
  BuddyNavigationFlowNavigator *v16;
  NSArray *v17;
  BuddyFlowProducer *v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  unint64_t i;
  NSMutableArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  BuddyNavigationFlowNavigator *v31;
  os_log_t oslog;
  id v33;
  _QWORD __b[8];
  uint64_t v35;
  id v36;
  id v37;
  NSString *v38;
  id v39;
  NSString *v40;
  Class v41;
  int v42;
  id v43;
  id v44;
  BOOL v45;
  id v46;
  uint64_t v47;
  id v48;
  id v49;
  Class v50;
  id location[2];
  BuddyNavigationFlowController *v52;
  uint8_t buf[32];
  _BYTE v54[128];
  id v55;

  v52 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v50 = a4;
  v49 = 0;
  objc_storeStrong(&v49, a5);
  v48 = objc_alloc_init((Class)NSMutableArray);
  objc_msgSend(v48, "addObject:", location[0]);
  v7 = objc_msgSend(v48, "lastObject");
  v47 = objc_opt_class(v7);

  v8 = location[0];
  v9 = objc_opt_class(BFFFlow);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
  {
    v46 = location[0];
    objc_msgSend(v46, "startFlowWithAllFlowItems");
    v10 = objc_msgSend(v46, "controllers");
    objc_msgSend(v48, "addObjectsFromArray:", v10);

    objc_storeStrong(&v46, 0);
  }
  v11 = objc_opt_class(location[0]);
  v45 = v11 == (_QWORD)v50;
  v12 = location[0];
  v13 = objc_opt_class(DeviceRestoreChoiceController);
  if ((objc_opt_isKindOfClass(v12, v13) & 1) == 0)
    goto LABEL_9;
  v14 = v50;
  if (v14 != (Class)objc_opt_class(BuddyUpgradeMigrationFlow))
    goto LABEL_9;
  v44 = -[BuddyNavigationFlowController _createConditionalFlowItemForClass:](v52, "_createConditionalFlowItemForClass:", v50);
  v15 = objc_opt_class(BFFFlow);
  if ((objc_opt_isKindOfClass(v44, v15) & 1) != 0)
  {
    objc_msgSend(v48, "addObject:", v44);
    v43 = -[BuddyNavigationFlowController _viewControllerForBuddyController:](v52, "_viewControllerForBuddyController:", location[0]);
    -[BuddyNavigationFlowController setBuddyControllers:](v52, "setBuddyControllers:", v48);
    v16 = -[BuddyNavigationFlowController navigator](v52, "navigator");
    v55 = v43;
    v17 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v55, 1);
    -[BuddyNavigationFlowNavigator setViewControllers:animated:](v16, "setViewControllers:animated:", v17, 0);

    objc_msgSend(v44, "startFlowAnimated:", 0);
    (*((void (**)(void))v49 + 2))();
    v42 = 1;
    objc_storeStrong(&v43, 0);
  }
  else
  {
    v42 = 0;
  }
  objc_storeStrong(&v44, 0);
  if (!v42)
  {
LABEL_9:
    while (!v45)
    {
      v41 = 0;
      v18 = -[BuddyNavigationFlowController flowProducer](v52, "flowProducer");
      v41 = (Class)-[BuddyFlowProducer potentialNextFlowItemClassFollowingFlowItemClass:](v18, "potentialNextFlowItemClassFollowingFlowItemClass:", v47);

      if (!v41)
      {
        v40 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unable to find debut flow item (%@)"), v50);
        objc_exception_throw(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", v40, 0, 0));
      }
      v39 = -[BuddyNavigationFlowController _createConditionalFlowItemForClass:](v52, "_createConditionalFlowItemForClass:", v41);
      if (v39)
      {
        objc_msgSend(v48, "addObject:", v39);
        v19 = v39;
        v20 = objc_opt_class(BFFFlow);
        if ((objc_opt_isKindOfClass(v19, v20) & 1) != 0)
        {
          v37 = v39;
          objc_msgSend(v37, "startFlowWithAllFlowItems");
          v21 = v48;
          v22 = objc_msgSend(v37, "controllers");
          objc_msgSend(v21, "addObjectsFromArray:", v22);

          objc_storeStrong(&v37, 0);
        }
        v47 = (uint64_t)v41;
        v45 = v41 == v50;
        v42 = 0;
      }
      else
      {
        if (v50 == v41)
        {
          v38 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Debut flow item (%@) could not be created"), v50);
          objc_exception_throw(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", v38, 0, 0));
        }
        v47 = (uint64_t)v41;
        v42 = 2;
      }
      objc_storeStrong(&v39, 0);
    }
    v36 = objc_alloc_init((Class)NSMutableArray);
    memset(__b, 0, sizeof(__b));
    v23 = v48;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", __b, v54, 16);
    if (v24)
    {
      v25 = *(_QWORD *)__b[2];
      do
      {
        for (i = 0; i < (unint64_t)v24; ++i)
        {
          if (*(_QWORD *)__b[2] != v25)
            objc_enumerationMutation(v23);
          v35 = *(_QWORD *)(__b[1] + 8 * i);
          v27 = -[BuddyNavigationFlowController buddyControllers](v52, "buddyControllers");
          -[NSMutableArray addObject:](v27, "addObject:", v35);

          v28 = v35;
          v29 = objc_opt_class(BFFFlow);
          if ((objc_opt_isKindOfClass(v28, v29) & 1) == 0)
          {
            v33 = -[BuddyNavigationFlowController _viewControllerForBuddyController:](v52, "_viewControllerForBuddyController:", v35);
            if (!v33)
              objc_exception_throw(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("No view controller found for flow item (%@) while making our debut"), v35), 0, 0));
            objc_msgSend(v36, "addObject:", v33);
            objc_storeStrong(&v33, 0);
          }
        }
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", __b, v54, 16);
      }
      while (v24);
    }

    oslog = (os_log_t)(id)_BYLoggingFacility(v30);
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_10003EB04((uint64_t)buf, (uint64_t)v50, (uint64_t)v48);
      _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Making debut to %@ with the flow items: %@", buf, 0x16u);
    }
    objc_storeStrong((id *)&oslog, 0);
    -[BuddyNavigationFlowController setBuddyControllers:](v52, "setBuddyControllers:", v48);
    v31 = -[BuddyNavigationFlowController navigator](v52, "navigator");
    -[BuddyNavigationFlowNavigator setViewControllers:animated:](v31, "setViewControllers:animated:", v36, 0);

    if (v49)
      (*((void (**)(void))v49 + 2))();
    objc_storeStrong(&v36, 0);
    v42 = 0;
  }
  objc_storeStrong(&v48, 0);
  objc_storeStrong(&v49, 0);
  objc_storeStrong(location, 0);
}

- (void)_insertWiFiControllerAsFirstPane
{
  BuddyNavigationFlowNavigator *v2;
  id v3;
  BuddyWiFiController *v4;
  id v5;
  BuddyWiFiController *v6;
  BuddyWiFiController *v7;
  BuddyNavigationFlowNavigator *v8;
  BFFNavigationController *v9;
  NSMutableArray *v10;
  BuddyWiFiController *v11;
  BuddyNavigationFlowNavigator *v12;
  id location[2];
  BuddyNavigationFlowController *v14;

  v14 = self;
  location[1] = (id)a2;
  v2 = -[BuddyNavigationFlowController navigator](self, "navigator");
  v3 = -[BuddyNavigationFlowNavigator viewControllers](v2, "viewControllers");
  location[0] = objc_msgSend(v3, "mutableCopy");

  v4 = -[BuddyNavigationFlowController wifiController](v14, "wifiController");
  v5 = -[BuddyWiFiController viewController](v4, "viewController");
  objc_msgSend(location[0], "insertObject:atIndex:", v5, 0);

  v6 = -[BuddyNavigationFlowController wifiController](v14, "wifiController");
  -[BuddyWiFiController updateNextButton](v6, "updateNextButton");

  v7 = -[BuddyNavigationFlowController wifiController](v14, "wifiController");
  v8 = -[BuddyNavigationFlowController navigator](v14, "navigator");
  v9 = -[BuddyNavigationFlowNavigator navigationController](v8, "navigationController");
  -[BuddyWiFiController setNavigationController:](v7, "setNavigationController:", v9);

  v10 = -[BuddyNavigationFlowController buddyControllers](v14, "buddyControllers");
  v11 = -[BuddyNavigationFlowController wifiController](v14, "wifiController");
  -[NSMutableArray insertObject:atIndex:](v10, "insertObject:atIndex:", v11, 0);

  v12 = -[BuddyNavigationFlowController navigator](v14, "navigator");
  -[BuddyNavigationFlowNavigator setViewControllers:animated:](v12, "setViewControllers:animated:", location[0], 0);

  objc_storeStrong(location, 0);
}

- (BOOL)_hasWiFiControllerInNavigationStack
{
  BuddyNavigationFlowNavigator *v2;
  id v3;
  id v4;
  uint64_t v5;
  unint64_t i;
  uint64_t v7;
  id v8;
  int v10;
  _QWORD __b[8];
  uint64_t v12;
  SEL v13;
  BuddyNavigationFlowController *v14;
  char v15;
  _BYTE v16[128];

  v14 = self;
  v13 = a2;
  memset(__b, 0, sizeof(__b));
  v2 = -[BuddyNavigationFlowController navigator](v14, "navigator");
  v3 = -[BuddyNavigationFlowNavigator viewControllers](v2, "viewControllers");

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", __b, v16, 16);
  if (v4)
  {
    v5 = *(_QWORD *)__b[2];
    do
    {
      for (i = 0; i < (unint64_t)v4; ++i)
      {
        if (*(_QWORD *)__b[2] != v5)
          objc_enumerationMutation(v3);
        v12 = *(_QWORD *)(__b[1] + 8 * i);
        v7 = v12;
        v8 = sub_10006B464();
        if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
        {
          v15 = 1;
          v10 = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", __b, v16, 16);
    }
    while (v4);
  }
  v10 = 0;
LABEL_11:

  if (!v10)
    v15 = 0;
  return v15 & 1;
}

- (void)restartFlow
{
  BuddyFlowDelegate *v2;
  BuddyNavigationFlowNavigator *v3;
  id v4;
  id v5;
  int v6;
  NSMutableArray *v7;
  id v8;
  uint64_t v9;
  unint64_t i;
  BuddyNavigationFlowNavigator *v11;
  id v12;
  BuddyNavigationFlowNavigator *v13;
  BuddyNavigationFlowNavigator *v14;
  id v15;
  id v16;
  BYPreferencesController *v17;
  BuddyNavigationFlowNavigator *v18;
  id v19;
  NSMutableArray *v20;
  uint64_t v21;
  NSMutableArray *v22;
  NSMutableArray *v23;
  id v24;
  unsigned __int8 v25;
  uint64_t v26;
  NSMutableArray *v27;
  NSMutableArray *v28;
  id v29;
  NSObject *v30;
  os_log_type_t v31;
  NSMutableArray *v32;
  NSMutableArray *v33;
  id v34;
  NSMutableArray *v35;
  NSMutableArray *v36;
  id v37;
  BuddyFlowDelegate *v38;
  uint8_t buf[15];
  char v40;
  os_log_t oslog[3];
  id location;
  id v43;
  id v44;
  _QWORD __b[8];
  id v46;
  SEL v47;
  BuddyNavigationFlowController *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  _BYTE v61[128];

  v48 = self;
  v47 = a2;
  v2 = -[BuddyNavigationFlowController flowDelegate](self, "flowDelegate");
  v3 = -[BuddyNavigationFlowController navigator](v48, "navigator");
  v4 = -[BuddyNavigationFlowNavigator viewControllers](v3, "viewControllers");
  v5 = objc_msgSend(v4, "firstObject");
  v6 = -[BuddyFlowDelegate willRestartFlowToViewController:](v2, "willRestartFlowToViewController:", v5) & 1;

  if (v6)
  {
    memset(__b, 0, sizeof(__b));
    v7 = -[BuddyNavigationFlowController buddyControllers](v48, "buddyControllers");
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", __b, v61, 16);
    if (v8)
    {
      v9 = *(_QWORD *)__b[2];
      do
      {
        for (i = 0; i < (unint64_t)v8; ++i)
        {
          if (*(_QWORD *)__b[2] != v9)
            objc_enumerationMutation(v7);
          v46 = *(id *)(__b[1] + 8 * i);
          if ((objc_opt_respondsToSelector(v46, "startOver") & 1) != 0)
            objc_msgSend(v46, "startOver");
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", __b, v61, 16);
      }
      while (v8);
    }

    v11 = -[BuddyNavigationFlowController navigator](v48, "navigator");
    v12 = -[BuddyNavigationFlowNavigator presentedViewController](v11, "presentedViewController");

    if (v12)
    {
      v13 = -[BuddyNavigationFlowController navigator](v48, "navigator");
      -[BuddyNavigationFlowNavigator dismissViewControllerAnimated:completion:](v13, "dismissViewControllerAnimated:completion:", 0, 0);

    }
    else
    {
      v14 = -[BuddyNavigationFlowController navigator](v48, "navigator");
      v15 = -[BuddyNavigationFlowNavigator viewControllers](v14, "viewControllers");
      v16 = objc_msgSend(v15, "count");

      if ((unint64_t)v16 > 1)
      {
        v17 = -[BuddyNavigationFlowController buddyPreferences](v48, "buddyPreferences");
        -[BYPreferencesController reset](v17, "reset");

      }
    }
    v18 = -[BuddyNavigationFlowController navigator](v48, "navigator");
    v19 = -[BuddyNavigationFlowNavigator popToRootViewControllerAnimated:](v18, "popToRootViewControllerAnimated:", 1);

    v20 = -[BuddyNavigationFlowController buddyControllers](v48, "buddyControllers");
    v44 = -[NSMutableArray objectAtIndexedSubscript:](v20, "objectAtIndexedSubscript:", 0);

    objc_msgSend(v44, "setDelegate:", v48);
    v21 = objc_opt_class(BFFFlow);
    if ((objc_opt_isKindOfClass(v44, v21) & 1) != 0)
    {
      v22 = -[BuddyNavigationFlowController buddyControllers](v48, "buddyControllers");
      v43 = -[NSMutableArray objectAtIndexedSubscript:](v22, "objectAtIndexedSubscript:", 0);

      v23 = -[BuddyNavigationFlowController buddyControllers](v48, "buddyControllers");
      location = -[NSMutableArray objectAtIndexedSubscript:](v23, "objectAtIndexedSubscript:", 1);

      v24 = objc_msgSend(v43, "controllers");
      v25 = objc_msgSend(v24, "containsObject:", location);

      if ((v25 & 1) != 0)
      {
        objc_msgSend(location, "setDelegate:", v43);
        v27 = -[BuddyNavigationFlowController buddyControllers](v48, "buddyControllers");
        v28 = -[BuddyNavigationFlowController buddyControllers](v48, "buddyControllers");
        v58 = 0;
        v57 = 2;
        v59 = 0;
        v60 = 2;
        oslog[2] = (os_log_t)2;
        oslog[1] = 0;
        v29 = -[NSMutableArray subarrayWithRange:](v28, "subarrayWithRange:", 0, 2);
        -[NSMutableArray setArray:](v27, "setArray:", v29);

      }
      else
      {
        oslog[0] = (os_log_t)(id)_BYLoggingFacility(v26);
        v40 = 17;
        if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_FAULT))
        {
          v30 = oslog[0];
          v31 = v40;
          sub_100038C3C(buf);
          _os_log_fault_impl((void *)&_mh_execute_header, v30, v31, "Second controller in controllers array is not a flow item belonging to a flow", buf, 2u);
        }
        objc_storeStrong((id *)oslog, 0);
        v32 = -[BuddyNavigationFlowController buddyControllers](v48, "buddyControllers");
        v33 = -[BuddyNavigationFlowController buddyControllers](v48, "buddyControllers");
        v54 = 0;
        v53 = 1;
        v55 = 0;
        v56 = 1;
        v34 = -[NSMutableArray subarrayWithRange:](v33, "subarrayWithRange:", 0, 1);
        -[NSMutableArray setArray:](v32, "setArray:", v34);

      }
      objc_storeStrong(&location, 0);
      objc_storeStrong(&v43, 0);
    }
    else
    {
      v35 = -[BuddyNavigationFlowController buddyControllers](v48, "buddyControllers");
      v36 = -[BuddyNavigationFlowController buddyControllers](v48, "buddyControllers");
      v50 = 0;
      v49 = 1;
      v51 = 0;
      v52 = 1;
      v37 = -[NSMutableArray subarrayWithRange:](v36, "subarrayWithRange:", 0, 1, 0, 1);
      -[NSMutableArray setArray:](v35, "setArray:", v37);

    }
    v38 = -[BuddyNavigationFlowController flowDelegate](v48, "flowDelegate");
    -[BuddyFlowDelegate didRestartFlow](v38, "didRestartFlow");

    objc_storeStrong(&v44, 0);
  }
}

- (BOOL)_stackHasOnlyCloudConfigurationItems
{
  BuddyNavigationFlowNavigator *v2;
  id v3;
  id v4;
  uint64_t v5;
  unint64_t i;
  int v8;
  _QWORD __b[8];
  uint64_t v10;
  id location[2];
  BuddyNavigationFlowController *v12;
  char v13;
  _BYTE v14[128];
  _QWORD v15[3];

  v12 = self;
  location[1] = (id)a2;
  v15[0] = objc_opt_class(BFFSpinnerController);
  v15[1] = objc_opt_class(BuddyCloudConfigController);
  v15[2] = objc_opt_class(BuddyCloudConfigInstallationController);
  location[0] = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 3);
  memset(__b, 0, sizeof(__b));
  v2 = -[BuddyNavigationFlowController navigator](v12, "navigator");
  v3 = -[BuddyNavigationFlowNavigator viewControllers](v2, "viewControllers");

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", __b, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)__b[2];
    do
    {
      for (i = 0; i < (unint64_t)v4; ++i)
      {
        if (*(_QWORD *)__b[2] != v5)
          objc_enumerationMutation(v3);
        v10 = *(_QWORD *)(__b[1] + 8 * i);
        if ((objc_msgSend(location[0], "containsObject:", objc_opt_class(v10)) & 1) == 0)
        {
          v13 = 0;
          v8 = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", __b, v14, 16);
    }
    while (v4);
  }
  v8 = 0;
LABEL_11:

  if (!v8)
    v13 = 1;
  objc_storeStrong(location, 0);
  return v13 & 1;
}

- (BOOL)controllerNeedsToRunForClass:(Class)a3
{
  BFFFlowStarter *v3;
  unsigned __int8 v4;

  v3 = -[BuddyNavigationFlowController flowStarter](self, "flowStarter");
  v4 = -[BFFFlowStarter controllerNeedsToRunForClass:](v3, "controllerNeedsToRunForClass:", a3);

  return v4 & 1;
}

- (void)markFlowItemDone:(id)a3
{
  uint64_t v3;
  id v4;
  id v5;
  os_log_t oslog;
  id location[3];
  uint8_t buf[24];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  oslog = (os_log_t)(id)_BYLoggingFacility(v3);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    sub_100039500((uint64_t)buf, (uint64_t)location[0]);
    _os_log_debug_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEBUG, "Into the pit you shall fall: %{public}@", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  v4 = location[0];
  v5 = +[BuddyNavigationPit shared](BuddyNavigationPit, "shared");
  objc_msgSend(v4, "setDelegate:", v5);

  objc_storeStrong(location, 0);
}

- (void)_unmarkFlowItemAsFinished:(id)a3
{
  uint64_t v3;
  BuddyNavigationFlowController *v4;
  BuddyNavigationFlowController *v5;
  id v6;
  os_log_type_t v7;
  os_log_t oslog;
  id location[2];
  BuddyNavigationFlowController *v10;
  uint8_t buf[24];

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  oslog = (os_log_t)(id)_BYLoggingFacility(v3);
  v7 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    sub_100039500((uint64_t)buf, (uint64_t)location[0]);
    _os_log_debug_impl((void *)&_mh_execute_header, oslog, v7, "Rise again chosen flowItem: %{public}@", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  v6 = -[BuddyNavigationFlowController _flowForFlowItem:](v10, "_flowForFlowItem:", location[0]);
  if (v6)
  {
    v4 = (BuddyNavigationFlowController *)objc_msgSend(v6, "delegate");
    v5 = v10;

    if (v4 != v5)
      objc_msgSend(v6, "setDelegate:", v10);
    objc_msgSend(location[0], "setDelegate:", v6, v6);
  }
  else
  {
    objc_msgSend(location[0], "setDelegate:", v10);
  }
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)isFlowItemOnTop:(id)a3
{
  NSMutableArray *v3;
  id v4;
  BOOL v5;
  id location[2];
  BuddyNavigationFlowController *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyNavigationFlowController buddyControllers](v8, "buddyControllers");
  v4 = -[NSMutableArray lastObject](v3, "lastObject");
  v5 = v4 == location[0];

  objc_storeStrong(location, 0);
  return v5;
}

- (void)pushFlowItem:(id)a3 animated:(BOOL)a4
{
  id location[2];
  BuddyNavigationFlowController *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[BuddyNavigationFlowController pushFlowItem:inFlow:animated:](v5, "pushFlowItem:inFlow:animated:", location[0], 0, 1);
  objc_storeStrong(location, 0);
}

- (void)pushFlowItem:(id)a3 inFlow:(id)a4 animated:(BOOL)a5
{
  id v7;
  id location[2];
  BuddyNavigationFlowController *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  -[BuddyNavigationFlowController pushFlowItem:inFlow:withExtendedInitialization:animated:](v9, "pushFlowItem:inFlow:withExtendedInitialization:animated:", location[0], v7, 1, a5);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)pushFlowItem:(id)a3 inFlow:(id)a4 withExtendedInitialization:(BOOL)a5 animated:(BOOL)a6
{
  id v9;
  id location[2];
  BuddyNavigationFlowController *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_storeStrong(&v9, a4);
  -[BuddyNavigationFlowController pushFlowItem:inFlow:withExtendedInitialization:animated:willPushFlowItem:](v11, "pushFlowItem:inFlow:withExtendedInitialization:animated:willPushFlowItem:", location[0], v9, a5, a6, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)pushFlowItem:(id)a3 inFlow:(id)a4 withExtendedInitialization:(BOOL)a5 animated:(BOOL)a6 willPushFlowItem:(id)a7
{
  id v11;
  BOOL v12;
  BOOL v13;
  id v14;
  id location[2];
  BuddyNavigationFlowController *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  v13 = a5;
  v12 = a6;
  v11 = 0;
  objc_storeStrong(&v11, a7);
  -[BuddyNavigationFlowController _pushFlowItem:inFlow:withExtendedInitialization:animated:willPushFlowItem:](v16, "_pushFlowItem:inFlow:withExtendedInitialization:animated:willPushFlowItem:", location[0], v14, v13, v12, v11);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

- (void)removeViewControllersOnNextPush:(id)a3
{
  NSArray *v3;
  NSUInteger v4;
  NSArray *v5;
  NSArray *v6;
  BuddyNavigationFlowNavigator *v7;
  id v8;
  id location[2];
  BuddyNavigationFlowController *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyNavigationFlowController viewControllersToRemoveOnPush](v10, "viewControllersToRemoveOnPush");
  v4 = -[NSArray count](v3, "count");

  if (v4)
  {
    v5 = -[BuddyNavigationFlowController viewControllersToRemoveOnPush](v10, "viewControllersToRemoveOnPush");
    v6 = -[NSArray arrayByAddingObjectsFromArray:](v5, "arrayByAddingObjectsFromArray:", location[0]);
    -[BuddyNavigationFlowController setViewControllersToRemoveOnPush:](v10, "setViewControllersToRemoveOnPush:", v6);

  }
  else
  {
    -[BuddyNavigationFlowController setViewControllersToRemoveOnPush:](v10, "setViewControllersToRemoveOnPush:", location[0]);
  }
  v7 = -[BuddyNavigationFlowController navigator](v10, "navigator");
  v8 = -[BuddyNavigationFlowNavigator topViewController](v7, "topViewController");
  -[BuddyNavigationFlowController setTopViewControllerForRemoving:](v10, "setTopViewControllerForRemoving:", v8);

  objc_storeStrong(location, 0);
}

- (id)popToBuddyControllerWithClass:(Class)a3 animated:(BOOL)a4
{
  return -[BuddyNavigationFlowController popToBuddyControllerWithClass:withOffset:animated:](self, "popToBuddyControllerWithClass:withOffset:animated:", a3, 0, a4);
}

- (id)popToBuddyControllerWithClass:(Class)a3 withOffset:(unint64_t)a4 animated:(BOOL)a5
{
  uint64_t (**v5)(id, uint64_t);
  uint64_t v6;
  BuddyNavigationFlowController *v7;
  uint64_t (**v8)(id, uint64_t);
  uint64_t v9;
  BuddyNavigationFlowController *v10;
  void **v12;
  uint64_t v13;
  id (*v14)(uint64_t, uint64_t);
  void *v15;
  BuddyNavigationFlowController *v16;
  id v17[3];
  BOOL v18;
  void **v19;
  int v20;
  int v21;
  void (*v22)(uint64_t);
  void *v23;
  BuddyNavigationFlowController *v24;
  id location;
  char v26;
  int v27;
  void **v28;
  int v29;
  int v30;
  id (*v31)(uint64_t);
  void *v32;
  id v33[3];
  BOOL v34;
  char v35;
  void **v36;
  int v37;
  int v38;
  uint64_t (*v39)(uint64_t, objc_class *);
  void *v40;
  BuddyNavigationFlowController *v41;
  id v42;
  BOOL v43;
  void *v44;
  Class v45;
  SEL v46;
  BuddyNavigationFlowController *v47;
  id v48;

  v47 = self;
  v46 = a2;
  v45 = a3;
  v44 = (void *)a4;
  v43 = a5;
  v36 = _NSConcreteStackBlock;
  v37 = -1073741824;
  v38 = 0;
  v39 = sub_10006C870;
  v40 = &unk_100281230;
  v41 = self;
  v42 = objc_retainBlock(&v36);
  if (v44
    || (-[objc_class isEqual:](v45, "isEqual:", objc_opt_class(DeviceRestoreChoiceController)) & 1) == 0|| (v35 = 0, v5 = (uint64_t (**)(id, uint64_t))v42, v6 = objc_opt_class(DeviceRestoreChoiceController), (v35 = v5[2](v5, v6) & 1) != 0))
  {
    if (v44
      || (-[objc_class isEqual:](v45, "isEqual:", objc_opt_class(BuddyProximitySetupController)) & 1) == 0)
    {
      goto LABEL_11;
    }
    v26 = 0;
    v8 = (uint64_t (**)(id, uint64_t))v42;
    v9 = objc_opt_class(BuddyProximitySetupController);
    v26 = v8[2](v8, v9) & 1;
    v19 = _NSConcreteStackBlock;
    v20 = -1073741824;
    v21 = 0;
    v22 = sub_10006CAE4;
    v23 = &unk_100280730;
    v24 = v47;
    location = objc_retainBlock(&v19);
    if ((v26 & 1) != 0)
    {
      (*((void (**)(void))location + 2))();
      v27 = 0;
    }
    else
    {
      v10 = v47;
      v12 = _NSConcreteStackBlock;
      v13 = 3221225472;
      v14 = sub_10006CB78;
      v15 = &unk_100281280;
      v17[0] = location;
      v16 = v47;
      v17[1] = v45;
      v17[2] = v44;
      v18 = v43;
      v48 = -[BuddyNavigationFlowController _ensureDeviceProximitySetupControllerWithCompletion:](v10, "_ensureDeviceProximitySetupControllerWithCompletion:", &v12);
      objc_storeStrong((id *)&v16, 0);
      objc_storeStrong(v17, 0);
      v27 = 1;
    }
    objc_storeStrong(&location, 0);
    objc_storeStrong((id *)&v24, 0);
    if (!v27)
    {
LABEL_11:
      v48 = -[BuddyNavigationFlowController _popToBuddyControllerWithClass:withOffset:animated:](v47, "_popToBuddyControllerWithClass:withOffset:animated:", v45, v44, v43, v12, v13, v14, v15);
      v27 = 1;
    }
  }
  else
  {
    v7 = v47;
    v28 = _NSConcreteStackBlock;
    v29 = -1073741824;
    v30 = 0;
    v31 = sub_10006CAA4;
    v32 = &unk_100281258;
    v33[0] = v47;
    v33[1] = v45;
    v33[2] = v44;
    v34 = v43;
    v48 = -[BuddyNavigationFlowController _ensureDeviceRestoreChoiceControllerWithCompletion:](v7, "_ensureDeviceRestoreChoiceControllerWithCompletion:", &v28);
    objc_storeStrong(v33, 0);
    v27 = 1;
  }
  objc_storeStrong(&v42, 0);
  objc_storeStrong((id *)&v41, 0);
  return v48;
}

- (id)_popToBuddyControllerWithClass:(Class)a3 withOffset:(unint64_t)a4 animated:(BOOL)a5
{
  BuddyNavigationFlowNavigator *v5;
  BuddyNavigationFlowNavigator *v6;
  id v7;
  int v9;
  id location;
  id v11;
  unint64_t i;
  id v13;
  BOOL v14;
  unint64_t v15;
  Class v16;
  SEL v17;
  BuddyNavigationFlowController *v18;
  id v19;

  v18 = self;
  v17 = a2;
  v16 = a3;
  v15 = a4;
  v14 = a5;
  v5 = -[BuddyNavigationFlowController navigator](self, "navigator");
  v13 = -[BuddyNavigationFlowNavigator viewControllers](v5, "viewControllers");

  for (i = (unint64_t)objc_msgSend(v13, "count") - 1; (i & 0x8000000000000000) == 0; --i)
  {
    v11 = objc_msgSend(v13, "objectAtIndexedSubscript:", i);
    if ((objc_opt_isKindOfClass(v11, v16) & 1) != 0)
    {
      location = objc_msgSend(v13, "objectAtIndexedSubscript:", i + v15);
      v6 = -[BuddyNavigationFlowController navigator](v18, "navigator");
      v7 = -[BuddyNavigationFlowNavigator popToViewController:animated:](v6, "popToViewController:animated:", location, v14);

      v19 = location;
      v9 = 1;
      objc_storeStrong(&location, 0);
    }
    else
    {
      v9 = 0;
    }
    objc_storeStrong(&v11, 0);
    if (v9)
      goto LABEL_9;
  }
  v19 = 0;
LABEL_9:
  objc_storeStrong(&v13, 0);
  return v19;
}

- (id)_ensureDeviceRestoreChoiceControllerWithCompletion:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  BuddyNavigationFlowController *v6;
  id v7;
  void **v9;
  int v10;
  int v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  BuddyNavigationFlowController *v14;
  void **v15;
  int v16;
  int v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  BuddyNavigationFlowController *v20;
  id v21;
  uint8_t v22[7];
  os_log_type_t v23;
  os_log_t oslog;
  id v25;
  os_log_type_t v26;
  id v27;
  id location[2];
  BuddyNavigationFlowController *v29;
  uint8_t buf[24];

  v29 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (!v29->_weakViewControllersPrecedingDeviceRestoreChoiceController
    || !v29->_weakBuddyControllersPrecedingDeviceRestoreChoiceController)
  {
    v27 = (id)_BYLoggingFacility(v3);
    v26 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_ERROR))
    {
      v25 = +[NSThread callStackSymbols](NSThread, "callStackSymbols");
      sub_100038C28((uint64_t)buf, (uint64_t)v25);
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v27, v26, "Cannot insert DeviceRestoreChoiceController. Call stack: %@", buf, 0xCu);

      objc_storeStrong(&v25, 0);
    }
    objc_storeStrong(&v27, 0);
    abort();
  }
  oslog = (os_log_t)(id)_BYLoggingFacility(v3);
  v23 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v4 = oslog;
    v5 = v23;
    sub_100038C3C(v22);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Will insert DeviceRestoreChoiceController", v22, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v21 = -[BuddyNavigationFlowController _createFlowItemForClass:](v29, "_createFlowItemForClass:", objc_opt_class(DeviceRestoreChoiceController));
  objc_msgSend(v21, "setDelegate:", v29);
  v6 = v29;
  v15 = _NSConcreteStackBlock;
  v16 = -1073741824;
  v17 = 0;
  v18 = sub_10006D014;
  v19 = &unk_1002812A8;
  v20 = v29;
  v9 = _NSConcreteStackBlock;
  v10 = -1073741824;
  v11 = 0;
  v12 = sub_10006D20C;
  v13 = &unk_1002812A8;
  v14 = v29;
  -[BuddyNavigationFlowController _ensureControllerExistsWithTarget:viewControllerInsertionIndexGenerator:buddyControllerInsertionIndexGenerator:withCompletion:](v6, "_ensureControllerExistsWithTarget:viewControllerInsertionIndexGenerator:buddyControllerInsertionIndexGenerator:withCompletion:", v21, &v15, &v9, location[0]);
  v7 = v21;
  objc_storeStrong((id *)&v14, 0);
  objc_storeStrong((id *)&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
  return v7;
}

- (id)_ensureDeviceProximitySetupControllerWithCompletion:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  BuddyNavigationFlowController *v6;
  id v7;
  void **v9;
  int v10;
  int v11;
  id (*v12)(uint64_t);
  void *v13;
  BuddyNavigationFlowController *v14;
  void **v15;
  int v16;
  int v17;
  id (*v18)(uint64_t);
  void *v19;
  BuddyNavigationFlowController *v20;
  id v21;
  uint8_t buf[15];
  os_log_type_t v23;
  id v24;
  id location[2];
  BuddyNavigationFlowController *v26;

  v26 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v24 = (id)_BYLoggingFacility(v3);
  v23 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v24;
    v5 = v23;
    sub_100038C3C(buf);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Will insert ProximitySetupController", buf, 2u);
  }
  objc_storeStrong(&v24, 0);
  v21 = -[BuddyNavigationFlowController _createFlowItemForClass:](v26, "_createFlowItemForClass:", objc_opt_class(BuddyProximitySetupController));
  v6 = v26;
  v15 = _NSConcreteStackBlock;
  v16 = -1073741824;
  v17 = 0;
  v18 = sub_10006D598;
  v19 = &unk_1002812A8;
  v20 = v26;
  v9 = _NSConcreteStackBlock;
  v10 = -1073741824;
  v11 = 0;
  v12 = sub_10006D6AC;
  v13 = &unk_1002812A8;
  v14 = v26;
  -[BuddyNavigationFlowController _ensureControllerExistsWithTarget:viewControllerInsertionIndexGenerator:buddyControllerInsertionIndexGenerator:withCompletion:](v6, "_ensureControllerExistsWithTarget:viewControllerInsertionIndexGenerator:buddyControllerInsertionIndexGenerator:withCompletion:", v21, &v15, &v9, location[0]);
  v7 = v21;
  objc_storeStrong((id *)&v14, 0);
  objc_storeStrong((id *)&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
  return v7;
}

- (void)_ensureControllerExistsWithTarget:(id)a3 viewControllerInsertionIndexGenerator:(id)a4 buddyControllerInsertionIndexGenerator:(id)a5 withCompletion:(id)a6
{
  BuddyNavigationFlowController *v9;
  id v10;
  void **v11;
  int v12;
  int v13;
  void (*v14)(NSObject *, char);
  void *v15;
  BuddyNavigationFlowController *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void **v22;
  int v23;
  int v24;
  id (*v25)(uint64_t);
  void *v26;
  BuddyNavigationFlowController *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id location[2];
  BuddyNavigationFlowController *v33;

  v33 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v31 = 0;
  objc_storeStrong(&v31, a4);
  v30 = 0;
  objc_storeStrong(&v30, a5);
  v29 = 0;
  objc_storeStrong(&v29, a6);
  objc_msgSend(location[0], "setDelegate:", v33);
  v28 = objc_retainBlock(&stru_100281368);
  v9 = v33;
  v10 = location[0];
  v22 = _NSConcreteStackBlock;
  v23 = -1073741824;
  v24 = 0;
  v25 = sub_10006DBC4;
  v26 = &unk_100280730;
  v27 = v33;
  v11 = _NSConcreteStackBlock;
  v12 = -1073741824;
  v13 = 0;
  v14 = sub_10006DBEC;
  v15 = &unk_100281390;
  v16 = v33;
  v17 = location[0];
  v18 = v31;
  v19 = v28;
  v20 = v30;
  v21 = v29;
  -[BuddyNavigationFlowController _performExtendedInitializationForFlowItem:willBegin:withCompletion:](v9, "_performExtendedInitializationForFlowItem:willBegin:withCompletion:", v10, &v22, &v11);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong((id *)&v16, 0);
  objc_storeStrong((id *)&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(location, 0);
}

- (void)flow:(id)a3 finishedWithLastItem:(id)a4 nextItem:(id)a5
{
  uint64_t v7;
  os_log_t oslog;
  id v9;
  id v10;
  id location[2];
  BuddyNavigationFlowController *v12;
  uint8_t buf[24];

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = 0;
  objc_storeStrong(&v10, a4);
  v9 = 0;
  objc_storeStrong(&v9, a5);
  oslog = (os_log_t)(id)_BYLoggingFacility(v7);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100039500((uint64_t)buf, (uint64_t)location[0]);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Flow finished: %{public}@", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  -[BuddyNavigationFlowController _flowItemDone:flow:nextItemClass:nextItem:](v12, "_flowItemDone:flow:nextItemClass:nextItem:", v10, location[0], 0, v9);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (void)presentWiFiPaneForFlow:(id)a3
{
  BuddyFlowDelegate *v3;
  id location[2];
  BuddyNavigationFlowController *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyNavigationFlowController flowDelegate](v5, "flowDelegate");
  -[BuddyFlowDelegate presentWiFiSettingsModally](v3, "presentWiFiSettingsModally");

  objc_storeStrong(location, 0);
}

- (void)flowItemCancelled:(id)a3
{
  uint64_t v3;
  BuddyNavigationFlowNavigator *v4;
  id v5;
  BuddyNavigationFlowNavigator *v6;
  void **v7;
  int v8;
  int v9;
  void (*v10)(id *);
  void *v11;
  BuddyNavigationFlowController *v12;
  os_log_type_t v13;
  os_log_t oslog;
  id location[2];
  BuddyNavigationFlowController *v16;
  uint8_t buf[24];

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  oslog = (os_log_t)(id)_BYLoggingFacility(v3);
  v13 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100039500((uint64_t)buf, (uint64_t)location[0]);
    _os_log_impl((void *)&_mh_execute_header, oslog, v13, "Cancelling flow item %{public}@", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  -[BuddyNavigationFlowController markFlowItemDone:](v16, "markFlowItemDone:", location[0]);
  v4 = -[BuddyNavigationFlowController navigator](v16, "navigator");
  v5 = -[BuddyNavigationFlowNavigator presentedViewController](v4, "presentedViewController");

  if (v5)
  {
    v6 = -[BuddyNavigationFlowController navigator](v16, "navigator");
    v7 = _NSConcreteStackBlock;
    v8 = -1073741824;
    v9 = 0;
    v10 = sub_10006E1BC;
    v11 = &unk_100280730;
    v12 = v16;
    -[BuddyNavigationFlowNavigator dismissViewControllerAnimated:completion:](v6, "dismissViewControllerAnimated:completion:", 1, &v7);

    objc_storeStrong((id *)&v12, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)flowItemDone:(id)a3
{
  id location[2];
  BuddyNavigationFlowController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[BuddyNavigationFlowController _flowItemDone:flow:nextItemClass:nextItem:](v4, "_flowItemDone:flow:nextItemClass:nextItem:", location[0], 0, 0, 0);
  objc_storeStrong(location, 0);
}

- (void)flowItemDone:(id)a3 nextItem:(id)a4
{
  id v5;
  id location[2];
  BuddyNavigationFlowController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = 0;
  objc_storeStrong(&v5, a4);
  -[BuddyNavigationFlowController _flowItemDone:flow:nextItemClass:nextItem:](v7, "_flowItemDone:flow:nextItemClass:nextItem:", location[0], 0, 0, v5);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)flowItemDone:(id)a3 nextItemClass:(Class)a4
{
  id location[2];
  BuddyNavigationFlowController *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[BuddyNavigationFlowController _flowItemDone:flow:nextItemClass:nextItem:](v6, "_flowItemDone:flow:nextItemClass:nextItem:", location[0], 0, a4, 0, a4);
  objc_storeStrong(location, 0);
}

- (void)presentWiFiPaneForFlowItem:(id)a3
{
  BuddyNavigationFlowController *v3;
  id v4;
  id v5;
  BuddyNavigationFlowController *v6;
  id v7;
  id v8;
  id location[2];
  BuddyNavigationFlowController *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v10;
  v4 = sub_10006B464();
  v5 = -[BuddyNavigationFlowController popToBuddyControllerWithClass:animated:](v3, "popToBuddyControllerWithClass:animated:", objc_opt_class(v4), 1);

  if (!v5)
  {
    -[BuddyNavigationFlowController _insertWiFiControllerAsFirstPane](v10, "_insertWiFiControllerAsFirstPane");
    v6 = v10;
    v7 = sub_10006B464();
    v8 = -[BuddyNavigationFlowController popToBuddyControllerWithClass:animated:](v6, "popToBuddyControllerWithClass:animated:", objc_opt_class(v7), 1);
  }
  objc_storeStrong(location, 0);
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 operation:(int64_t)a5 animated:(BOOL)a6
{
  uint64_t v9;
  uint64_t v10;
  BuddyNavigationFlowNavigator *v11;
  id v12;
  id v13;
  BuddyNavigationFlowNavigator *v14;
  id v15;
  id v16;
  id v17;
  os_log_type_t v18;
  os_log_t v19;
  id v20;
  os_log_type_t v21;
  os_log_t v22;
  os_log_type_t v23;
  os_log_t v24;
  id v25;
  os_log_type_t v26;
  os_log_t oslog;
  BOOL v28;
  int64_t v29;
  id v30;
  id location[2];
  BuddyNavigationFlowController *v32;
  uint8_t v33[32];
  uint8_t v34[16];
  uint8_t v35[32];
  uint8_t buf[24];

  v32 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v30 = 0;
  objc_storeStrong(&v30, a4);
  v29 = a5;
  v28 = a6;
  if (a5 == 1)
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v9);
    v26 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v25 = (id)objc_opt_class(v30);
      sub_100039500((uint64_t)buf, (uint64_t)v25);
      _os_log_impl((void *)&_mh_execute_header, oslog, v26, "Pushing to %{public}@", buf, 0xCu);
      objc_storeStrong(&v25, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
    v24 = (os_log_t)(id)_BYLoggingFacility(v10);
    v23 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      v11 = -[BuddyNavigationFlowController navigator](v32, "navigator");
      v12 = -[BuddyNavigationFlowNavigator view](v11, "view");
      v13 = objc_msgSend(v12, "window");
      sub_100066BA8((uint64_t)v35, (uint64_t)"-[BuddyNavigationFlowController navigationController:willShowViewController:operation:animated:]", (uint64_t)v13);
      _os_log_debug_impl((void *)&_mh_execute_header, v24, v23, "%s setUserInteractionEnabled NO %p", v35, 0x16u);

    }
    objc_storeStrong((id *)&v24, 0);
    v14 = -[BuddyNavigationFlowController navigator](v32, "navigator");
    v15 = -[BuddyNavigationFlowNavigator view](v14, "view");
    v16 = objc_msgSend(v15, "window");
    objc_msgSend(v16, "setUserInteractionEnabled:", 0);

  }
  else if (v29 == 2)
  {
    v22 = (os_log_t)(id)_BYLoggingFacility(v9);
    v21 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v20 = (id)objc_opt_class(v30);
      sub_100039500((uint64_t)v34, (uint64_t)v20);
      _os_log_impl((void *)&_mh_execute_header, v22, v21, "Popping to %{public}@", v34, 0xCu);
      objc_storeStrong(&v20, 0);
    }
    objc_storeStrong((id *)&v22, 0);
  }
  else
  {
    v19 = (os_log_t)(id)_BYLoggingFacility(v9);
    v18 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (id)objc_opt_class(v30);
      sub_100067590((uint64_t)v33, (uint64_t)v17, v29);
      _os_log_impl((void *)&_mh_execute_header, v19, v18, "Moving to %{public}@ via operation %i", v33, 0x12u);
      objc_storeStrong(&v17, 0);
    }
    objc_storeStrong((id *)&v19, 0);
  }
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 operation:(int64_t)a5 animated:(BOOL)a6
{
  BuddyWiFiController *v9;
  BOOL v10;
  BuddyFlowDelegate *v11;
  id v12;
  uint64_t v13;
  uint64_t isKindOfClass;
  unint64_t v15;
  unint64_t v16;
  id v17;
  NSObject *v18;
  os_log_type_t v19;
  id v20;
  id v21;
  NSMutableArray *v22;
  char *v23;
  NSMutableArray *v24;
  BuddyNavigationFlowNavigator *v25;
  id v26;
  char v27;
  NSMutableArray *v28;
  NSMutableArray *v29;
  char *v30;
  NSMutableArray *v31;
  NSMutableArray *v32;
  BuddyNavigationFlowNavigator *v33;
  id v34;
  NSArray *v35;
  unsigned __int8 v36;
  NSArray *v37;
  BuddyNavigationFlowNavigator *v38;
  id v39;
  unsigned __int8 v40;
  BuddyNavigationFlowNavigator *v41;
  id v42;
  uint64_t v43;
  BuddyNavigationFlowNavigator *v44;
  id v45;
  id v46;
  BuddyNavigationFlowController *v47;
  NSMutableArray *v48;
  id v49;
  id v50;
  id v51;
  NSArray *v52;
  id v53;
  id v54;
  uint64_t v55;
  unint64_t n;
  char v57;
  unsigned __int8 v58;
  unsigned __int8 v59;
  id v60;
  BOOL v61;
  NSMutableArray *v62;
  char *v63;
  NSMutableArray *v64;
  id v65;
  uint64_t v66;
  char v67;
  unsigned __int8 v68;
  uint64_t v69;
  id v70;
  id v71;
  uint64_t v72;
  unint64_t jj;
  NSObject *v74;
  NSMutableArray *v75;
  id v76;
  NSMutableArray *v77;
  BuddyNavigationFlowNavigator *v78;
  id v79;
  BuddyNavigationFlowController *v80;
  NSMutableArray *v81;
  id v82;
  id v83;
  NSMutableArray *v84;
  BuddyLifecycleDelegate *v85;
  id v86;
  id v87;
  uint64_t v88;
  BuddyWiFiController *v89;
  BuddyWiFiController *wifiController;
  NSMutableArray *v91;
  id v92;
  id v93;
  id v94;
  uint64_t v95;
  unint64_t kk;
  uint64_t v97;
  uint64_t v98;
  NSMutableArray *v99;
  unsigned int v100;
  NSMutableArray *v101;
  NSMutableArray *v102;
  NSMutableArray *buddyControllers;
  NSMutableArray *v104;
  BuddyNavigationFlowNavigator *v105;
  id v106;
  BuddyNavigationFlowNavigator *v107;
  id v108;
  NSMutableArray *v109;
  id v110;
  uint64_t v111;
  unint64_t nn;
  void *v113;
  BuddyNavigationFlowNavigator *v114;
  BFFNavigationController *v115;
  BuddyNavigationFlowNavigator *v116;
  uint64_t v117;
  NSMutableArray *v118;
  id v119;
  id v120;
  NSMutableArray *v121;
  NSMutableArray *v122;
  BuddyNavigationFlowController *v123;
  NSMutableArray *v124;
  id v125;
  id v126;
  id v127;
  uint64_t v128;
  NSMutableArray *v129;
  BuddyNavigationFlowNavigator *v130;
  id v131;
  id v132;
  BuddyNavigationFlowNavigator *v133;
  id v134;
  id v135;
  os_log_t v136;
  id v137;
  os_log_type_t v138;
  os_log_t oslog;
  id v140;
  _QWORD v141[8];
  void *v142;
  id v143;
  id v144;
  id v145;
  signed int mm;
  _QWORD v147[8];
  uint64_t v148;
  id v149;
  id v150;
  BOOL v151;
  id v152;
  os_log_type_t v153;
  id v154;
  _QWORD v155[8];
  uint64_t v156;
  char v157;
  char v158;
  id v159;
  id v160;
  char *ii;
  id v162;
  char v163;
  id v164;
  char v165;
  _QWORD __b[8];
  id v167;
  id v168;
  BOOL v169;
  char v170;
  char v171;
  UIViewController *v172;
  char v173;
  id v174;
  char v175;
  BuddyNavigationFlowNavigator *v176;
  id v177;
  id v178;
  id v179;
  char *m;
  id v181;
  id v182;
  char *k;
  id v184;
  os_log_type_t v185;
  id v186;
  id v187;
  unint64_t j;
  int v189;
  id v190;
  id v191;
  unint64_t i;
  uint64_t v193;
  id v194;
  os_log_type_t v195;
  id v196;
  id v197;
  id v198;
  os_log_type_t v199;
  id v200;
  char v201;
  id v202;
  char v203;
  BuddyNavigationFlowNavigator *v204;
  char v205;
  id v206;
  char v207;
  BuddyWiFiController *v208;
  char v209;
  id v210;
  char v211;
  BuddyNavigationFlowNavigator *v212;
  char v213;
  BuddyWiFiController *v214;
  BOOL v215;
  BOOL v216;
  int64_t v217;
  id v218;
  id location[2];
  BuddyNavigationFlowController *v220;
  uint8_t v221[32];
  uint8_t v222[32];
  _BYTE v223[128];
  uint8_t v224[128];
  uint8_t v225[16];
  _BYTE v226[128];
  uint8_t v227[128];
  uint8_t v228[32];
  uint8_t v229[32];
  uint8_t buf[40];

  v220 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v218 = 0;
  objc_storeStrong(&v218, a4);
  v217 = a5;
  v216 = a6;
  v215 = 0;
  v9 = -[BuddyNavigationFlowController wifiController](v220, "wifiController");
  v213 = 0;
  v211 = 0;
  v209 = 0;
  v207 = 0;
  v205 = 0;
  v203 = 0;
  v201 = 0;
  v10 = 0;
  if (v9)
  {
    v214 = -[BuddyNavigationFlowController wifiController](v220, "wifiController");
    v213 = 1;
    v10 = 0;
    if ((objc_opt_respondsToSelector(v214, "viewController") & 1) != 0)
    {
      v212 = -[BuddyNavigationFlowController navigator](v220, "navigator");
      v211 = 1;
      v210 = -[BuddyNavigationFlowNavigator topViewController](v212, "topViewController");
      v209 = 1;
      v208 = -[BuddyNavigationFlowController wifiController](v220, "wifiController");
      v207 = 1;
      v206 = -[BuddyWiFiController viewController](v208, "viewController");
      v205 = 1;
      v10 = 0;
      if (v210 == v206)
      {
        v204 = -[BuddyNavigationFlowController navigator](v220, "navigator");
        v203 = 1;
        v202 = -[BuddyNavigationFlowNavigator presentedViewController](v204, "presentedViewController");
        v201 = 1;
        v10 = v202 == 0;
      }
    }
  }
  if ((v201 & 1) != 0)

  if ((v203 & 1) != 0)
  if ((v205 & 1) != 0)

  if ((v207 & 1) != 0)
  if ((v209 & 1) != 0)

  if ((v211 & 1) != 0)
  if ((v213 & 1) != 0)

  v215 = v10;
  if (-[BuddyNavigationFlowController _hasWiFiControllerInNavigationStack](v220, "_hasWiFiControllerInNavigationStack")
    && !-[BuddyNavigationFlowController didInsertWiFiPaneForCloudConfigurationFlow](v220, "didInsertWiFiPaneForCloudConfigurationFlow")&& !v215)
  {
    v11 = -[BuddyNavigationFlowController flowDelegate](v220, "flowDelegate");
    -[BuddyFlowDelegate disableTapFreeSetUp](v11, "disableTapFreeSetUp");

  }
  v12 = v218;
  v13 = objc_opt_class(RUIPage);
  isKindOfClass = objc_opt_isKindOfClass(v12, v13);
  if ((isKindOfClass & 1) != 0)
  {
    v200 = (id)_BYLoggingFacility(isKindOfClass);
    v199 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v200, OS_LOG_TYPE_DEFAULT))
    {
      v198 = objc_msgSend(v218, "pageID");
      v197 = objc_msgSend(v218, "navTitle");
      sub_100070398((uint64_t)buf, (uint64_t)v198, (uint64_t)v197, (uint64_t)v218, v217);
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v200, v199, "Setup showing RUIPage %{public}@ %@ (%p) via operation %i", buf, 0x26u);

      objc_storeStrong(&v197, 0);
      objc_storeStrong(&v198, 0);
    }
    objc_storeStrong(&v200, 0);
  }
  else
  {
    v196 = (id)_BYLoggingFacility(isKindOfClass);
    v195 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v196, OS_LOG_TYPE_DEFAULT))
    {
      v194 = objc_msgSend((id)objc_opt_class(v218), "description");
      sub_1000703D0((uint64_t)v229, (uint64_t)v194, (uint64_t)v218, v217);
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v196, v195, "Setup showing controller %{public}@ (%p) via operation %i", v229, 0x1Cu);

      objc_storeStrong(&v194, 0);
    }
    objc_storeStrong(&v196, 0);
  }
  -[BuddyNavigationFlowController _updateNavigationBackButtonTitleForViewController:](v220, "_updateNavigationBackButtonTitleForViewController:", v218);
  v193 = 0x7FFFFFFFFFFFFFFFLL;
  for (i = 0; ; ++i)
  {
    v15 = i;
    if (v15 >= (unint64_t)-[NSMutableArray count](v220->_buddyControllers, "count"))
      break;
    v191 = -[NSMutableArray objectAtIndexedSubscript:](v220->_buddyControllers, "objectAtIndexedSubscript:", i);
    v190 = -[BuddyNavigationFlowController _viewControllerForBuddyController:](v220, "_viewControllerForBuddyController:", v191);
    if (v218 == v190)
    {
      v193 = i;
      v189 = 2;
    }
    else
    {
      v189 = 0;
    }
    objc_storeStrong(&v190, 0);
    objc_storeStrong(&v191, 0);
    if (v189)
      break;
  }
  if (v193 == 0x7FFFFFFFFFFFFFFFLL)
  {
    for (j = 0; ; ++j)
    {
      v16 = j;
      if (v16 >= (unint64_t)-[NSMutableArray count](v220->_buddyControllers, "count"))
        break;
      v187 = -[NSMutableArray objectAtIndexedSubscript:](v220->_buddyControllers, "objectAtIndexedSubscript:", j);
      if ((objc_opt_respondsToSelector(v187, "responsibleForViewController:") & 1) != 0
        && (v17 = objc_msgSend(v187, "responsibleForViewController:", v218), (v17 & 1) != 0))
      {
        v193 = j;
        v186 = (id)_BYLoggingFacility(v17);
        v185 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled((os_log_t)v186, OS_LOG_TYPE_DEFAULT))
        {
          v18 = v186;
          v19 = v185;
          v20 = v187;
          v21 = objc_msgSend((id)objc_opt_class(v218), "description");
          v184 = v21;
          sub_1000703FC((uint64_t)v228, (uint64_t)v20, (uint64_t)v21, (uint64_t)v218);
          _os_log_impl((void *)&_mh_execute_header, v18, v19, "%@ claimed responsibility for %{public}@ (%p)", v228, 0x20u);

          objc_storeStrong(&v184, 0);
        }
        objc_storeStrong(&v186, 0);
        v189 = 5;
      }
      else
      {
        v189 = 0;
      }
      objc_storeStrong(&v187, 0);
      if (v189)
      {
        if (v189 == 5)
          break;
LABEL_179:
        __break(1u);
        return;
      }
    }
  }
  if (v217 == 2)
  {
    if (v193 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v22 = -[BuddyNavigationFlowController buddyControllers](v220, "buddyControllers");
      v23 = (char *)-[NSMutableArray count](v22, "count") - 1;

      for (k = v23; ((unint64_t)k & 0x8000000000000000) == 0; --k)
      {
        v24 = -[BuddyNavigationFlowController buddyControllers](v220, "buddyControllers");
        v182 = -[NSMutableArray objectAtIndexedSubscript:](v24, "objectAtIndexedSubscript:", k);

        v181 = -[BuddyNavigationFlowController _viewControllerForBuddyController:](v220, "_viewControllerForBuddyController:", v182);
        v25 = -[BuddyNavigationFlowController navigator](v220, "navigator");
        v26 = -[BuddyNavigationFlowNavigator viewControllers](v25, "viewControllers");
        v27 = objc_msgSend(v26, "containsObject:", v181) ^ 1;

        if ((v27 & 1) != 0)
        {
          if ((objc_opt_respondsToSelector(v182, "controllerWasPopped") & 1) != 0)
            objc_msgSend(v182, "controllerWasPopped");
          v28 = -[BuddyNavigationFlowController buddyControllers](v220, "buddyControllers");
          -[NSMutableArray removeObjectAtIndex:](v28, "removeObjectAtIndex:", k);

          v189 = 0;
        }
        else
        {
          v189 = 8;
        }
        objc_storeStrong(&v181, 0);
        objc_storeStrong(&v182, 0);
        if (v189)
        {
          if (v189 == 8)
            break;
          goto LABEL_179;
        }
      }
    }
    else
    {
      v29 = -[BuddyNavigationFlowController buddyControllers](v220, "buddyControllers");
      v30 = (char *)-[NSMutableArray count](v29, "count") - 1;

      for (m = v30; (uint64_t)m > v193; --m)
      {
        v31 = -[BuddyNavigationFlowController buddyControllers](v220, "buddyControllers");
        v179 = -[NSMutableArray lastObject](v31, "lastObject");

        if ((objc_opt_respondsToSelector(v179, "controllerWasPopped") & 1) != 0)
          objc_msgSend(v179, "controllerWasPopped");
        v32 = -[BuddyNavigationFlowController buddyControllers](v220, "buddyControllers");
        -[NSMutableArray removeLastObject](v32, "removeLastObject");

        objc_storeStrong(&v179, 0);
      }
    }
  }
  if (v217 == 1)
  {
    v33 = -[BuddyNavigationFlowController navigator](v220, "navigator");
    v34 = -[BuddyNavigationFlowNavigator viewControllers](v33, "viewControllers");
    v178 = objc_msgSend(v34, "mutableCopy");

    v177 = objc_opt_new(NSMutableArray);
    v35 = -[BuddyNavigationFlowController viewControllersToRemoveOnPush](v220, "viewControllersToRemoveOnPush");
    v175 = 0;
    v173 = 0;
    v171 = 0;
    v36 = 0;
    if (-[NSArray count](v35, "count"))
    {
      v176 = -[BuddyNavigationFlowController navigator](v220, "navigator");
      v175 = 1;
      v174 = -[BuddyNavigationFlowNavigator viewControllers](v176, "viewControllers");
      v173 = 1;
      v172 = -[BuddyNavigationFlowController topViewControllerForRemoving](v220, "topViewControllerForRemoving");
      v171 = 1;
      v36 = objc_msgSend(v174, "containsObject:");
    }
    if ((v171 & 1) != 0)

    if ((v173 & 1) != 0)
    if ((v175 & 1) != 0)

    if ((v36 & 1) != 0)
    {
      v37 = -[BuddyNavigationFlowController viewControllersToRemoveOnPush](v220, "viewControllersToRemoveOnPush");
      v38 = -[BuddyNavigationFlowController navigator](v220, "navigator");
      v39 = -[BuddyNavigationFlowNavigator topViewController](v38, "topViewController");
      v40 = -[NSArray containsObject:](v37, "containsObject:", v39);

      v170 = v40 & 1;
      v169 = 0;
      v41 = -[BuddyNavigationFlowController navigator](v220, "navigator");
      v42 = -[BuddyNavigationFlowNavigator presentedViewController](v41, "presentedViewController");
      v43 = objc_opt_class(BFFNavigationController);
      LOBYTE(v39) = objc_opt_isKindOfClass(v42, v43);

      if ((v39 & 1) != 0)
      {
        v44 = -[BuddyNavigationFlowController navigator](v220, "navigator");
        v168 = -[BuddyNavigationFlowNavigator presentedViewController](v44, "presentedViewController");

        v45 = objc_msgSend(v168, "viewControllers");
        v46 = objc_msgSend(v45, "firstObject");
        v47 = v220;
        v48 = -[BuddyNavigationFlowController buddyControllers](v220, "buddyControllers");
        v49 = -[NSMutableArray lastObject](v48, "lastObject");
        v50 = -[BuddyNavigationFlowController _viewControllerForBuddyController:](v47, "_viewControllerForBuddyController:", v49);
        v169 = v46 == v50;

        objc_storeStrong(&v168, 0);
      }
      if ((v170 & 1) == 0 || v169)
      {
        v51 = v177;
        v52 = -[BuddyNavigationFlowController viewControllersToRemoveOnPush](v220, "viewControllersToRemoveOnPush");
        objc_msgSend(v51, "addObjectsFromArray:", v52);

        -[BuddyNavigationFlowController setViewControllersToRemoveOnPush:](v220, "setViewControllersToRemoveOnPush:", 0);
      }
    }
    else
    {
      -[BuddyNavigationFlowController setViewControllersToRemoveOnPush:](v220, "setViewControllersToRemoveOnPush:", 0);
      -[BuddyNavigationFlowController setTopViewControllerForRemoving:](v220, "setTopViewControllerForRemoving:", 0);
    }
    memset(__b, 0, sizeof(__b));
    v53 = v178;
    v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", __b, v227, 16);
    if (v54)
    {
      v55 = *(_QWORD *)__b[2];
      do
      {
        for (n = 0; n < (unint64_t)v54; ++n)
        {
          if (*(_QWORD *)__b[2] != v55)
            objc_enumerationMutation(v53);
          v167 = *(id *)(__b[1] + 8 * n);
          v165 = 0;
          v57 = objc_opt_respondsToSelector(v167, "isEphemeral");
          v58 = 0;
          if ((v57 & 1) != 0)
            v58 = objc_msgSend(v167, "isEphemeral");
          v165 = v58 & 1;
          v163 = 0;
          v59 = 0;
          if ((v58 & 1) != 0)
          {
            v59 = 0;
            if (v167 != v218)
            {
              v60 = v167;
              v164 = objc_msgSend(v178, "lastObject");
              v163 = 1;
              v61 = v60 == v164;
              v59 = 0;
              if (!v61)
                v59 = objc_msgSend(v178, "containsObject:", v167);
            }
          }
          if ((v163 & 1) != 0)

          if ((v59 & 1) != 0)
            objc_msgSend(v177, "addObject:", v167);
        }
        v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", __b, v227, 16);
      }
      while (v54);
    }

    if (objc_msgSend(v177, "count"))
    {
      v162 = objc_msgSend(v178, "mutableCopy");
      objc_msgSend(v162, "removeObjectsInArray:", v177);
      v62 = -[BuddyNavigationFlowController buddyControllers](v220, "buddyControllers");
      v63 = (char *)-[NSMutableArray count](v62, "count") - 1;

      for (ii = v63; ((unint64_t)ii & 0x8000000000000000) == 0; --ii)
      {
        v64 = -[BuddyNavigationFlowController buddyControllers](v220, "buddyControllers");
        v160 = -[NSMutableArray objectAtIndexedSubscript:](v64, "objectAtIndexedSubscript:", ii);

        v159 = -[BuddyNavigationFlowController _viewControllerForBuddyController:](v220, "_viewControllerForBuddyController:", v160);
        v158 = 0;
        v65 = v160;
        v66 = objc_opt_class(BFFFlow);
        v67 = objc_opt_isKindOfClass(v65, v66);
        v68 = 1;
        if ((v67 & 1) == 0)
          v68 = objc_msgSend(v177, "containsObject:", v159);
        v158 = v68 & 1;
        -[BuddyNavigationFlowController _unmarkFlowItemAsFinished:](v220, "_unmarkFlowItemAsFinished:", v160);
        if ((v158 & 1) != 0)
        {
          v157 = 1;
          v69 = objc_opt_respondsToSelector(v160, "responsibleForViewController:");
          if ((v69 & 1) != 0)
          {
            memset(v155, 0, sizeof(v155));
            v70 = v162;
            v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", v155, v226, 16);
            if (v71)
            {
              v72 = *(_QWORD *)v155[2];
              do
              {
                for (jj = 0; jj < (unint64_t)v71; ++jj)
                {
                  if (*(_QWORD *)v155[2] != v72)
                    objc_enumerationMutation(v70);
                  v156 = *(_QWORD *)(v155[1] + 8 * jj);
                  if ((objc_msgSend(v160, "responsibleForViewController:", v156) & 1) != 0)
                  {
                    v157 = 0;
                    v189 = 19;
                    goto LABEL_120;
                  }
                }
                v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", v155, v226, 16);
              }
              while (v71);
            }
            v189 = 0;
LABEL_120:

            if (v189)
            {
              if (v189 != 19)
                goto LABEL_179;
            }
          }
          if ((v157 & 1) != 0)
          {
            v154 = (id)_BYLoggingFacility(v69);
            v153 = OS_LOG_TYPE_DEFAULT;
            if (os_log_type_enabled((os_log_t)v154, OS_LOG_TYPE_DEFAULT))
            {
              v74 = v154;
              v75 = -[BuddyNavigationFlowController buddyControllers](v220, "buddyControllers");
              v76 = -[NSMutableArray objectAtIndexedSubscript:](v75, "objectAtIndexedSubscript:", ii);
              sub_100038C28((uint64_t)v225, (uint64_t)v76);
              _os_log_impl((void *)&_mh_execute_header, v74, v153, "Removing %@ from the controllers list; it is not responsible for any existing view controllers",
                v225,
                0xCu);

            }
            objc_storeStrong(&v154, 0);
            v77 = -[BuddyNavigationFlowController buddyControllers](v220, "buddyControllers");
            -[NSMutableArray removeObjectAtIndex:](v77, "removeObjectAtIndex:", ii);

          }
        }
        objc_storeStrong(&v159, 0);
        objc_storeStrong(&v160, 0);
      }
      v78 = -[BuddyNavigationFlowController navigator](v220, "navigator");
      -[BuddyNavigationFlowNavigator setViewControllers:animated:](v78, "setViewControllers:animated:", v162, 0);

      objc_storeStrong(&v162, 0);
    }
    v79 = v218;
    v80 = v220;
    v81 = -[BuddyNavigationFlowController buddyControllers](v220, "buddyControllers");
    v82 = -[NSMutableArray lastObject](v81, "lastObject");
    v83 = -[BuddyNavigationFlowController _viewControllerForBuddyController:](v80, "_viewControllerForBuddyController:", v82);

    if (v79 == v83)
    {
      v84 = -[BuddyNavigationFlowController buddyControllers](v220, "buddyControllers");
      v152 = -[NSMutableArray lastObject](v84, "lastObject");

      if ((objc_opt_respondsToSelector(v152, "allowedTerminationSources") & 1) != 0
        && objc_msgSend(v152, "allowedTerminationSources"))
      {
        v151 = ((unint64_t)objc_msgSend(v152, "allowedTerminationSources") & 1) == 1;
        v85 = -[BuddyNavigationFlowController lifecycleDelegate](v220, "lifecycleDelegate");
        -[BuddyLifecycleDelegate willEndLifecycleDueToCause:allowDismissal:](v85, "willEndLifecycleDueToCause:allowDismissal:", 1, v151);

      }
      objc_storeStrong(&v152, 0);
    }
    objc_storeStrong(&v177, 0);
    objc_storeStrong(&v178, 0);
  }
  v86 = v218;
  v87 = sub_10006B464();
  v88 = objc_opt_class(v87);
  if ((objc_opt_isKindOfClass(v86, v88) & 1) != 0 && !v220->_wifiController)
  {
    v150 = 0;
    v150 = -[NSMutableArray indexOfObjectPassingTest:](v220->_buddyControllers, "indexOfObjectPassingTest:", &stru_1002813D0);
    if (v150 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v89 = (BuddyWiFiController *)-[NSMutableArray objectAtIndexedSubscript:](v220->_buddyControllers, "objectAtIndexedSubscript:", v150);
      wifiController = v220->_wifiController;
      v220->_wifiController = v89;

    }
  }
  v91 = -[BuddyNavigationFlowController trailingControllers](v220, "trailingControllers");
  v92 = -[NSMutableArray count](v91, "count");

  if (v92)
  {
    v149 = objc_alloc_init((Class)NSMutableArray);
    memset(v147, 0, sizeof(v147));
    v93 = -[NSMutableArray reverseObjectEnumerator](v220->_buddyControllers, "reverseObjectEnumerator");
    v94 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", v147, v224, 16);
    if (v94)
    {
      v95 = *(_QWORD *)v147[2];
      while (2)
      {
        for (kk = 0; kk < (unint64_t)v94; ++kk)
        {
          if (*(_QWORD *)v147[2] != v95)
            objc_enumerationMutation(v93);
          v148 = *(_QWORD *)(v147[1] + 8 * kk);
          if (objc_msgSend(v149, "count") == (id)1)
          {
            v97 = v148;
            v98 = objc_opt_class(BFFFlow);
            if ((objc_opt_isKindOfClass(v97, v98) & 1) != 0)
              objc_msgSend(v149, "insertObject:atIndex:", v148, 0);
            v189 = 21;
            goto LABEL_151;
          }
          objc_msgSend(v149, "addObject:", v148);
        }
        v94 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", v147, v224, 16);
        if (v94)
          continue;
        break;
      }
    }
    v189 = 0;
LABEL_151:

    v99 = -[BuddyNavigationFlowController trailingControllers](v220, "trailingControllers");
    v100 = -[NSMutableArray count](v99, "count") - 1;

    for (mm = v100; (mm & 0x80000000) == 0; --mm)
    {
      v101 = -[BuddyNavigationFlowController trailingControllers](v220, "trailingControllers");
      v145 = -[NSMutableArray objectAtIndexedSubscript:](v101, "objectAtIndexedSubscript:", mm);

      if (v145
        && (-[NSMutableArray containsObject:](v220->_buddyControllers, "containsObject:", v145) & 1) != 0)
      {
        v102 = -[BuddyNavigationFlowController trailingControllers](v220, "trailingControllers");
        -[NSMutableArray removeObjectAtIndex:](v102, "removeObjectAtIndex:", mm);

      }
      objc_storeStrong(&v145, 0);
    }
    -[NSMutableArray removeObjectsInArray:](v220->_buddyControllers, "removeObjectsInArray:", v149);
    buddyControllers = v220->_buddyControllers;
    v104 = -[BuddyNavigationFlowController trailingControllers](v220, "trailingControllers");
    -[NSMutableArray addObjectsFromArray:](buddyControllers, "addObjectsFromArray:", v104);

    -[NSMutableArray addObjectsFromArray:](v220->_buddyControllers, "addObjectsFromArray:", v149);
    v105 = -[BuddyNavigationFlowController navigator](v220, "navigator");
    v106 = -[BuddyNavigationFlowNavigator viewControllers](v105, "viewControllers");
    v144 = objc_msgSend(v106, "mutableCopy");

    v107 = -[BuddyNavigationFlowController navigator](v220, "navigator");
    v108 = -[BuddyNavigationFlowNavigator viewControllers](v107, "viewControllers");
    v143 = objc_msgSend(v108, "lastObject");

    objc_msgSend(v144, "removeLastObject");
    memset(v141, 0, sizeof(v141));
    v109 = -[BuddyNavigationFlowController trailingControllers](v220, "trailingControllers");
    v110 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v109, "countByEnumeratingWithState:objects:count:", v141, v223, 16);
    if (v110)
    {
      v111 = *(_QWORD *)v141[2];
      do
      {
        for (nn = 0; nn < (unint64_t)v110; ++nn)
        {
          if (*(_QWORD *)v141[2] != v111)
            objc_enumerationMutation(v109);
          v142 = *(void **)(v141[1] + 8 * nn);
          v140 = -[BuddyNavigationFlowController _viewControllerForBuddyController:](v220, "_viewControllerForBuddyController:", v142);
          if (v140 && (objc_opt_respondsToSelector(v142, "setNavigationController:") & 1) != 0)
          {
            v113 = v142;
            v114 = -[BuddyNavigationFlowController navigator](v220, "navigator");
            v115 = -[BuddyNavigationFlowNavigator navigationController](v114, "navigationController");
            objc_msgSend(v113, "setNavigationController:", v115);

            objc_msgSend(v144, "addObject:", v140);
          }
          objc_storeStrong(&v140, 0);
        }
        v110 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v109, "countByEnumeratingWithState:objects:count:", v141, v223, 16);
      }
      while (v110);
    }

    objc_msgSend(v144, "addObject:", v143);
    v116 = -[BuddyNavigationFlowController navigator](v220, "navigator");
    -[BuddyNavigationFlowNavigator setViewControllers:animated:](v116, "setViewControllers:animated:", v144, 0);

    oslog = (os_log_t)(id)_BYLoggingFacility(v117);
    v138 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v118 = -[BuddyNavigationFlowController trailingControllers](v220, "trailingControllers");
      v119 = -[NSMutableArray count](v118, "count");
      v120 = v143;
      v121 = -[BuddyNavigationFlowController trailingControllers](v220, "trailingControllers");
      sub_100052E50((uint64_t)v222, (uint64_t)v119, (uint64_t)v120, (uint64_t)v121);
      _os_log_impl((void *)&_mh_execute_header, oslog, v138, "Inserting %ld controller(s) before %@: %@", v222, 0x20u);

    }
    objc_storeStrong((id *)&oslog, 0);
    v122 = -[BuddyNavigationFlowController trailingControllers](v220, "trailingControllers");
    -[NSMutableArray removeAllObjects](v122, "removeAllObjects");

    objc_storeStrong(&v143, 0);
    objc_storeStrong(&v144, 0);
    objc_storeStrong(&v149, 0);
  }
  v123 = v220;
  v124 = -[BuddyNavigationFlowController buddyControllers](v220, "buddyControllers");
  v125 = -[NSMutableArray lastObject](v124, "lastObject");
  v126 = -[BuddyNavigationFlowController _viewControllerForBuddyController:](v123, "_viewControllerForBuddyController:", v125);
  v127 = v218;

  if (v126 == v127)
  {
    v129 = -[BuddyNavigationFlowController buddyControllers](v220, "buddyControllers");
    v137 = -[NSMutableArray lastObject](v129, "lastObject");

    -[BuddyNavigationFlowController _unmarkFlowItemAsFinished:](v220, "_unmarkFlowItemAsFinished:", v137);
    if ((objc_opt_respondsToSelector(v137, "flowItemDidAppear:") & 1) != 0)
      objc_msgSend(v137, "flowItemDidAppear:", v216);
    objc_storeStrong(&v137, 0);
  }
  if (v217 == 1)
  {
    v136 = (os_log_t)(id)_BYLoggingFacility(v128);
    if (os_log_type_enabled(v136, OS_LOG_TYPE_DEBUG))
    {
      v130 = -[BuddyNavigationFlowController navigator](v220, "navigator");
      v131 = -[BuddyNavigationFlowNavigator view](v130, "view");
      v132 = objc_msgSend(v131, "window");
      sub_100066BA8((uint64_t)v221, (uint64_t)"-[BuddyNavigationFlowController navigationController:didShowViewController:operation:animated:]", (uint64_t)v132);
      _os_log_debug_impl((void *)&_mh_execute_header, v136, OS_LOG_TYPE_DEBUG, "%s setUserInteractionEnabled YES %p", v221, 0x16u);

    }
    objc_storeStrong((id *)&v136, 0);
    v133 = -[BuddyNavigationFlowController navigator](v220, "navigator");
    v134 = -[BuddyNavigationFlowNavigator view](v133, "view");
    v135 = objc_msgSend(v134, "window");
    objc_msgSend(v135, "setUserInteractionEnabled:", 1);

  }
  objc_storeStrong(&v218, 0);
  objc_storeStrong(location, 0);
}

- (void)_injectDependencies:(id)a3 withEnvironment:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  os_log_type_t v63;
  os_log_t oslog;
  id v65;
  id location[3];
  uint8_t buf[24];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v65 = 0;
  objc_storeStrong(&v65, a4);
  if ((objc_msgSend(location[0], "conformsToProtocol:", &OBJC_PROTOCOL___BYEnvironmentDependencyReceiver) & 1) != 0)
  {
    v5 = location[0];
    v6 = objc_opt_class(UIViewController);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v7 = objc_msgSend(location[0], "isViewLoaded");
      if ((v7 & 1) != 0)
      {
        oslog = (os_log_t)(id)_BYLoggingFacility(v7);
        v63 = OS_LOG_TYPE_FAULT;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_FAULT))
        {
          v8 = (objc_class *)objc_opt_class(location[0]);
          v62 = NSStringFromClass(v8);
          sub_100038C28((uint64_t)buf, (uint64_t)v62);
          _os_log_fault_impl((void *)&_mh_execute_header, oslog, v63, "Precondition failed item cannot be injected as item:(%@)'s loadView has been called", buf, 0xCu);

          objc_storeStrong(&v62, 0);
        }
        objc_storeStrong((id *)&oslog, 0);
      }
    }
    v61 = location[0];
    if ((objc_opt_respondsToSelector(v61, "setDeviceProvider:") & 1) != 0)
    {
      v9 = objc_msgSend(v65, "deviceProvider");
      objc_msgSend(v61, "setDeviceProvider:", v9);

    }
    if ((objc_opt_respondsToSelector(v61, "setSuspendTask:") & 1) != 0)
    {
      v10 = objc_msgSend(v65, "suspendTask");
      objc_msgSend(v61, "setSuspendTask:", v10);

    }
    if ((objc_opt_respondsToSelector(v61, "setPendingRestoreState:") & 1) != 0)
    {
      v11 = objc_msgSend(v65, "pendingRestoreState");
      objc_msgSend(v61, "setPendingRestoreState:", v11);

    }
    if ((objc_opt_respondsToSelector(v61, "setChronicle:") & 1) != 0)
    {
      v12 = objc_msgSend(v65, "chronicle");
      objc_msgSend(v61, "setChronicle:", v12);

    }
    if ((objc_opt_respondsToSelector(v61, "setMiscState:") & 1) != 0)
    {
      v13 = objc_msgSend(v65, "miscState");
      objc_msgSend(v61, "setMiscState:", v13);

    }
    if ((objc_opt_respondsToSelector(v61, "setProximitySetupController:") & 1) != 0)
    {
      v14 = objc_msgSend(v65, "proximitySetupController");
      objc_msgSend(v61, "setProximitySetupController:", v14);

    }
    if ((objc_opt_respondsToSelector(v61, "setProximityAutomatedDeviceEnrollmentController:") & 1) != 0)
    {
      v15 = objc_msgSend(v65, "proximityAutomatedDeviceEnrollmentController");
      objc_msgSend(v61, "setProximityAutomatedDeviceEnrollmentController:", v15);

    }
    if ((objc_opt_respondsToSelector(v61, "setBackupDeviceController:") & 1) != 0)
    {
      v16 = objc_msgSend(v65, "backupDeviceController");
      objc_msgSend(v61, "setBackupDeviceController:", v16);

    }
    if ((objc_opt_respondsToSelector(v61, "setSystemTimeUpdateManager:") & 1) != 0)
    {
      v17 = objc_msgSend(v65, "systemTimeUpdateManager");
      objc_msgSend(v61, "setSystemTimeUpdateManager:", v17);

    }
    if ((objc_opt_respondsToSelector(v61, "setEnrollmentCoordinator:") & 1) != 0)
    {
      v18 = objc_msgSend(v65, "enrollmentCoordinator");
      objc_msgSend(v61, "setEnrollmentCoordinator:", v18);

    }
    if ((objc_opt_respondsToSelector(v61, "setMenuButtonPressedBlock:") & 1) != 0)
    {
      v19 = objc_msgSend(v65, "menuButtonPressedBlock");
      objc_msgSend(v61, "setMenuButtonPressedBlock:", v19);

    }
    if ((objc_opt_respondsToSelector(v61, "setShowModalWiFiSettingsBlock:") & 1) != 0)
    {
      v20 = objc_msgSend(v65, "showModalWiFiSettingsBlock");
      objc_msgSend(v61, "setShowModalWiFiSettingsBlock:", v20);

    }
    if ((objc_opt_respondsToSelector(v61, "setWriteGreenInformedDefaultPlistIfNecessaryBlock:") & 1) != 0)
    {
      v21 = objc_msgSend(v65, "writeGreenInformedDefaultPlistIfNecessaryBlock");
      objc_msgSend(v61, "setWriteGreenInformedDefaultPlistIfNecessaryBlock:", v21);

    }
    if ((objc_opt_respondsToSelector(v61, "setDoesRestartFlowCauseEraseBlock:") & 1) != 0)
    {
      v22 = objc_msgSend(v65, "doesRestartFlowCauseEraseBlock");
      objc_msgSend(v61, "setDoesRestartFlowCauseEraseBlock:", v22);

    }
    if ((objc_opt_respondsToSelector(v61, "setPrepareForCloudRestoreRebootBlock:") & 1) != 0)
    {
      v23 = objc_msgSend(v65, "prepareForCloudRestoreRebootBlock");
      objc_msgSend(v61, "setPrepareForCloudRestoreRebootBlock:", v23);

    }
    if ((objc_opt_respondsToSelector(v61, "setExitBuddyForDemoSetUpBlock:") & 1) != 0)
    {
      v24 = objc_msgSend(v65, "exitBuddyForDemoSetUpBlock");
      objc_msgSend(v61, "setExitBuddyForDemoSetUpBlock:", v24);

    }
    if ((objc_opt_respondsToSelector(v61, "setPrepareForDeviceMigrationBlock:") & 1) != 0)
    {
      v25 = objc_msgSend(v65, "prepareForDeviceMigrationBlock");
      objc_msgSend(v61, "setPrepareForDeviceMigrationBlock:", v25);

    }
    if ((objc_opt_respondsToSelector(v61, "setStartDeviceMigrationBlock:") & 1) != 0)
    {
      v26 = objc_msgSend(v65, "startDeviceMigrationBlock");
      objc_msgSend(v61, "setStartDeviceMigrationBlock:", v26);

    }
    if ((objc_opt_respondsToSelector(v61, "setExistingSettings:") & 1) != 0)
    {
      v27 = objc_msgSend(v65, "existingSettings");
      objc_msgSend(v61, "setExistingSettings:", v27);

    }
    if ((objc_opt_respondsToSelector(v61, "setDisplayZoomExecutor:") & 1) != 0)
    {
      v28 = objc_msgSend(v65, "displayZoomExecutor");
      objc_msgSend(v61, "setDisplayZoomExecutor:", v28);

    }
    if ((objc_opt_respondsToSelector(v61, "setSeedProgramManager:") & 1) != 0)
    {
      v29 = objc_msgSend(v65, "seedProgramManager");
      objc_msgSend(v61, "setSeedProgramManager:", v29);

    }
    if ((objc_opt_respondsToSelector(v61, "setNetworkProvider:") & 1) != 0)
    {
      v30 = objc_msgSend(v65, "networkProvider");
      objc_msgSend(v61, "setNetworkProvider:", v30);

    }
    if ((objc_opt_respondsToSelector(v61, "setBuddyPreferences:") & 1) != 0)
    {
      v31 = objc_msgSend(v65, "buddyPreferences");
      objc_msgSend(v61, "setBuddyPreferences:", v31);

    }
    if ((objc_opt_respondsToSelector(v61, "setBuddyPreferencesExcludedFromBackup:") & 1) != 0)
    {
      v32 = objc_msgSend(v65, "buddyPreferencesExcludedFromBackup");
      objc_msgSend(v61, "setBuddyPreferencesExcludedFromBackup:", v32);

    }
    if ((objc_opt_respondsToSelector(v61, "setSetupMethod:") & 1) != 0)
    {
      v33 = objc_msgSend(v65, "setupMethod");
      objc_msgSend(v61, "setSetupMethod:", v33);

    }
    if ((objc_opt_respondsToSelector(v61, "setWillPerformSoftwareUpdateBlock:") & 1) != 0)
    {
      v34 = objc_msgSend(v65, "willPerformSoftwareUpdateBlock");
      objc_msgSend(v61, "setWillPerformSoftwareUpdateBlock:", v34);

    }
    if ((objc_opt_respondsToSelector(v61, "setBetaEnrollmentStateManager:") & 1) != 0)
    {
      v35 = objc_msgSend(v65, "betaEnrollmentStateManager");
      objc_msgSend(v61, "setBetaEnrollmentStateManager:", v35);

    }
    if ((objc_opt_respondsToSelector(v61, "setCapabilities:") & 1) != 0)
    {
      v36 = objc_msgSend(v65, "capabilities");
      objc_msgSend(v61, "setCapabilities:", v36);

    }
    if ((objc_opt_respondsToSelector(v61, "setSoftwareUpdateCache:") & 1) != 0)
    {
      v37 = objc_msgSend(v65, "softwareUpdateCache");
      objc_msgSend(v61, "setSoftwareUpdateCache:", v37);

    }
    if ((objc_opt_respondsToSelector(v61, "setSettingsManager:") & 1) != 0)
    {
      v38 = objc_msgSend(v65, "settingsManager");
      objc_msgSend(v61, "setSettingsManager:", v38);

    }
    if ((objc_opt_respondsToSelector(v61, "setPasscodeCacheManager:") & 1) != 0)
    {
      v39 = objc_msgSend(v65, "passcodeCacheManager");
      objc_msgSend(v61, "setPasscodeCacheManager:", v39);

    }
    if ((objc_opt_respondsToSelector(v61, "setRunState:") & 1) != 0)
    {
      v40 = objc_msgSend(v65, "runState");
      objc_msgSend(v61, "setRunState:", v40);

    }
    if ((objc_opt_respondsToSelector(v61, "setAnalyticsManager:") & 1) != 0)
    {
      v41 = objc_msgSend(v65, "analyticsManager");
      objc_msgSend(v61, "setAnalyticsManager:", v41);

    }
    if ((objc_opt_respondsToSelector(v61, "setPaneFeatureAnalyticsManager:") & 1) != 0)
    {
      v42 = objc_msgSend(v65, "paneFeatureAnalyticsManager");
      objc_msgSend(v61, "setPaneFeatureAnalyticsManager:", v42);

    }
    if ((objc_opt_respondsToSelector(v61, "setManagedConfiguration:") & 1) != 0)
    {
      v43 = objc_msgSend(v65, "managedConfiguration");
      objc_msgSend(v61, "setManagedConfiguration:", v43);

    }
    if ((objc_opt_respondsToSelector(v61, "setActivationRecord:") & 1) != 0)
    {
      v44 = objc_msgSend(v65, "activationRecord");
      objc_msgSend(v61, "setActivationRecord:", v44);

    }
    if ((objc_opt_respondsToSelector(v61, "setCombinedTermsProvider:") & 1) != 0)
    {
      v45 = objc_msgSend(v65, "combinedTermsProvider");
      objc_msgSend(v61, "setCombinedTermsProvider:", v45);

    }
    if ((objc_opt_respondsToSelector(v61, "setFeatureFlags:") & 1) != 0)
    {
      v46 = objc_msgSend(v65, "featureFlags");
      objc_msgSend(v61, "setFeatureFlags:", v46);

    }
    if ((objc_opt_respondsToSelector(v61, "setButtonMonitor:") & 1) != 0)
    {
      v47 = objc_msgSend(v65, "buttonMonitor");
      objc_msgSend(v61, "setButtonMonitor:", v47);

    }
    if ((objc_opt_respondsToSelector(v61, "setEmergencyExecutor:") & 1) != 0)
    {
      v48 = objc_msgSend(v65, "emergencyExecutor");
      objc_msgSend(v61, "setEmergencyExecutor:", v48);

    }
    if ((objc_opt_respondsToSelector(v61, "setActivationState:") & 1) != 0)
    {
      v49 = objc_msgSend(v65, "activationState");
      objc_msgSend(v61, "setActivationState:", v49);

    }
    if ((objc_opt_respondsToSelector(v61, "setFlowSkipController:") & 1) != 0)
    {
      v50 = objc_msgSend(v65, "flowSkipController");
      objc_msgSend(v61, "setFlowSkipController:", v50);

    }
    if ((objc_opt_respondsToSelector(v61, "setMdmReturnToServiceController:") & 1) != 0)
    {
      v51 = objc_msgSend(v65, "mdmReturnToServiceController");
      objc_msgSend(v61, "setMdmReturnToServiceController:", v51);

    }
    if ((objc_opt_respondsToSelector(v61, "setAppearanceModeProvider:") & 1) != 0)
    {
      v52 = objc_msgSend(v65, "appearanceModeProvider");
      objc_msgSend(v61, "setAppearanceModeProvider:", v52);

    }
    if ((objc_opt_respondsToSelector(v61, "setUserDispositionProvider:") & 1) != 0)
    {
      v53 = objc_msgSend(v65, "userDispositionProvider");
      objc_msgSend(v61, "setUserDispositionProvider:", v53);

    }
    if ((objc_opt_respondsToSelector(v61, "setDeviceConfiguration:") & 1) != 0)
    {
      v54 = objc_msgSend(v65, "deviceConfiguration");
      objc_msgSend(v61, "setDeviceConfiguration:", v54);

    }
    if ((objc_opt_respondsToSelector(v61, "setFlowItemDispositionProvider:") & 1) != 0)
    {
      v55 = objc_msgSend(v65, "flowItemDispositionProvider");
      objc_msgSend(v61, "setFlowItemDispositionProvider:", v55);

    }
    if ((objc_opt_respondsToSelector(v61, "setLockdownModeProvider:") & 1) != 0)
    {
      v56 = objc_msgSend(v65, "lockdownModeProvider");
      objc_msgSend(v61, "setLockdownModeProvider:", v56);

    }
    if ((objc_opt_respondsToSelector(v61, "setAnalyticsEventAppearance:") & 1) != 0)
    {
      v57 = objc_msgSend(v65, "analyticsEventAppearance");
      objc_msgSend(v61, "setAnalyticsEventAppearance:", v57);

    }
    if ((objc_opt_respondsToSelector(v61, "setChildSetupPresenter:") & 1) != 0)
    {
      v58 = objc_msgSend(v65, "childSetupPresenter");
      objc_msgSend(v61, "setChildSetupPresenter:", v58);

    }
    if ((objc_opt_respondsToSelector(v61, "setBuddyBackgroundViewController:") & 1) != 0)
    {
      v59 = objc_msgSend(v65, "buddyBackgroundViewController");
      objc_msgSend(v61, "setBuddyBackgroundViewController:", v59);

    }
    if ((objc_opt_respondsToSelector(v61, "setIntelligenceProvider:") & 1) != 0)
    {
      v60 = objc_msgSend(v65, "intelligenceProvider");
      objc_msgSend(v61, "setIntelligenceProvider:", v60);

    }
    objc_storeStrong(&v61, 0);
  }
  objc_storeStrong(&v65, 0);
  objc_storeStrong(location, 0);
}

- (id)_injectedFlowForClass:(Class)a3
{
  BYEnvironment *v3;
  id location;
  Class v6;
  SEL v7;
  BuddyNavigationFlowController *v8;
  id v9;

  v8 = self;
  v7 = a2;
  v6 = a3;
  if ((-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class(BFFFlow)) & 1) != 0)
  {
    location = -[BuddyNavigationFlowController _createFlowItemForClass:](v8, "_createFlowItemForClass:", v6);
    v3 = -[BuddyNavigationFlowController environment](v8, "environment");
    -[BuddyNavigationFlowController _injectDependencies:withEnvironment:](v8, "_injectDependencies:withEnvironment:", location, v3);

    v9 = location;
    objc_storeStrong(&location, 0);
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)environmentInjector
{
  id v2;
  void **v4;
  int v5;
  int v6;
  id (*v7)(id *, void *);
  void *v8;
  id v9;
  id v10;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  objc_initWeak(location, self);
  v4 = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_100071598;
  v8 = &unk_1002813F8;
  objc_copyWeak(&v9, location);
  v10 = objc_retainBlock(&v4);
  v2 = objc_retainBlock(v10);
  objc_storeStrong(&v10, 0);
  objc_destroyWeak(&v9);
  objc_destroyWeak(location);
  return v2;
}

- (BuddyFlowDelegate)flowDelegate
{
  return (BuddyFlowDelegate *)objc_loadWeakRetained((id *)&self->_flowDelegate);
}

- (void)setFlowDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_flowDelegate, a3);
}

- (BuddyLifecycleDelegate)lifecycleDelegate
{
  return (BuddyLifecycleDelegate *)objc_loadWeakRetained((id *)&self->_lifecycleDelegate);
}

- (void)setLifecycleDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_lifecycleDelegate, a3);
}

- (BuddyFlowCloudConfigDelegate)flowCloudConfigurationDelegate
{
  return (BuddyFlowCloudConfigDelegate *)objc_loadWeakRetained((id *)&self->_flowCloudConfigurationDelegate);
}

- (void)setFlowCloudConfigurationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_flowCloudConfigurationDelegate, a3);
}

- (BuddyFlowProducer)flowProducer
{
  return (BuddyFlowProducer *)objc_loadWeakRetained((id *)&self->_flowProducer);
}

- (void)setFlowProducer:(id)a3
{
  objc_storeWeak((id *)&self->_flowProducer, a3);
}

- (ProximitySetupController)proximitySetupController
{
  return (ProximitySetupController *)objc_getProperty(self, a2, 48, 1);
}

- (void)setProximitySetupController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (BuddyWiFiController)wifiController
{
  return (BuddyWiFiController *)objc_getProperty(self, a2, 56, 1);
}

- (void)setWifiController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (BYPreferencesController)buddyPreferences
{
  return self->_buddyPreferences;
}

- (void)setBuddyPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_buddyPreferences, a3);
}

- (BYAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsManager, a3);
}

- (BuddyNavigationFlowNavigator)navigator
{
  return (BuddyNavigationFlowNavigator *)objc_getProperty(self, a2, 80, 1);
}

- (void)setNavigator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (BuddyRestoreProvider)restoreProvider
{
  return (BuddyRestoreProvider *)objc_loadWeakRetained((id *)&self->_restoreProvider);
}

- (void)setRestoreProvider:(id)a3
{
  objc_storeWeak((id *)&self->_restoreProvider, a3);
}

- (BFFFlowStarter)flowStarter
{
  return self->_flowStarter;
}

- (void)setFlowStarter:(id)a3
{
  objc_storeStrong((id *)&self->_flowStarter, a3);
}

- (NSMutableArray)buddyControllers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 104, 1);
}

- (void)setBuddyControllers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSArray)viewControllersToRemoveOnPush
{
  return (NSArray *)objc_getProperty(self, a2, 112, 1);
}

- (void)setViewControllersToRemoveOnPush:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSPointerArray)weakBuddyControllersPrecedingDeviceRestoreChoiceController
{
  return self->_weakBuddyControllersPrecedingDeviceRestoreChoiceController;
}

- (void)setWeakBuddyControllersPrecedingDeviceRestoreChoiceController:(id)a3
{
  objc_storeStrong((id *)&self->_weakBuddyControllersPrecedingDeviceRestoreChoiceController, a3);
}

- (NSPointerArray)weakViewControllersPrecedingDeviceRestoreChoiceController
{
  return self->_weakViewControllersPrecedingDeviceRestoreChoiceController;
}

- (void)setWeakViewControllersPrecedingDeviceRestoreChoiceController:(id)a3
{
  objc_storeStrong((id *)&self->_weakViewControllersPrecedingDeviceRestoreChoiceController, a3);
}

- (UIViewController)topViewControllerForRemoving
{
  return (UIViewController *)objc_getProperty(self, a2, 136, 1);
}

- (void)setTopViewControllerForRemoving:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (BOOL)isTapFreeSetUp
{
  return self->_tapFreeSetUp;
}

- (void)setTapFreeSetUp:(BOOL)a3
{
  self->_tapFreeSetUp = a3;
}

- (BOOL)didInsertWiFiPaneForCloudConfigurationFlow
{
  return self->_didInsertWiFiPaneForCloudConfigurationFlow;
}

- (void)setDidInsertWiFiPaneForCloudConfigurationFlow:(BOOL)a3
{
  self->_didInsertWiFiPaneForCloudConfigurationFlow = a3;
}

- (BYEnvironment)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_environment, a3);
}

- (NSMutableArray)trailingControllers
{
  return self->_trailingControllers;
}

- (void)setTrailingControllers:(id)a3
{
  objc_storeStrong((id *)&self->_trailingControllers, a3);
}

- (id)savedItemForClassBlock
{
  return self->_savedItemForClassBlock;
}

- (void)setSavedItemForClassBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSDate)navigationStartDate
{
  return self->_navigationStartDate;
}

- (void)setNavigationStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_navigationStartDate, a3);
}

- (OS_dispatch_queue)navigationQueue
{
  return self->_navigationQueue;
}

- (void)setNavigationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_navigationQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationQueue, 0);
  objc_storeStrong((id *)&self->_navigationStartDate, 0);
  objc_storeStrong(&self->_savedItemForClassBlock, 0);
  objc_storeStrong((id *)&self->_trailingControllers, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_topViewControllerForRemoving, 0);
  objc_storeStrong((id *)&self->_weakViewControllersPrecedingDeviceRestoreChoiceController, 0);
  objc_storeStrong((id *)&self->_weakBuddyControllersPrecedingDeviceRestoreChoiceController, 0);
  objc_storeStrong((id *)&self->_viewControllersToRemoveOnPush, 0);
  objc_storeStrong((id *)&self->_buddyControllers, 0);
  objc_storeStrong((id *)&self->_flowStarter, 0);
  objc_destroyWeak((id *)&self->_restoreProvider);
  objc_storeStrong((id *)&self->_navigator, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_buddyPreferences, 0);
  objc_storeStrong((id *)&self->_wifiController, 0);
  objc_storeStrong((id *)&self->_proximitySetupController, 0);
  objc_destroyWeak((id *)&self->_flowProducer);
  objc_destroyWeak((id *)&self->_flowCloudConfigurationDelegate);
  objc_destroyWeak((id *)&self->_lifecycleDelegate);
  objc_destroyWeak((id *)&self->_flowDelegate);
}

@end
