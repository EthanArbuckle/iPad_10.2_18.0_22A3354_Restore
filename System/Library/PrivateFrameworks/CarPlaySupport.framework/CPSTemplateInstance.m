@implementation CPSTemplateInstance

- (CPSTemplateInstance)initWithBundleIdentifier:(id)a3
{
  CPSTemplateInstance *v3;
  CPSApplicationStateMonitor *v4;
  CPSApplicationStateMonitor *applicationStateMonitor;
  CPSBannerSource *v6;
  uint64_t v7;
  CPSBannerSource *bannerSource;
  CPSOverlayViewController *v9;
  CPSOverlayViewController *overlayViewController;
  NSMutableDictionary *v11;
  NSMutableDictionary *identifierToViewControllerDictionary;
  NSXPCListener *v13;
  NSXPCListener *interfaceControllerListener;
  CPSDashboardGuidanceViewController *v15;
  CPSDashboardGuidanceViewController *dashboardGuidanceViewController;
  CPSDashboardEstimatesViewController *v17;
  CPSDashboardEstimatesViewController *dashboardEstimatesViewController;
  uint64_t v19;
  SiriDirectActionSource *siriActivationSource;
  id v21;
  uint64_t v22;
  CPNavigationManager *navigationManager;
  NSXPCListener *v24;
  NSXPCListener *dashboardControllerListener;
  NSXPCListener *v26;
  NSXPCListener *instrumentClusterControllerListener;
  CPSTemplateInstance *v29;
  id v30;
  id v31;
  objc_super v32;
  id location[2];
  CPSTemplateInstance *v34;

  v34 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v34;
  v34 = 0;
  v32.receiver = v3;
  v32.super_class = (Class)CPSTemplateInstance;
  v34 = -[CPSTemplateInstance init](&v32, sel_init);
  objc_storeStrong((id *)&v34, v34);
  if (v34)
  {
    v4 = objc_alloc_init(CPSApplicationStateMonitor);
    applicationStateMonitor = v34->_applicationStateMonitor;
    v34->_applicationStateMonitor = v4;

    v6 = [CPSBannerSource alloc];
    v7 = -[CPSBannerSource initWithBundleIdentifier:delegate:applicationStateMonitor:](v6, "initWithBundleIdentifier:delegate:applicationStateMonitor:", location[0], v34, v34->_applicationStateMonitor);
    bannerSource = v34->_bannerSource;
    v34->_bannerSource = (CPSBannerSource *)v7;

    v9 = -[CPSOverlayViewController initWithNavigationBarClass:toolbarClass:]([CPSOverlayViewController alloc], "initWithNavigationBarClass:toolbarClass:", objc_opt_class());
    overlayViewController = v34->_overlayViewController;
    v34->_overlayViewController = v9;

    v30 = (id)-[CPSOverlayViewController view](v34->_overlayViewController, "view");
    objc_msgSend(v30, "setHidden:", 1);

    -[CPSOverlayViewController setDelegate:](v34->_overlayViewController, "setDelegate:", v34);
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    identifierToViewControllerDictionary = v34->_identifierToViewControllerDictionary;
    v34->_identifierToViewControllerDictionary = v11;

    v13 = (NSXPCListener *)(id)objc_msgSend(MEMORY[0x24BDD1998], "anonymousListener");
    interfaceControllerListener = v34->_interfaceControllerListener;
    v34->_interfaceControllerListener = v13;

    -[NSXPCListener setDelegate:](v34->_interfaceControllerListener, "setDelegate:", v34);
    -[NSXPCListener resume](v34->_interfaceControllerListener, "resume");
    v15 = objc_alloc_init(CPSDashboardGuidanceViewController);
    dashboardGuidanceViewController = v34->_dashboardGuidanceViewController;
    v34->_dashboardGuidanceViewController = v15;

    v17 = objc_alloc_init(CPSDashboardEstimatesViewController);
    dashboardEstimatesViewController = v34->_dashboardEstimatesViewController;
    v34->_dashboardEstimatesViewController = v17;

    v19 = objc_msgSend(objc_alloc(MEMORY[0x24BE90828]), "initWithDelegate:", 0);
    siriActivationSource = v34->_siriActivationSource;
    v34->_siriActivationSource = (SiriDirectActionSource *)v19;

    v21 = objc_alloc(MEMORY[0x24BDB7A18]);
    v22 = objc_msgSend(v21, "initWithIdentifier:delegate:", location[0], v34);
    navigationManager = v34->_navigationManager;
    v34->_navigationManager = (CPNavigationManager *)v22;

    v24 = (NSXPCListener *)(id)objc_msgSend(MEMORY[0x24BDD1998], "anonymousListener");
    dashboardControllerListener = v34->_dashboardControllerListener;
    v34->_dashboardControllerListener = v24;

    -[NSXPCListener setDelegate:](v34->_dashboardControllerListener, "setDelegate:", v34);
    -[NSXPCListener resume](v34->_dashboardControllerListener, "resume");
    v26 = (NSXPCListener *)(id)objc_msgSend(MEMORY[0x24BDD1998], "anonymousListener");
    instrumentClusterControllerListener = v34->_instrumentClusterControllerListener;
    v34->_instrumentClusterControllerListener = v26;

    -[NSXPCListener setDelegate:](v34->_instrumentClusterControllerListener, "setDelegate:", v34);
    -[NSXPCListener resume](v34->_instrumentClusterControllerListener, "resume");
    v31 = (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v31, "addObserver:selector:name:object:", v34, sel__applicationDidThrottleAudioUpdates_, CFSTR("CPSAudioManagerDidThrottleUpdateNotification"), 0);

  }
  v29 = v34;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v34, 0);
  return v29;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CPSTemplateInstance *v4;

  v4 = self;
  v3 = a2;
  -[CPSTemplateInstance invalidate](self, "invalidate");
  v2.receiver = v4;
  v2.super_class = (Class)CPSTemplateInstance;
  -[CPSTemplateInstance dealloc](&v2, sel_dealloc);
}

- (id)endpoint
{
  NSXPCListenerEndpoint *v3;
  NSXPCListener *v4;
  id v5;

  v4 = -[CPSTemplateInstance interfaceControllerListener](self, "interfaceControllerListener");
  v3 = -[NSXPCListener endpoint](v4, "endpoint");
  v5 = (id)-[NSXPCListenerEndpoint _endpoint](v3, "_endpoint");

  return v5;
}

- (id)dashboardEndpoint
{
  NSXPCListenerEndpoint *v3;
  NSXPCListener *v4;
  id v5;

  v4 = -[CPSTemplateInstance dashboardControllerListener](self, "dashboardControllerListener");
  v3 = -[NSXPCListener endpoint](v4, "endpoint");
  v5 = (id)-[NSXPCListenerEndpoint _endpoint](v3, "_endpoint");

  return v5;
}

- (id)instrumentClusterEndpoint
{
  NSXPCListenerEndpoint *v3;
  NSXPCListener *v4;
  id v5;

  v4 = -[CPSTemplateInstance instrumentClusterControllerListener](self, "instrumentClusterControllerListener");
  v3 = -[NSXPCListener endpoint](v4, "endpoint");
  v5 = (id)-[NSXPCListenerEndpoint _endpoint](v3, "_endpoint");

  return v5;
}

- (void)setScene:(id)a3
{
  id WeakRetained;
  NSObject *queue;
  BOOL v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  CPSTemplateInstance *v11;
  id location[2];
  CPSTemplateInstance *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  WeakRetained = objc_loadWeakRetained((id *)&v13->_scene);
  v5 = WeakRetained == location[0];

  if (!v5)
  {
    objc_storeWeak((id *)&v13->_scene, location[0]);
    queue = MEMORY[0x24BDAC9B8];
    v6 = MEMORY[0x24BDAC760];
    v7 = -1073741824;
    v8 = 0;
    v9 = __32__CPSTemplateInstance_setScene___block_invoke;
    v10 = &unk_24E26F1B8;
    v11 = v13;
    dispatch_async(queue, &v6);

    objc_storeStrong((id *)&v11, 0);
  }
  objc_storeStrong(location, 0);
}

uint64_t __32__CPSTemplateInstance_setScene___block_invoke(uint64_t a1)
{
  double v1;
  double v2;
  double v3;
  double v4;
  void *v6;

  v6 = *(void **)(a1 + 32);
  objc_msgSend(v6, "currentSafeAreaInsets");
  return objc_msgSend(v6, "viewController:didUpdateSafeAreaInsets:", 0, v1, v2, v3, v4);
}

- (void)setMapWidgetScene:(id)a3
{
  id WeakRetained;
  NSObject *queue;
  BOOL v5;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(uint64_t);
  void *v10;
  CPSTemplateInstance *v11;
  id location[2];
  CPSTemplateInstance *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  WeakRetained = objc_loadWeakRetained((id *)&v13->_mapWidgetScene);
  v5 = WeakRetained == location[0];

  if (!v5)
  {
    objc_storeWeak((id *)&v13->_mapWidgetScene, location[0]);
    queue = MEMORY[0x24BDAC9B8];
    v6 = MEMORY[0x24BDAC760];
    v7 = -1073741824;
    v8 = 0;
    v9 = __41__CPSTemplateInstance_setMapWidgetScene___block_invoke;
    v10 = &unk_24E26F1B8;
    v11 = v13;
    dispatch_async(queue, &v6);

    objc_storeStrong((id *)&v11, 0);
  }
  objc_storeStrong(location, 0);
}

void __41__CPSTemplateInstance_setMapWidgetScene___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "dashboardEstimatesViewController");
  objc_msgSend(v2, "setSafeAreaDelegate:", *(_QWORD *)(a1 + 32));

}

- (void)setInstrumentClusterScene:(id)a3
{
  id WeakRetained;
  NSObject *queue;
  BOOL v5;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(id *);
  void *v10;
  CPSTemplateInstance *v11;
  id location[2];
  CPSTemplateInstance *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  WeakRetained = objc_loadWeakRetained((id *)&v13->_instrumentClusterScene);
  v5 = WeakRetained == location[0];

  if (!v5)
  {
    objc_storeWeak((id *)&v13->_instrumentClusterScene, location[0]);
    queue = MEMORY[0x24BDAC9B8];
    v6 = MEMORY[0x24BDAC760];
    v7 = -1073741824;
    v8 = 0;
    v9 = __49__CPSTemplateInstance_setInstrumentClusterScene___block_invoke;
    v10 = &unk_24E26F1B8;
    v11 = v13;
    dispatch_async(queue, &v6);

    objc_storeStrong((id *)&v11, 0);
  }
  objc_storeStrong(location, 0);
}

void __49__CPSTemplateInstance_setInstrumentClusterScene___block_invoke(id *a1)
{
  id v2;
  uint64_t v3;
  int v4;
  int v5;
  void (*v6)(_QWORD *, void *);
  void *v7;
  id v8[3];

  v8[2] = a1;
  v8[1] = a1;
  v2 = (id)objc_msgSend(a1[4], "instrumentClusterScene");
  v3 = MEMORY[0x24BDAC760];
  v4 = -1073741824;
  v5 = 0;
  v6 = __49__CPSTemplateInstance_setInstrumentClusterScene___block_invoke_2;
  v7 = &unk_24E26F9B8;
  v8[0] = a1[4];
  objc_msgSend(v2, "updateUISettingsWithBlock:");

  objc_storeStrong(v8, 0);
}

void __49__CPSTemplateInstance_setInstrumentClusterScene___block_invoke_2(_QWORD *a1, void *a2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v7;
  id v8;
  id v9;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v8 = location[0];
  v7 = (void *)a1[4];
  v9 = (id)objc_msgSend(v7, "instrumentClusterScene");
  objc_msgSend(v7, "safeAreaInsetsForScene:");
  objc_msgSend(v8, "setSafeAreaInsetsPortrait:", v2, v3, v4, v5);

  objc_storeStrong(location, 0);
}

- (BOOL)_templateIsValidForCurrentEntitlement:(id)a3 presentationStyle:(unint64_t)a4
{
  CPTemplateServiceClientInterface *interfaceControllerRemoteObjectProxy;
  NSString *v6;
  CPSOverlayViewController *v7;
  id v8;
  BOOL v9;
  NSSet *v11;
  CPSTemplateEnvironment *v12;
  BOOL v13;
  id v14;
  os_log_type_t v15;
  id v16;
  char v17;
  Class Class;
  unint64_t v19;
  id location[2];
  CPSTemplateInstance *v21;
  char v22;
  uint8_t v23[16];
  uint8_t v24[24];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v19 = a4;
  Class = object_getClass(location[0]);
  v17 = 1;
  v12 = -[CPSTemplateInstance templateEnvironment](v21, "templateEnvironment");
  v11 = -[CPSTemplateEnvironment allowedTemplateClasses](v12, "allowedTemplateClasses");
  v13 = -[NSSet containsObject:](v11, "containsObject:", Class);

  if (v13)
  {
    v7 = -[CPSTemplateInstance overlayViewController](v21, "overlayViewController");
    v8 = (id)-[CPSOverlayViewController topViewController](v7, "topViewController");
    objc_opt_class();
    v9 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v19 == 0;

    if (v9)
    {
      v14 = CarPlaySupportGeneralLogging();
      if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_66((uint64_t)v23, (uint64_t)location[0]);
        _os_log_error_impl(&dword_21E389000, (os_log_t)v14, OS_LOG_TYPE_ERROR, "Template may not be pushed on top of now playing: %{public}@", v23, 0xCu);
      }
      objc_storeStrong(&v14, 0);
      v17 = -[objc_class isEqual:](Class, "isEqual:", objc_opt_class()) & 1;
    }
  }
  else
  {
    v16 = CarPlaySupportGeneralLogging();
    v15 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_66((uint64_t)v24, (uint64_t)location[0]);
      _os_log_error_impl(&dword_21E389000, (os_log_t)v16, v15, "Template is disallowed for this app category: %{public}@", v24, 0xCu);
    }
    objc_storeStrong(&v16, 0);
    v17 = 0;
  }
  if ((v17 & 1) != 0)
  {
    v22 = 1;
  }
  else
  {
    interfaceControllerRemoteObjectProxy = v21->_interfaceControllerRemoteObjectProxy;
    v6 = NSStringFromClass(Class);
    -[CPTemplateServiceClientInterface clientPushedIllegalTemplateOfClass:](interfaceControllerRemoteObjectProxy, "clientPushedIllegalTemplateOfClass:");

    v22 = 0;
  }
  objc_storeStrong(location, 0);
  return v22 & 1;
}

- (void)_applicationDidThrottleAudioUpdates:(id)a3
{
  id location[2];
  CPSTemplateInstance *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[CPTemplateServiceClientInterface clientExceededAudioMetadataThrottleLimit](v4->_interfaceControllerRemoteObjectProxy, "clientExceededAudioMetadataThrottleLimit");
  objc_storeStrong(location, 0);
}

- (void)bannerTappedWithIdentifier:(id)a3
{
  CPTemplateServiceClientInterface *v3;
  id location[2];
  CPSTemplateInstance *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[CPSTemplateInstance interfaceControllerRemoteObjectProxy](v5, "interfaceControllerRemoteObjectProxy");
  -[CPTemplateServiceClientInterface bannerTappedWithIdentifier:](v3, "bannerTappedWithIdentifier:", location[0]);

  objc_storeStrong(location, 0);
}

- (void)bannerDidAppearWithIdentifier:(id)a3
{
  CPTemplateServiceClientInterface *v3;
  id location[2];
  CPSTemplateInstance *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[CPSTemplateInstance interfaceControllerRemoteObjectProxy](v5, "interfaceControllerRemoteObjectProxy");
  -[CPTemplateServiceClientInterface bannerDidAppearWithIdentifier:](v3, "bannerDidAppearWithIdentifier:", location[0]);

  objc_storeStrong(location, 0);
}

- (void)bannerDidDisappearWithIdentifier:(id)a3
{
  CPTemplateServiceClientInterface *v3;
  id location[2];
  CPSTemplateInstance *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[CPSTemplateInstance interfaceControllerRemoteObjectProxy](v5, "interfaceControllerRemoteObjectProxy");
  -[CPTemplateServiceClientInterface bannerDidDisappearWithIdentifier:](v3, "bannerDidDisappearWithIdentifier:", location[0]);

  objc_storeStrong(location, 0);
}

- (void)sendSuggestUI:(id)a3
{
  id v3;
  CARSessionStatus *v4;
  CPSTemplateEnvironment *v5;
  CPSTemplateEnvironment *v6;
  BOOL v7;
  id location[2];
  CPSTemplateInstance *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = -[CPSTemplateInstance templateEnvironment](v9, "templateEnvironment");
  v7 = -[CPSTemplateEnvironment supportsInstrumentCluster](v6, "supportsInstrumentCluster");

  if (v7)
  {
    v5 = -[CPSTemplateInstance templateEnvironment](v9, "templateEnvironment");
    v4 = -[CPSTemplateEnvironment sessionStatus](v5, "sessionStatus");
    v3 = (id)-[CARSessionStatus currentSession](v4, "currentSession");
    objc_msgSend(v3, "suggestUI:", location[0]);

  }
  objc_storeStrong(location, 0);
}

- (void)setHostPrefersDarkUserInterfaceStyle:(BOOL)a3
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  CPSTemplateInstance *v9;
  uint64_t v10;
  BOOL v11;
  SEL v12;
  CPSTemplateInstance *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  v10 = 0;
  if (a3)
    v10 = 2;
  queue = MEMORY[0x24BDAC9B8];
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __60__CPSTemplateInstance_setHostPrefersDarkUserInterfaceStyle___block_invoke;
  v8 = &unk_24E26F1B8;
  v9 = v13;
  dispatch_async(queue, &v4);

  objc_storeStrong((id *)&v9, 0);
}

void __60__CPSTemplateInstance_setHostPrefersDarkUserInterfaceStyle___block_invoke(uint64_t a1)
{
  id v1;
  id v3;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "overlayViewController");
  objc_msgSend(v1, "setOverrideUserInterfaceStyle:", 2);

  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "overlayViewController");
  objc_msgSend(v3, "setNeedsUserInterfaceAppearanceUpdate");

}

- (void)presentActionSheetTemplate:(id)a3 withProxyDelegate:(id)a4 animated:(id)a5 reply:(id)a6
{
  NSUUID *v6;
  NSUUID *actionSheetIdentifier;
  NSObject *queue;
  uint64_t v12;
  int v13;
  int v14;
  void (*v15)(uint64_t);
  void *v16;
  CPSTemplateInstance *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id location[2];
  CPSTemplateInstance *v25;

  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v23 = 0;
  objc_storeStrong(&v23, a4);
  v22 = 0;
  objc_storeStrong(&v22, a5);
  v21 = 0;
  objc_storeStrong(&v21, a6);
  v6 = (NSUUID *)(id)objc_msgSend(location[0], "identifier");
  actionSheetIdentifier = v25->_actionSheetIdentifier;
  v25->_actionSheetIdentifier = v6;

  objc_msgSend(location[0], "setAlertDelegate:", v23);
  queue = MEMORY[0x24BDAC9B8];
  v12 = MEMORY[0x24BDAC760];
  v13 = -1073741824;
  v14 = 0;
  v15 = __83__CPSTemplateInstance_presentActionSheetTemplate_withProxyDelegate_animated_reply___block_invoke;
  v16 = &unk_24E26F9E0;
  v17 = v25;
  v18 = location[0];
  v19 = v22;
  v20 = v21;
  dispatch_async(queue, &v12);

  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong((id *)&v17, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
}

void __83__CPSTemplateInstance_presentActionSheetTemplate_withProxyDelegate_animated_reply___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "overlayViewController");
  objc_msgSend(v2, "presentActionSheetTemplate:animated:completion:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "BOOLValue") & 1, *(_QWORD *)(a1 + 56));

}

- (void)presentAlertTemplate:(id)a3 withProxyDelegate:(id)a4 animated:(id)a5 reply:(id)a6
{
  NSObject *queue;
  uint64_t v10;
  int v11;
  int v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id v16;
  CPSTemplateInstance *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id location[2];
  CPSTemplateInstance *v24;

  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v22 = 0;
  objc_storeStrong(&v22, a4);
  v21 = 0;
  objc_storeStrong(&v21, a5);
  v20 = 0;
  objc_storeStrong(&v20, a6);
  queue = MEMORY[0x24BDAC9B8];
  v10 = MEMORY[0x24BDAC760];
  v11 = -1073741824;
  v12 = 0;
  v13 = __77__CPSTemplateInstance_presentAlertTemplate_withProxyDelegate_animated_reply___block_invoke;
  v14 = &unk_24E26FA08;
  v15 = location[0];
  v16 = v22;
  v17 = v24;
  v18 = v21;
  v19 = v20;
  dispatch_async(queue, &v10);

  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong((id *)&v17, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
}

void __77__CPSTemplateInstance_presentAlertTemplate_withProxyDelegate_animated_reply___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  CPSFullScreenAlertViewController *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v9;
  id v10[3];

  v10[2] = (id)a1;
  v10[1] = (id)a1;
  objc_msgSend(*(id *)(a1 + 32), "setTemplateDelegate:", *(_QWORD *)(a1 + 40));
  v3 = [CPSFullScreenAlertViewController alloc];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = (id)objc_msgSend(*(id *)(a1 + 48), "templateEnvironment");
  v10[0] = -[CPSFullScreenAlertViewController initWithAlert:alertDelegate:templateEnvironment:](v3, "initWithAlert:alertDelegate:templateEnvironment:", v1, v2);

  objc_msgSend(v10[0], "setViewControllerDelegate:", *(_QWORD *)(a1 + 48));
  v7 = (id)objc_msgSend(*(id *)(a1 + 48), "identifierToViewControllerDictionary");
  v5 = v10[0];
  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "identifier");
  objc_msgSend(v7, "setObject:forKey:", v5);

  v9 = (id)objc_msgSend(*(id *)(a1 + 48), "overlayViewController");
  objc_msgSend(v9, "presentTemplateViewController:animated:completion:", v10[0], objc_msgSend(*(id *)(a1 + 56), "BOOLValue") & 1, *(_QWORD *)(a1 + 64));

  objc_storeStrong(v10, 0);
}

- (void)requestBannerProviderWithReply:(id)a3
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  CPSTemplateInstance *v9;
  id v10;
  id location[2];
  CPSTemplateInstance *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = MEMORY[0x24BDAC9B8];
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __54__CPSTemplateInstance_requestBannerProviderWithReply___block_invoke;
  v8 = &unk_24E26FA30;
  v10 = location[0];
  v9 = v12;
  dispatch_async(queue, &v4);

  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

void __54__CPSTemplateInstance_requestBannerProviderWithReply___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "bannerSource");
  (*(void (**)(void))(v1 + 16))();

}

- (void)pushGridTemplate:(id)a3 withProxyDelegate:(id)a4 animated:(id)a5 presentationStyle:(unint64_t)a6 reply:(id)a7
{
  NSObject *queue;
  NSObject *log;
  os_log_type_t type;
  uint64_t v14;
  int v15;
  int v16;
  void (*v17)(uint64_t);
  void *v18;
  CPSTemplateInstance *v19;
  id v20;
  id v21;
  id v22;
  id v23[2];
  int v24;
  uint8_t v25[15];
  char v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  id location[2];
  CPSTemplateInstance *v33;

  v33 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v31 = 0;
  objc_storeStrong(&v31, a4);
  v30 = 0;
  objc_storeStrong(&v30, a5);
  v29 = (void *)a6;
  v28 = 0;
  objc_storeStrong(&v28, a7);
  v27 = CarPlaySupportGeneralLogging();
  v26 = 2;
  if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_DEBUG))
  {
    log = v27;
    type = v26;
    __os_log_helper_16_0_0(v25);
    _os_log_debug_impl(&dword_21E389000, log, type, "Grid Template requested", v25, 2u);
  }
  objc_storeStrong(&v27, 0);
  if (-[CPSTemplateInstance _templateIsValidForCurrentEntitlement:presentationStyle:](v33, "_templateIsValidForCurrentEntitlement:presentationStyle:", location[0], v29))
  {
    queue = MEMORY[0x24BDAC9B8];
    v14 = MEMORY[0x24BDAC760];
    v15 = -1073741824;
    v16 = 0;
    v17 = __91__CPSTemplateInstance_pushGridTemplate_withProxyDelegate_animated_presentationStyle_reply___block_invoke;
    v18 = &unk_24E26FA80;
    v19 = v33;
    v20 = location[0];
    v21 = v31;
    v22 = v30;
    v23[1] = v29;
    v23[0] = v28;
    dispatch_async(queue, &v14);

    objc_storeStrong(v23, 0);
    objc_storeStrong(&v22, 0);
    objc_storeStrong(&v21, 0);
    objc_storeStrong(&v20, 0);
    objc_storeStrong((id *)&v19, 0);
    v24 = 0;
  }
  else
  {
    v24 = 1;
  }
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(location, 0);
}

void __91__CPSTemplateInstance_pushGridTemplate_withProxyDelegate_animated_presentationStyle_reply___block_invoke(uint64_t a1)
{
  CPSGridTemplateViewController *v1;
  char v2;
  uint64_t v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  CPSGridTemplateViewController *v9;
  id v10;
  id v11;
  id v12;
  NSObject *log;
  os_log_type_t type;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  CPSGridTemplateViewController *v24;
  id v25;
  id v26;
  uint8_t v27[15];
  char v28;
  id v29;
  CPSGridTemplateViewController *v30;
  uint8_t v31[7];
  char v32;
  id location[3];

  location[2] = (id)a1;
  location[1] = (id)a1;
  v17 = (id)objc_msgSend(*(id *)(a1 + 32), "identifierToViewControllerDictionary");
  v16 = (id)objc_msgSend(*(id *)(a1 + 40), "identifier");
  v18 = (id)objc_msgSend(v17, "objectForKey:");

  if (v18)
  {
    location[0] = CarPlaySupportGeneralLogging();
    v32 = 2;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEBUG))
    {
      log = location[0];
      type = v32;
      __os_log_helper_16_0_0(v31);
      _os_log_debug_impl(&dword_21E389000, log, type, "already have a grid view controller for this template", v31, 2u);
    }
    objc_storeStrong(location, 0);
  }
  else
  {
    v9 = [CPSGridTemplateViewController alloc];
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 48);
    v10 = (id)objc_msgSend(*(id *)(a1 + 32), "templateEnvironment");
    v30 = -[CPSGridTemplateViewController initWithGridTemplate:interfaceDelegate:templateEnvironment:](v9, "initWithGridTemplate:interfaceDelegate:templateEnvironment:", v7, v8);

    -[CPSBaseTemplateViewController setViewControllerDelegate:](v30, "setViewControllerDelegate:", *(_QWORD *)(a1 + 32));
    v12 = (id)objc_msgSend(*(id *)(a1 + 32), "identifierToViewControllerDictionary");
    v11 = (id)objc_msgSend(*(id *)(a1 + 40), "identifier");
    objc_msgSend(v12, "setObject:forKey:", v30);

    v29 = CarPlaySupportGeneralLogging();
    v28 = 2;
    if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_DEBUG))
    {
      v5 = v29;
      v6 = v28;
      __os_log_helper_16_0_0(v27);
      _os_log_debug_impl(&dword_21E389000, v5, v6, "Pushing grid template", v27, 2u);
    }
    objc_storeStrong(&v29, 0);
    v4 = (id)objc_msgSend(*(id *)(a1 + 32), "overlayViewController");
    v1 = v30;
    v2 = objc_msgSend(*(id *)(a1 + 56), "BOOLValue");
    v3 = *(_QWORD *)(a1 + 72);
    v19 = MEMORY[0x24BDAC760];
    v20 = -1073741824;
    v21 = 0;
    v22 = __91__CPSTemplateInstance_pushGridTemplate_withProxyDelegate_animated_presentationStyle_reply___block_invoke_65;
    v23 = &unk_24E26FA58;
    v24 = v30;
    v26 = *(id *)(a1 + 64);
    v25 = *(id *)(a1 + 32);
    objc_msgSend(v4, "pushTemplateViewController:animated:presentationStyle:completion:", v1, v2 & 1, v3, &v19);

    objc_storeStrong(&v25, 0);
    objc_storeStrong(&v26, 0);
    objc_storeStrong((id *)&v24, 0);
    objc_storeStrong((id *)&v30, 0);
  }
}

uint64_t __91__CPSTemplateInstance_pushGridTemplate_withProxyDelegate_animated_presentationStyle_reply___block_invoke_65(uint64_t a1)
{
  id v1;
  id v3;

  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "templateProviderFuture");
  v1 = (id)objc_msgSend(v3, "addSuccessBlock:", *(_QWORD *)(a1 + 48));

  return objc_msgSend(*(id *)(a1 + 40), "_pushNowPlayingIfNeeded");
}

- (void)pushInformationTemplate:(id)a3 withProxyDelegate:(id)a4 animated:(id)a5 presentationStyle:(unint64_t)a6 reply:(id)a7
{
  NSObject *queue;
  NSObject *log;
  os_log_type_t type;
  uint64_t v14;
  int v15;
  int v16;
  void (*v17)(uint64_t);
  void *v18;
  CPSTemplateInstance *v19;
  id v20;
  id v21;
  id v22;
  id v23[2];
  int v24;
  uint8_t v25[15];
  char v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  id location[2];
  CPSTemplateInstance *v33;

  v33 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v31 = 0;
  objc_storeStrong(&v31, a4);
  v30 = 0;
  objc_storeStrong(&v30, a5);
  v29 = (void *)a6;
  v28 = 0;
  objc_storeStrong(&v28, a7);
  v27 = CarPlaySupportGeneralLogging();
  v26 = 2;
  if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_DEBUG))
  {
    log = v27;
    type = v26;
    __os_log_helper_16_0_0(v25);
    _os_log_debug_impl(&dword_21E389000, log, type, "Information Template requested", v25, 2u);
  }
  objc_storeStrong(&v27, 0);
  if (-[CPSTemplateInstance _templateIsValidForCurrentEntitlement:presentationStyle:](v33, "_templateIsValidForCurrentEntitlement:presentationStyle:", location[0], v29))
  {
    queue = MEMORY[0x24BDAC9B8];
    v14 = MEMORY[0x24BDAC760];
    v15 = -1073741824;
    v16 = 0;
    v17 = __98__CPSTemplateInstance_pushInformationTemplate_withProxyDelegate_animated_presentationStyle_reply___block_invoke;
    v18 = &unk_24E26FA80;
    v19 = v33;
    v20 = location[0];
    v21 = v31;
    v22 = v30;
    v23[1] = v29;
    v23[0] = v28;
    dispatch_async(queue, &v14);

    objc_storeStrong(v23, 0);
    objc_storeStrong(&v22, 0);
    objc_storeStrong(&v21, 0);
    objc_storeStrong(&v20, 0);
    objc_storeStrong((id *)&v19, 0);
    v24 = 0;
  }
  else
  {
    v24 = 1;
  }
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(location, 0);
}

void __98__CPSTemplateInstance_pushInformationTemplate_withProxyDelegate_animated_presentationStyle_reply___block_invoke(uint64_t a1)
{
  CPSInformationEntityViewController *v1;
  char v2;
  uint64_t v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  CPSInformationEntityViewController *v9;
  id v10;
  id v11;
  id v12;
  NSObject *log;
  os_log_type_t type;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  int v20;
  int v21;
  void (*v22)(uint64_t);
  void *v23;
  CPSInformationEntityViewController *v24;
  id v25;
  uint8_t v26[15];
  char v27;
  id v28;
  CPSInformationEntityViewController *v29;
  uint8_t v30[7];
  char v31;
  id location[3];

  location[2] = (id)a1;
  location[1] = (id)a1;
  v17 = (id)objc_msgSend(*(id *)(a1 + 32), "identifierToViewControllerDictionary");
  v16 = (id)objc_msgSend(*(id *)(a1 + 40), "identifier");
  v18 = (id)objc_msgSend(v17, "objectForKey:");

  if (v18)
  {
    location[0] = CarPlaySupportGeneralLogging();
    v31 = 2;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEBUG))
    {
      log = location[0];
      type = v31;
      __os_log_helper_16_0_0(v30);
      _os_log_debug_impl(&dword_21E389000, log, type, "already have a information view controller for this template", v30, 2u);
    }
    objc_storeStrong(location, 0);
  }
  else
  {
    v9 = [CPSInformationEntityViewController alloc];
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 48);
    v10 = (id)objc_msgSend(*(id *)(a1 + 32), "templateEnvironment");
    v29 = -[CPSBaseTemplateViewController initWithTemplate:templateDelegate:templateEnvironment:](v9, "initWithTemplate:templateDelegate:templateEnvironment:", v7, v8);

    -[CPSBaseTemplateViewController setViewControllerDelegate:](v29, "setViewControllerDelegate:", *(_QWORD *)(a1 + 32));
    v12 = (id)objc_msgSend(*(id *)(a1 + 32), "identifierToViewControllerDictionary");
    v11 = (id)objc_msgSend(*(id *)(a1 + 40), "identifier");
    objc_msgSend(v12, "setObject:forKey:", v29);

    v28 = CarPlaySupportGeneralLogging();
    v27 = 2;
    if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_DEBUG))
    {
      v5 = v28;
      v6 = v27;
      __os_log_helper_16_0_0(v26);
      _os_log_debug_impl(&dword_21E389000, v5, v6, "Pushing information template", v26, 2u);
    }
    objc_storeStrong(&v28, 0);
    v4 = (id)objc_msgSend(*(id *)(a1 + 32), "overlayViewController");
    v1 = v29;
    v2 = objc_msgSend(*(id *)(a1 + 56), "BOOLValue");
    v3 = *(_QWORD *)(a1 + 72);
    v19 = MEMORY[0x24BDAC760];
    v20 = -1073741824;
    v21 = 0;
    v22 = __98__CPSTemplateInstance_pushInformationTemplate_withProxyDelegate_animated_presentationStyle_reply___block_invoke_67;
    v23 = &unk_24E26FAA8;
    v24 = v29;
    v25 = *(id *)(a1 + 64);
    objc_msgSend(v4, "pushTemplateViewController:animated:presentationStyle:completion:", v1, v2 & 1, v3, &v19);

    objc_storeStrong(&v25, 0);
    objc_storeStrong((id *)&v24, 0);
    objc_storeStrong((id *)&v29, 0);
  }
}

void __98__CPSTemplateInstance_pushInformationTemplate_withProxyDelegate_animated_presentationStyle_reply___block_invoke_67(uint64_t a1)
{
  id v1;
  id v3;

  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "templateProviderFuture");
  v1 = (id)objc_msgSend(v3, "addSuccessBlock:", *(_QWORD *)(a1 + 40));

}

- (void)pushMapTemplate:(id)a3 withProxyDelegate:(id)a4 animated:(id)a5 presentationStyle:(unint64_t)a6 reply:(id)a7
{
  NSObject *queue;
  NSObject *log;
  os_log_type_t type;
  uint64_t v14;
  int v15;
  int v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;
  CPSTemplateInstance *v21;
  id v22;
  id v23[2];
  int v24;
  uint8_t v25[15];
  char v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  id location[2];
  CPSTemplateInstance *v33;

  v33 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v31 = 0;
  objc_storeStrong(&v31, a4);
  v30 = 0;
  objc_storeStrong(&v30, a5);
  v29 = (void *)a6;
  v28 = 0;
  objc_storeStrong(&v28, a7);
  v27 = CarPlaySupportGeneralLogging();
  v26 = 2;
  if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_DEBUG))
  {
    log = v27;
    type = v26;
    __os_log_helper_16_0_0(v25);
    _os_log_debug_impl(&dword_21E389000, log, type, "Map template requested", v25, 2u);
  }
  objc_storeStrong(&v27, 0);
  if (-[CPSTemplateInstance _templateIsValidForCurrentEntitlement:presentationStyle:](v33, "_templateIsValidForCurrentEntitlement:presentationStyle:", location[0], v29))
  {
    queue = MEMORY[0x24BDAC9B8];
    v14 = MEMORY[0x24BDAC760];
    v15 = -1073741824;
    v16 = 0;
    v17 = __90__CPSTemplateInstance_pushMapTemplate_withProxyDelegate_animated_presentationStyle_reply___block_invoke;
    v18 = &unk_24E26FA80;
    v19 = location[0];
    v20 = v31;
    v21 = v33;
    v22 = v30;
    v23[1] = v29;
    v23[0] = v28;
    dispatch_async(queue, &v14);

    objc_storeStrong(v23, 0);
    objc_storeStrong(&v22, 0);
    objc_storeStrong((id *)&v21, 0);
    objc_storeStrong(&v20, 0);
    objc_storeStrong(&v19, 0);
    v24 = 0;
  }
  else
  {
    v24 = 1;
  }
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(location, 0);
}

void __90__CPSTemplateInstance_pushMapTemplate_withProxyDelegate_animated_presentationStyle_reply___block_invoke(uint64_t a1)
{
  id v1;
  char v2;
  uint64_t v3;
  id v4;
  NSObject *log;
  os_log_type_t type;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  CPSMapTemplateViewController *v10;
  id v11;
  id v12;
  id v14;
  id v15;
  uint64_t v16;
  int v17;
  int v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  id v22;
  uint8_t v23[15];
  char v24;
  id location;
  id v26[3];

  v26[2] = (id)a1;
  v26[1] = (id)a1;
  v10 = [CPSMapTemplateViewController alloc];
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(void **)(a1 + 48);
  v12 = (id)objc_msgSend(v9, "applicationStateMonitor");
  v11 = (id)objc_msgSend(*(id *)(a1 + 48), "templateEnvironment");
  v26[0] = -[CPSMapTemplateViewController initWithMapTemplate:templateDelegate:safeAreaDelegate:applicationStateMonitor:templateEnvironment:](v10, "initWithMapTemplate:templateDelegate:safeAreaDelegate:applicationStateMonitor:templateEnvironment:", v7, v8, v9, v12);

  objc_msgSend(v26[0], "setViewControllerDelegate:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v26[0], "setNavigatorObserver:", *(_QWORD *)(a1 + 48));
  v15 = (id)objc_msgSend(*(id *)(a1 + 48), "identifierToViewControllerDictionary");
  v14 = (id)objc_msgSend(*(id *)(a1 + 32), "identifier");
  objc_msgSend(v15, "setObject:forKey:", v26[0]);

  location = CarPlaySupportGeneralLogging();
  v24 = 2;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
  {
    log = location;
    type = v24;
    __os_log_helper_16_0_0(v23);
    _os_log_debug_impl(&dword_21E389000, log, type, "Pushing map template", v23, 2u);
  }
  objc_storeStrong(&location, 0);
  v4 = (id)objc_msgSend(*(id *)(a1 + 48), "overlayViewController");
  v1 = v26[0];
  v2 = objc_msgSend(*(id *)(a1 + 56), "BOOLValue");
  v3 = *(_QWORD *)(a1 + 72);
  v16 = MEMORY[0x24BDAC760];
  v17 = -1073741824;
  v18 = 0;
  v19 = __90__CPSTemplateInstance_pushMapTemplate_withProxyDelegate_animated_presentationStyle_reply___block_invoke_69;
  v20 = &unk_24E26FAA8;
  v21 = v26[0];
  v22 = *(id *)(a1 + 64);
  objc_msgSend(v4, "pushTemplateViewController:animated:presentationStyle:completion:", v1, v2 & 1, v3, &v16);

  objc_msgSend(*(id *)(a1 + 48), "setRootViewController:", v26[0]);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(v26, 0);
}

void __90__CPSTemplateInstance_pushMapTemplate_withProxyDelegate_animated_presentationStyle_reply___block_invoke_69(uint64_t a1)
{
  id v1;
  id v3;

  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "templateProviderFuture");
  v1 = (id)objc_msgSend(v3, "addSuccessBlock:", *(_QWORD *)(a1 + 40));

}

- (void)requestNavigationProviderForMapTemplate:(id)a3 withReply:(id)a4
{
  NSObject *queue;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(uint64_t);
  void *v10;
  CPSTemplateInstance *v11;
  id v12;
  id v13;
  id v14;
  id location[2];
  CPSTemplateInstance *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  queue = MEMORY[0x24BDAC9B8];
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __73__CPSTemplateInstance_requestNavigationProviderForMapTemplate_withReply___block_invoke;
  v10 = &unk_24E26FAD0;
  v11 = v16;
  v12 = location[0];
  v13 = v14;
  dispatch_async(queue, &v6);

  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

void __73__CPSTemplateInstance_requestNavigationProviderForMapTemplate_withReply___block_invoke(uint64_t a1)
{
  id v1;
  id v2;
  id v4[3];

  v4[2] = (id)a1;
  v4[1] = (id)a1;
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "identifierToViewControllerDictionary");
  v1 = (id)objc_msgSend(*(id *)(a1 + 40), "identifier");
  v4[0] = (id)objc_msgSend(v2, "objectForKey:");

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_storeStrong(v4, 0);
}

- (void)pushListTemplate:(id)a3 withProxyDelegate:(id)a4 animated:(id)a5 presentationStyle:(unint64_t)a6 reply:(id)a7
{
  NSObject *queue;
  NSObject *log;
  os_log_type_t type;
  uint64_t v14;
  int v15;
  int v16;
  void (*v17)(uint64_t);
  void *v18;
  CPSTemplateInstance *v19;
  id v20;
  id v21;
  id v22;
  id v23[2];
  int v24;
  uint8_t v25[15];
  char v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  id location[2];
  CPSTemplateInstance *v33;

  v33 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v31 = 0;
  objc_storeStrong(&v31, a4);
  v30 = 0;
  objc_storeStrong(&v30, a5);
  v29 = (void *)a6;
  v28 = 0;
  objc_storeStrong(&v28, a7);
  v27 = CarPlaySupportGeneralLogging();
  v26 = 2;
  if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_DEBUG))
  {
    log = v27;
    type = v26;
    __os_log_helper_16_0_0(v25);
    _os_log_debug_impl(&dword_21E389000, log, type, "List template requested", v25, 2u);
  }
  objc_storeStrong(&v27, 0);
  if (-[CPSTemplateInstance _templateIsValidForCurrentEntitlement:presentationStyle:](v33, "_templateIsValidForCurrentEntitlement:presentationStyle:", location[0], v29))
  {
    queue = MEMORY[0x24BDAC9B8];
    v14 = MEMORY[0x24BDAC760];
    v15 = -1073741824;
    v16 = 0;
    v17 = __91__CPSTemplateInstance_pushListTemplate_withProxyDelegate_animated_presentationStyle_reply___block_invoke;
    v18 = &unk_24E26FA80;
    v19 = v33;
    v20 = location[0];
    v21 = v31;
    v22 = v30;
    v23[1] = v29;
    v23[0] = v28;
    dispatch_async(queue, &v14);

    objc_storeStrong(v23, 0);
    objc_storeStrong(&v22, 0);
    objc_storeStrong(&v21, 0);
    objc_storeStrong(&v20, 0);
    objc_storeStrong((id *)&v19, 0);
    v24 = 0;
  }
  else
  {
    v24 = 1;
  }
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(location, 0);
}

void __91__CPSTemplateInstance_pushListTemplate_withProxyDelegate_animated_presentationStyle_reply___block_invoke(uint64_t a1)
{
  CPSListTemplateViewController *v1;
  char v2;
  uint64_t v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  CPSListTemplateViewController *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  CPSListTemplateViewController *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *log;
  os_log_type_t type;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  int v23;
  int v24;
  uint64_t (*v25)(uint64_t);
  void *v26;
  CPSListTemplateViewController *v27;
  id v28;
  id v29;
  uint8_t v30[7];
  char v31;
  id v32;
  uint64_t v33;
  int v34;
  int v35;
  void (*v36)(uint64_t, char, id);
  void *v37;
  id v38;
  CPSListTemplateViewController *v39;
  uint8_t v40[7];
  char v41;
  id location[3];

  location[2] = (id)a1;
  location[1] = (id)a1;
  v20 = (id)objc_msgSend(*(id *)(a1 + 32), "identifierToViewControllerDictionary");
  v19 = (id)objc_msgSend(*(id *)(a1 + 40), "identifier");
  v21 = (id)objc_msgSend(v20, "objectForKey:");

  if (v21)
  {
    location[0] = CarPlaySupportGeneralLogging();
    v41 = 2;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEBUG))
    {
      log = location[0];
      type = v41;
      __os_log_helper_16_0_0(v40);
      _os_log_debug_impl(&dword_21E389000, log, type, "already have a list view controller for this template", v40, 2u);
    }
    objc_storeStrong(location, 0);
  }
  else
  {
    v11 = [CPSListTemplateViewController alloc];
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 48);
    v12 = (id)objc_msgSend(*(id *)(a1 + 32), "templateEnvironment");
    v39 = -[CPSListTemplateViewController initWithListTemplate:templateDelegate:templateEnvironment:](v11, "initWithListTemplate:templateDelegate:templateEnvironment:", v9, v10);

    -[CPSBaseTemplateViewController setViewControllerDelegate:](v39, "setViewControllerDelegate:", *(_QWORD *)(a1 + 32));
    v14 = (id)objc_msgSend(*(id *)(a1 + 32), "identifierToViewControllerDictionary");
    v13 = (id)objc_msgSend(*(id *)(a1 + 40), "identifier");
    objc_msgSend(v14, "setObject:forKey:", v39);

    v15 = (id)objc_msgSend(*(id *)(a1 + 40), "assistantCellConfiguration");
    if (v15)
    {
      v7 = v39;
      v8 = (id)objc_msgSend(*(id *)(a1 + 40), "assistantCellConfiguration");
      v33 = MEMORY[0x24BDAC760];
      v34 = -1073741824;
      v35 = 0;
      v36 = __91__CPSTemplateInstance_pushListTemplate_withProxyDelegate_animated_presentationStyle_reply___block_invoke_71;
      v37 = &unk_24E26FAF8;
      v38 = *(id *)(a1 + 32);
      -[CPSListTemplateViewController updateAssistantCellConfiguration:withCompletion:](v7, "updateAssistantCellConfiguration:withCompletion:", v8, &v33);

      objc_storeStrong(&v38, 0);
    }
    v32 = CarPlaySupportGeneralLogging();
    v31 = 2;
    if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_DEBUG))
    {
      v5 = v32;
      v6 = v31;
      __os_log_helper_16_0_0(v30);
      _os_log_debug_impl(&dword_21E389000, v5, v6, "Pushing list template", v30, 2u);
    }
    objc_storeStrong(&v32, 0);
    v4 = (id)objc_msgSend(*(id *)(a1 + 32), "overlayViewController");
    v1 = v39;
    v2 = objc_msgSend(*(id *)(a1 + 56), "BOOLValue");
    v3 = *(_QWORD *)(a1 + 72);
    v22 = MEMORY[0x24BDAC760];
    v23 = -1073741824;
    v24 = 0;
    v25 = __91__CPSTemplateInstance_pushListTemplate_withProxyDelegate_animated_presentationStyle_reply___block_invoke_73;
    v26 = &unk_24E26FA58;
    v27 = v39;
    v29 = *(id *)(a1 + 64);
    v28 = *(id *)(a1 + 32);
    objc_msgSend(v4, "pushTemplateViewController:animated:presentationStyle:completion:", v1, v2 & 1, v3, &v22);

    objc_storeStrong(&v28, 0);
    objc_storeStrong(&v29, 0);
    objc_storeStrong((id *)&v27, 0);
    objc_storeStrong((id *)&v39, 0);
  }
}

void __91__CPSTemplateInstance_pushListTemplate_withProxyDelegate_animated_presentationStyle_reply___block_invoke_71(uint64_t a1, char a2, id obj)
{
  id v3;
  id location;
  char v6;
  uint64_t v7;

  v7 = a1;
  v6 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  if ((v6 & 1) == 0)
  {
    v3 = (id)objc_msgSend(*(id *)(a1 + 32), "interfaceControllerRemoteObjectProxy");
    objc_msgSend(v3, "clientAssistantCellUnavailableWithError:", location);

  }
  objc_storeStrong(&location, 0);
}

uint64_t __91__CPSTemplateInstance_pushListTemplate_withProxyDelegate_animated_presentationStyle_reply___block_invoke_73(uint64_t a1)
{
  id v1;
  id v3;

  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "templateProviderFuture");
  v1 = (id)objc_msgSend(v3, "addSuccessBlock:", *(_QWORD *)(a1 + 48));

  return objc_msgSend(*(id *)(a1 + 40), "_pushNowPlayingIfNeeded");
}

- (void)pushNowPlayingTemplate:(id)a3 withProxyDelegate:(id)a4 animated:(id)a5 presentationStyle:(unint64_t)a6 reply:(id)a7
{
  NSObject *queue;
  NSObject *log;
  os_log_type_t type;
  uint64_t v14;
  int v15;
  int v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;
  CPSTemplateInstance *v21;
  id v22;
  id v23[2];
  int v24;
  uint8_t v25[15];
  char v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  id location[2];
  CPSTemplateInstance *v33;

  v33 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v31 = 0;
  objc_storeStrong(&v31, a4);
  v30 = 0;
  objc_storeStrong(&v30, a5);
  v29 = (void *)a6;
  v28 = 0;
  objc_storeStrong(&v28, a7);
  v27 = CarPlaySupportGeneralLogging();
  v26 = 2;
  if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_DEBUG))
  {
    log = v27;
    type = v26;
    __os_log_helper_16_0_0(v25);
    _os_log_debug_impl(&dword_21E389000, log, type, "Now Playing template requested", v25, 2u);
  }
  objc_storeStrong(&v27, 0);
  if (-[CPSTemplateInstance _templateIsValidForCurrentEntitlement:presentationStyle:](v33, "_templateIsValidForCurrentEntitlement:presentationStyle:", location[0], v29))
  {
    queue = MEMORY[0x24BDAC9B8];
    v14 = MEMORY[0x24BDAC760];
    v15 = -1073741824;
    v16 = 0;
    v17 = __97__CPSTemplateInstance_pushNowPlayingTemplate_withProxyDelegate_animated_presentationStyle_reply___block_invoke;
    v18 = &unk_24E26FA80;
    v19 = location[0];
    v20 = v31;
    v21 = v33;
    v23[1] = v29;
    v22 = v30;
    v23[0] = v28;
    dispatch_async(queue, &v14);

    objc_storeStrong(v23, 0);
    objc_storeStrong(&v22, 0);
    objc_storeStrong((id *)&v21, 0);
    objc_storeStrong(&v20, 0);
    objc_storeStrong(&v19, 0);
    v24 = 0;
  }
  else
  {
    v24 = 1;
  }
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(location, 0);
}

void __97__CPSTemplateInstance_pushNowPlayingTemplate_withProxyDelegate_animated_presentationStyle_reply___block_invoke(uint64_t a1)
{
  id v1;
  char v2;
  uint64_t v3;
  id v4;
  id v5;
  id v6;
  id v7;
  NSObject *log;
  os_log_type_t type;
  uint64_t v10;
  uint64_t v11;
  CPSNowPlayingViewController *v12;
  id v13;
  id v15;
  id v16;
  uint64_t v17;
  int v18;
  int v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  id v23;
  id v24;
  uint8_t v25[15];
  char v26;
  id location;
  id v28[3];

  v28[2] = (id)a1;
  v28[1] = (id)a1;
  v12 = [CPSNowPlayingViewController alloc];
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  v13 = (id)objc_msgSend(*(id *)(a1 + 48), "templateEnvironment");
  v28[0] = -[CPSNowPlayingViewController initWithNowPlayingTemplate:templateDelegate:environment:](v12, "initWithNowPlayingTemplate:templateDelegate:environment:", v10, v11);

  objc_msgSend(v28[0], "setViewControllerDelegate:", *(_QWORD *)(a1 + 48));
  v16 = (id)objc_msgSend(*(id *)(a1 + 48), "identifierToViewControllerDictionary");
  v15 = (id)objc_msgSend(*(id *)(a1 + 32), "identifier");
  objc_msgSend(v16, "setObject:forKey:", v28[0]);

  location = CarPlaySupportGeneralLogging();
  v26 = 2;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
  {
    log = location;
    type = v26;
    __os_log_helper_16_0_0(v25);
    _os_log_debug_impl(&dword_21E389000, log, type, "Pushing Now Playing View Controller", v25, 2u);
  }
  objc_storeStrong(&location, 0);
  if (!*(_QWORD *)(a1 + 72))
  {
    v5 = (id)objc_msgSend(*(id *)(a1 + 48), "overlayViewController");
    v24 = (id)objc_msgSend(v5, "topViewController");

    v7 = (id)objc_msgSend(v24, "navigationItem");
    v6 = CPSLocalizedStringForKey(CFSTR("NOW_PLAYING_BACK"));
    objc_msgSend(v7, "setBackButtonTitle:");

    objc_storeStrong(&v24, 0);
  }
  v4 = (id)objc_msgSend(*(id *)(a1 + 48), "overlayViewController");
  v1 = v28[0];
  v2 = objc_msgSend(*(id *)(a1 + 56), "BOOLValue");
  v3 = *(_QWORD *)(a1 + 72);
  v17 = MEMORY[0x24BDAC760];
  v18 = -1073741824;
  v19 = 0;
  v20 = __97__CPSTemplateInstance_pushNowPlayingTemplate_withProxyDelegate_animated_presentationStyle_reply___block_invoke_76;
  v21 = &unk_24E26FAA8;
  v22 = v28[0];
  v23 = *(id *)(a1 + 64);
  objc_msgSend(v4, "pushTemplateViewController:animated:presentationStyle:completion:", v1, v2 & 1, v3, &v17);

  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(v28, 0);
}

void __97__CPSTemplateInstance_pushNowPlayingTemplate_withProxyDelegate_animated_presentationStyle_reply___block_invoke_76(uint64_t a1)
{
  id v1;
  id v3;

  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "templateProviderFuture");
  v1 = (id)objc_msgSend(v3, "addSuccessBlock:", *(_QWORD *)(a1 + 40));

}

- (void)pushSearchTemplate:(id)a3 withProxyDelegate:(id)a4 animated:(id)a5 presentationStyle:(unint64_t)a6 reply:(id)a7
{
  NSObject *queue;
  NSObject *log;
  os_log_type_t type;
  uint64_t v14;
  int v15;
  int v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;
  CPSTemplateInstance *v21;
  id v22;
  id v23[2];
  int v24;
  uint8_t v25[15];
  char v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  id location[2];
  CPSTemplateInstance *v33;

  v33 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v31 = 0;
  objc_storeStrong(&v31, a4);
  v30 = 0;
  objc_storeStrong(&v30, a5);
  v29 = (void *)a6;
  v28 = 0;
  objc_storeStrong(&v28, a7);
  v27 = CarPlaySupportGeneralLogging();
  v26 = 2;
  if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_DEBUG))
  {
    log = v27;
    type = v26;
    __os_log_helper_16_0_0(v25);
    _os_log_debug_impl(&dword_21E389000, log, type, "Search template requested", v25, 2u);
  }
  objc_storeStrong(&v27, 0);
  if (-[CPSTemplateInstance _templateIsValidForCurrentEntitlement:presentationStyle:](v33, "_templateIsValidForCurrentEntitlement:presentationStyle:", location[0], v29))
  {
    queue = MEMORY[0x24BDAC9B8];
    v14 = MEMORY[0x24BDAC760];
    v15 = -1073741824;
    v16 = 0;
    v17 = __93__CPSTemplateInstance_pushSearchTemplate_withProxyDelegate_animated_presentationStyle_reply___block_invoke;
    v18 = &unk_24E26FA80;
    v19 = location[0];
    v20 = v31;
    v21 = v33;
    v22 = v30;
    v23[1] = v29;
    v23[0] = v28;
    dispatch_async(queue, &v14);

    objc_storeStrong(v23, 0);
    objc_storeStrong(&v22, 0);
    objc_storeStrong((id *)&v21, 0);
    objc_storeStrong(&v20, 0);
    objc_storeStrong(&v19, 0);
    v24 = 0;
  }
  else
  {
    v24 = 1;
  }
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(location, 0);
}

void __93__CPSTemplateInstance_pushSearchTemplate_withProxyDelegate_animated_presentationStyle_reply___block_invoke(uint64_t a1)
{
  CPSSearchTemplateViewController *v1;
  char v2;
  uint64_t v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  CPSSearchTemplateViewController *v9;
  id v10;
  id v11;
  id v12;
  CPSUtilities *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  void (*v19)(uint64_t);
  void *v20;
  CPSSearchTemplateViewController *v21;
  id v22;
  uint8_t v23[7];
  char v24;
  id v25;
  CPSSearchTemplateViewController *v26;
  os_log_type_t v27;
  id location;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t v32[24];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v31 = a1;
  v30 = a1;
  v14 = +[CPSUtilities sharedInstance](CPSUtilities, "sharedInstance");
  v15 = -[CPSUtilities lastButtonPressInteractionModel](v14, "lastButtonPressInteractionModel");

  v29 = v15;
  location = CarPlaySupportGeneralLogging();
  v27 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_0_1_8_0((uint64_t)v32, v29);
    _os_log_debug_impl(&dword_21E389000, (os_log_t)location, v27, "Requested search template with interaction model: %lu", v32, 0xCu);
  }
  objc_storeStrong(&location, 0);
  v9 = [CPSSearchTemplateViewController alloc];
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v10 = (id)objc_msgSend(*(id *)(a1 + 48), "templateEnvironment");
  v26 = -[CPSSearchTemplateViewController initWithSearchTemplate:templateDelegate:templateEnvironment:interactionModel:](v9, "initWithSearchTemplate:templateDelegate:templateEnvironment:interactionModel:", v7, v8);

  -[CPSSearchTemplateViewController setViewControllerDelegate:](v26, "setViewControllerDelegate:", *(_QWORD *)(a1 + 48));
  v12 = (id)objc_msgSend(*(id *)(a1 + 48), "identifierToViewControllerDictionary");
  v11 = (id)objc_msgSend(*(id *)(a1 + 32), "identifier");
  objc_msgSend(v12, "setObject:forKey:", v26);

  v25 = CarPlaySupportGeneralLogging();
  v24 = 2;
  if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_DEBUG))
  {
    v5 = v25;
    v6 = v24;
    __os_log_helper_16_0_0(v23);
    _os_log_debug_impl(&dword_21E389000, v5, v6, "Pushing search template", v23, 2u);
  }
  objc_storeStrong(&v25, 0);
  v4 = (id)objc_msgSend(*(id *)(a1 + 48), "overlayViewController");
  v1 = v26;
  v2 = objc_msgSend(*(id *)(a1 + 56), "BOOLValue");
  v3 = *(_QWORD *)(a1 + 72);
  v16 = MEMORY[0x24BDAC760];
  v17 = -1073741824;
  v18 = 0;
  v19 = __93__CPSTemplateInstance_pushSearchTemplate_withProxyDelegate_animated_presentationStyle_reply___block_invoke_79;
  v20 = &unk_24E26FAA8;
  v21 = v26;
  v22 = *(id *)(a1 + 64);
  objc_msgSend(v4, "pushTemplateViewController:animated:presentationStyle:completion:", v1, v2 & 1, v3, &v16);

  objc_storeStrong(&v22, 0);
  objc_storeStrong((id *)&v21, 0);
  objc_storeStrong((id *)&v26, 0);
}

void __93__CPSTemplateInstance_pushSearchTemplate_withProxyDelegate_animated_presentationStyle_reply___block_invoke_79(uint64_t a1)
{
  id v1;
  id v3;

  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "templateProviderFuture");
  v1 = (id)objc_msgSend(v3, "addSuccessBlock:", *(_QWORD *)(a1 + 40));

}

- (void)presentVoiceTemplate:(id)a3 withProxyDelegate:(id)a4 animated:(id)a5 reply:(id)a6
{
  NSObject *queue;
  NSObject *log;
  os_log_type_t type;
  uint64_t v12;
  int v13;
  int v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id v18;
  CPSTemplateInstance *v19;
  id v20;
  id v21;
  int v22;
  uint8_t v23[7];
  char v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id location[2];
  CPSTemplateInstance *v30;

  v30 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v28 = 0;
  objc_storeStrong(&v28, a4);
  v27 = 0;
  objc_storeStrong(&v27, a5);
  v26 = 0;
  objc_storeStrong(&v26, a6);
  v25 = CarPlaySupportGeneralLogging();
  v24 = 2;
  if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_DEBUG))
  {
    log = v25;
    type = v24;
    __os_log_helper_16_0_0(v23);
    _os_log_debug_impl(&dword_21E389000, log, type, "Voice template requested", v23, 2u);
  }
  objc_storeStrong(&v25, 0);
  if (-[CPSTemplateInstance _templateIsValidForCurrentEntitlement:presentationStyle:](v30, "_templateIsValidForCurrentEntitlement:presentationStyle:", location[0], 2))
  {
    queue = MEMORY[0x24BDAC9B8];
    v12 = MEMORY[0x24BDAC760];
    v13 = -1073741824;
    v14 = 0;
    v15 = __77__CPSTemplateInstance_presentVoiceTemplate_withProxyDelegate_animated_reply___block_invoke;
    v16 = &unk_24E26FA08;
    v17 = location[0];
    v18 = v28;
    v19 = v30;
    v20 = v27;
    v21 = v26;
    dispatch_async(queue, &v12);

    objc_storeStrong(&v21, 0);
    objc_storeStrong(&v20, 0);
    objc_storeStrong((id *)&v19, 0);
    objc_storeStrong(&v18, 0);
    objc_storeStrong(&v17, 0);
    v22 = 0;
  }
  else
  {
    v22 = 1;
  }
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(location, 0);
}

void __77__CPSTemplateInstance_presentVoiceTemplate_withProxyDelegate_animated_reply___block_invoke(uint64_t a1)
{
  id v1;
  char v2;
  id v3;
  NSObject *log;
  os_log_type_t type;
  uint64_t v6;
  uint64_t v7;
  CPSVoiceTemplateViewController *v8;
  id v9;
  id v11;
  id v12;
  uint64_t v13;
  int v14;
  int v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id v19;
  uint8_t v20[15];
  char v21;
  id location;
  id v23[3];

  v23[2] = (id)a1;
  v23[1] = (id)a1;
  v8 = [CPSVoiceTemplateViewController alloc];
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v9 = (id)objc_msgSend(*(id *)(a1 + 48), "templateEnvironment");
  v23[0] = -[CPSVoiceTemplateViewController initWithVoiceTemplate:templateDelegate:templateEnvironment:](v8, "initWithVoiceTemplate:templateDelegate:templateEnvironment:", v6, v7);

  objc_msgSend(v23[0], "setViewControllerDelegate:", *(_QWORD *)(a1 + 48));
  v12 = (id)objc_msgSend(*(id *)(a1 + 48), "identifierToViewControllerDictionary");
  v11 = (id)objc_msgSend(*(id *)(a1 + 32), "identifier");
  objc_msgSend(v12, "setObject:forKey:", v23[0]);

  location = CarPlaySupportGeneralLogging();
  v21 = 2;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
  {
    log = location;
    type = v21;
    __os_log_helper_16_0_0(v20);
    _os_log_debug_impl(&dword_21E389000, log, type, "Presenting voice template modally", v20, 2u);
  }
  objc_storeStrong(&location, 0);
  v3 = (id)objc_msgSend(*(id *)(a1 + 48), "overlayViewController");
  v1 = v23[0];
  v2 = objc_msgSend(*(id *)(a1 + 56), "BOOLValue");
  v13 = MEMORY[0x24BDAC760];
  v14 = -1073741824;
  v15 = 0;
  v16 = __77__CPSTemplateInstance_presentVoiceTemplate_withProxyDelegate_animated_reply___block_invoke_81;
  v17 = &unk_24E26FAA8;
  v18 = v23[0];
  v19 = *(id *)(a1 + 64);
  objc_msgSend(v3, "presentTemplateViewController:animated:completion:", v1, v2 & 1, &v13);

  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(v23, 0);
}

void __77__CPSTemplateInstance_presentVoiceTemplate_withProxyDelegate_animated_reply___block_invoke_81(uint64_t a1)
{
  id v1;
  id v3;

  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "templateProviderFuture");
  v1 = (id)objc_msgSend(v3, "addSuccessBlock:", *(_QWORD *)(a1 + 40));

}

- (void)setTabBarTemplate:(id)a3 withProxyDelegate:(id)a4 reply:(id)a5 animated:(id)a6
{
  id v6;
  NSObject *queue;
  NAFuture *v8;
  NSObject *log;
  os_log_type_t type;
  unint64_t v14;
  CPSTemplateEnvironment *v15;
  id v16;
  BOOL v17;
  uint64_t v18;
  int v19;
  int v20;
  void (*v21)(uint64_t);
  void *v22;
  CPSTemplateInstance *v23;
  id v24;
  id v25;
  id v26;
  uint8_t v27[15];
  char v28;
  id v29;
  int v30;
  id v31;
  id v32;
  id v33;
  id location[2];
  CPSTemplateInstance *v35;

  v35 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v33 = 0;
  objc_storeStrong(&v33, a4);
  v32 = 0;
  objc_storeStrong(&v32, a5);
  v31 = 0;
  objc_storeStrong(&v31, a6);
  v16 = (id)objc_msgSend(location[0], "templates");
  v14 = objc_msgSend(v16, "count");
  v15 = -[CPSTemplateInstance templateEnvironment](v35, "templateEnvironment");
  v17 = v14 <= -[CPSTemplateEnvironment maximumTabs](v15, "maximumTabs");

  if (v17)
  {
    v29 = CarPlaySupportGeneralLogging();
    v28 = 2;
    if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_DEBUG))
    {
      log = v29;
      type = v28;
      __os_log_helper_16_0_0(v27);
      _os_log_debug_impl(&dword_21E389000, log, type, "Presenting tab bar template, replacing root", v27, 2u);
    }
    objc_storeStrong(&v29, 0);
    queue = MEMORY[0x24BDAC9B8];
    v18 = MEMORY[0x24BDAC760];
    v19 = -1073741824;
    v20 = 0;
    v21 = __74__CPSTemplateInstance_setTabBarTemplate_withProxyDelegate_reply_animated___block_invoke;
    v22 = &unk_24E26FB20;
    v23 = v35;
    v24 = location[0];
    v25 = v33;
    v26 = v31;
    dispatch_sync(queue, &v18);

    v8 = -[CPSTabBarViewController templateProviderFuture](v35->_tabBarViewController, "templateProviderFuture");
    v6 = (id)-[NAFuture addSuccessBlock:](v8, "addSuccessBlock:", v32);

    objc_storeStrong(&v26, 0);
    objc_storeStrong(&v25, 0);
    objc_storeStrong(&v24, 0);
    objc_storeStrong((id *)&v23, 0);
    v30 = 0;
  }
  else
  {
    -[CPTemplateServiceClientInterface clientExceededTabBarTabLimit](v35->_interfaceControllerRemoteObjectProxy, "clientExceededTabBarTabLimit");
    v30 = 1;
  }
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(location, 0);
}

void __74__CPSTemplateInstance_setTabBarTemplate_withProxyDelegate_reply_animated___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  CPSTabBarViewController *v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v6 = [CPSTabBarViewController alloc];
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v7 = (id)objc_msgSend(*(id *)(a1 + 32), "templateEnvironment");
  v1 = -[CPSTabBarViewController initWithTabBarTemplate:templateDelegate:templateEnvironment:](v6, "initWithTabBarTemplate:templateDelegate:templateEnvironment:", v4, v5);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 232);
  *(_QWORD *)(v2 + 232) = v1;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "setViewControllerDelegate:", *(_QWORD *)(a1 + 32));
  v10 = (id)objc_msgSend(*(id *)(a1 + 32), "identifierToViewControllerDictionary");
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 232);
  v9 = (id)objc_msgSend(*(id *)(a1 + 40), "identifier");
  objc_msgSend(v10, "setObject:forKey:", v8);

  objc_msgSend(*(id *)(a1 + 32), "updateTabBarTemplate:", *(_QWORD *)(a1 + 40));
  v12 = (id)objc_msgSend(*(id *)(a1 + 32), "overlayViewController");
  v16[0] = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 232);
  v11 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
  objc_msgSend(v12, "setViewControllers:animated:", v11, objc_msgSend(*(id *)(a1 + 56), "BOOLValue") & 1);

  v13 = (id)objc_msgSend(*(id *)(a1 + 32), "overlayViewController");
  objc_msgSend(v13, "setNavigationBarHidden:animated:", 1, objc_msgSend(*(id *)(a1 + 56), "BOOLValue") & 1);

  objc_msgSend(*(id *)(a1 + 32), "setRootViewController:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 232));
  objc_msgSend(*(id *)(a1 + 32), "_pushNowPlayingIfNeeded");
  v15 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "templateProviderFuture");
  objc_msgSend(v15, "finishWithNoResult");

}

- (void)updateTabBarTemplate:(id)a3
{
  NSObject *queue;
  NSObject *log;
  os_log_type_t type;
  unint64_t v6;
  CPSTemplateEnvironment *v7;
  id v8;
  BOOL v9;
  uint64_t v10;
  int v11;
  int v12;
  void (*v13)(id *);
  void *v14;
  CPSTemplateInstance *v15;
  id v16;
  uint8_t v17[7];
  char v18;
  id v19;
  int v20;
  id location[2];
  CPSTemplateInstance *v22;

  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = (id)objc_msgSend(location[0], "templates");
  v6 = objc_msgSend(v8, "count");
  v7 = -[CPSTemplateInstance templateEnvironment](v22, "templateEnvironment");
  v9 = v6 <= -[CPSTemplateEnvironment maximumTabs](v7, "maximumTabs");

  if (v9)
  {
    v19 = CarPlaySupportGeneralLogging();
    v18 = 2;
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEBUG))
    {
      log = v19;
      type = v18;
      __os_log_helper_16_0_0(v17);
      _os_log_debug_impl(&dword_21E389000, log, type, "Updating tab bar template", v17, 2u);
    }
    objc_storeStrong(&v19, 0);
    queue = MEMORY[0x24BDAC9B8];
    v10 = MEMORY[0x24BDAC760];
    v11 = -1073741824;
    v12 = 0;
    v13 = __44__CPSTemplateInstance_updateTabBarTemplate___block_invoke;
    v14 = &unk_24E26EF28;
    v15 = v22;
    v16 = location[0];
    dispatch_async(queue, &v10);

    objc_storeStrong(&v16, 0);
    objc_storeStrong((id *)&v15, 0);
    v20 = 0;
  }
  else
  {
    -[CPTemplateServiceClientInterface clientExceededTabBarTabLimit](v22->_interfaceControllerRemoteObjectProxy, "clientExceededTabBarTabLimit");
    v20 = 1;
  }
  objc_storeStrong(location, 0);
}

void __44__CPSTemplateInstance_updateTabBarTemplate___block_invoke(id *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  id v16;
  NSObject *v17;
  os_log_type_t v18;
  id v19;
  id v20;
  id v21;
  BOOL v22;
  NSObject *v23;
  os_log_type_t v24;
  id v25;
  NSObject *v26;
  os_log_type_t v27;
  id v28;
  uint64_t v29;
  NSObject *log;
  void *v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  id v39;
  id obj;
  uint64_t v42;
  id v43;
  _QWORD v44[8];
  id v45;
  id v46;
  uint8_t v47[7];
  os_log_type_t v48;
  os_log_t v49;
  uint8_t v50[7];
  os_log_type_t v51;
  os_log_t v52;
  uint8_t v53[7];
  os_log_type_t v54;
  os_log_t v55;
  uint8_t v56[15];
  os_log_type_t v57;
  os_log_t v58;
  id v59;
  char v60;
  uint64_t v61;
  os_log_type_t type;
  os_log_t oslog;
  id location;
  _QWORD __b[8];
  id v66;
  id v67;
  id v68[3];
  _BYTE v69[128];
  uint8_t v70[24];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v68[2] = a1;
  v68[1] = a1;
  v39 = (id)objc_msgSend(a1[4], "tabBarViewController");
  v68[0] = (id)objc_msgSend(v39, "viewControllers");

  v67 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  memset(__b, 0, sizeof(__b));
  obj = (id)objc_msgSend(a1[5], "templates");
  v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v71, 16);
  if (v42)
  {
    v36 = *(_QWORD *)__b[2];
    v37 = 0;
    v38 = v42;
    while (1)
    {
      v35 = v37;
      if (*(_QWORD *)__b[2] != v36)
        objc_enumerationMutation(obj);
      v66 = *(id *)(__b[1] + 8 * v37);
      v31 = (void *)objc_opt_class();
      v34 = (id)objc_msgSend(a1[4], "identifierToViewControllerDictionary");
      v33 = (id)objc_msgSend(v66, "identifier");
      v32 = (id)objc_msgSend(v34, "objectForKey:");
      location = CPSSafeCast_4(v31, v32);

      if (location)
      {
        objc_msgSend(location, "_updateTemplate:", v66);
        objc_msgSend(v67, "addObject:", location);
      }
      else
      {
        oslog = (os_log_t)CarPlaySupportGeneralLogging();
        type = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
        {
          log = oslog;
          __os_log_helper_16_2_1_8_64((uint64_t)v70, (uint64_t)v66);
          _os_log_debug_impl(&dword_21E389000, log, type, "No view controller available for %@", v70, 0xCu);
        }
        objc_storeStrong((id *)&oslog, 0);
      }
      objc_storeStrong(&location, 0);
      ++v37;
      if (v35 + 1 >= v38)
      {
        v37 = 0;
        v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v71, 16);
        if (!v38)
          break;
      }
    }
  }

  v61 = 0;
  v28 = (id)objc_msgSend(a1[4], "tabBarViewController");
  v29 = objc_msgSend(v28, "selectedIndex");

  v61 = v29;
  v60 = 0;
  if (v29 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v59 = (id)objc_msgSend(v68[0], "objectAtIndexedSubscript:", v61);
    v60 = (objc_msgSend(v67, "containsObject:", v59) ^ 1) & 1;
    objc_storeStrong(&v59, 0);
  }
  if ((v60 & 1) != 0)
  {
    v58 = (os_log_t)CarPlaySupportGeneralLogging();
    v57 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      v26 = v58;
      v27 = v57;
      __os_log_helper_16_0_0(v56);
      _os_log_impl(&dword_21E389000, v26, v27, "Returning to root tab bar template for tab change.", v56, 2u);
    }
    objc_storeStrong((id *)&v58, 0);
    v25 = (id)objc_msgSend(a1[4], "overlayViewController");
    objc_msgSend(v25, "popToRootTemplateAnimated:completion:", 0, 0);

  }
  else
  {
    v55 = (os_log_t)CarPlaySupportGeneralLogging();
    v54 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      v23 = v55;
      v24 = v54;
      __os_log_helper_16_0_0(v53);
      _os_log_impl(&dword_21E389000, v23, v24, "Processing tab bar update without pop to root.", v53, 2u);
    }
    objc_storeStrong((id *)&v55, 0);
  }
  v19 = (id)objc_msgSend(a1[4], "tabBarViewController");
  objc_msgSend(v19, "setViewControllers:animated:", v67, 0);

  v21 = (id)objc_msgSend(a1[4], "overlayViewController");
  v20 = (id)objc_msgSend(v21, "viewControllers");
  v22 = (unint64_t)objc_msgSend(v20, "count") > 1;

  if (v22)
  {
    v49 = (os_log_t)CarPlaySupportGeneralLogging();
    v48 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v49;
      v15 = v48;
      __os_log_helper_16_0_0(v47);
      _os_log_impl(&dword_21E389000, v14, v15, "No navigation bar hide necessary.", v47, 2u);
    }
    objc_storeStrong((id *)&v49, 0);
  }
  else
  {
    v52 = (os_log_t)CarPlaySupportGeneralLogging();
    v51 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      v17 = v52;
      v18 = v51;
      __os_log_helper_16_0_0(v50);
      _os_log_impl(&dword_21E389000, v17, v18, "Hiding navigation bar for tab bar.", v50, 2u);
    }
    objc_storeStrong((id *)&v52, 0);
    v16 = (id)objc_msgSend(a1[4], "overlayViewController");
    objc_msgSend(v16, "setNavigationBarHidden:animated:", 1, 0);

  }
  v13 = (id)objc_msgSend(a1[4], "tabBarViewController");
  v46 = (id)objc_msgSend(v13, "selectedViewController");

  if (v46)
  {
    v12 = (id)objc_msgSend(a1[4], "tabBarViewController");
    v11 = (id)objc_msgSend(v12, "templateDelegate");
    v10 = (id)objc_msgSend(v46, "associatedTemplate");
    v9 = (id)objc_msgSend(v10, "identifier");
    objc_msgSend(v11, "handleActionForControlIdentifier:");

  }
  memset(v44, 0, sizeof(v44));
  v7 = v68[0];
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", v44, v69, 16);
  if (v8)
  {
    v4 = *(_QWORD *)v44[2];
    v5 = 0;
    v6 = v8;
    while (1)
    {
      v3 = v5;
      if (*(_QWORD *)v44[2] != v4)
        objc_enumerationMutation(v7);
      v45 = *(id *)(v44[1] + 8 * v5);
      v2 = (id)objc_msgSend(v45, "associatedTemplate");
      v43 = (id)objc_msgSend(v2, "identifier");

      if (v43 && (objc_msgSend(v67, "containsObject:", v45) & 1) == 0)
      {
        v1 = (id)objc_msgSend(a1[4], "identifierToViewControllerDictionary");
        objc_msgSend(v1, "removeObjectForKey:", v43);

      }
      objc_storeStrong(&v43, 0);
      ++v5;
      if (v3 + 1 >= v6)
      {
        v5 = 0;
        v6 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", v44, v69, 16);
        if (!v6)
          break;
      }
    }
  }

  objc_storeStrong(&v46, 0);
  objc_storeStrong(&v67, 0);
  objc_storeStrong(v68, 0);
}

- (void)selectTabBarTemplateAtIndex:(int64_t)a3
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9[2];
  void *v10;
  SEL v11;
  CPSTemplateInstance *v12;

  v12 = self;
  v11 = a2;
  v10 = (void *)a3;
  queue = MEMORY[0x24BDAC9B8];
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __51__CPSTemplateInstance_selectTabBarTemplateAtIndex___block_invoke;
  v8 = &unk_24E26FB48;
  v9[0] = v12;
  v9[1] = v10;
  dispatch_async(queue, &v4);

  objc_storeStrong(v9, 0);
}

void __51__CPSTemplateInstance_selectTabBarTemplateAtIndex___block_invoke(uint64_t a1)
{
  id v1;
  BOOL v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  unint64_t v12;
  BOOL v13;
  NSObject *log;
  os_log_type_t type;
  BOOL v17;
  id v18;
  id v19;
  os_log_type_t v20;
  id v21;
  char v22;
  id v23;
  char v24;
  id v25;
  uint8_t v26[7];
  os_log_type_t v27;
  id location[3];
  uint8_t v29[16];
  uint8_t v30[24];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  location[2] = (id)a1;
  location[1] = (id)a1;
  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "tabBarViewController");
  v17 = v1 != 0;

  if (v17)
  {
    v2 = *(uint64_t *)(a1 + 40) < 0;
    v24 = 0;
    v22 = 0;
    v13 = 0;
    if (!v2)
    {
      v12 = *(_QWORD *)(a1 + 40);
      v25 = (id)objc_msgSend(*(id *)(a1 + 32), "tabBarViewController");
      v24 = 1;
      v23 = (id)objc_msgSend(v25, "viewControllers");
      v22 = 1;
      v13 = v12 < objc_msgSend(v23, "count");
    }
    if ((v22 & 1) != 0)

    if ((v24 & 1) != 0)
    if (v13)
    {
      v21 = CarPlaySupportGeneralLogging();
      v20 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEFAULT))
      {
        v11 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 40));
        __os_log_helper_16_2_1_8_64((uint64_t)v30, (uint64_t)v11);
        _os_log_impl(&dword_21E389000, (os_log_t)v21, v20, "Selecting tab bar template at index %@", v30, 0xCu);

      }
      objc_storeStrong(&v21, 0);
      v8 = *(_QWORD *)(a1 + 40);
      v9 = (id)objc_msgSend(*(id *)(a1 + 32), "tabBarViewController");
      objc_msgSend(v9, "setSelectedIndex:", v8);

      v10 = (id)objc_msgSend(*(id *)(a1 + 32), "tabBarViewController");
      v19 = (id)objc_msgSend(v10, "selectedViewController");

      if (v19)
      {
        v7 = (id)objc_msgSend(*(id *)(a1 + 32), "tabBarViewController");
        v6 = (id)objc_msgSend(v7, "templateDelegate");
        v5 = (id)objc_msgSend(v19, "associatedTemplate");
        v4 = (id)objc_msgSend(v5, "identifier");
        objc_msgSend(v6, "handleActionForControlIdentifier:");

      }
      objc_storeStrong(&v19, 0);
    }
    else
    {
      v18 = CarPlaySupportGeneralLogging();
      if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEFAULT))
      {
        v3 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 40));
        __os_log_helper_16_2_1_8_64((uint64_t)v29, (uint64_t)v3);
        _os_log_impl(&dword_21E389000, (os_log_t)v18, OS_LOG_TYPE_DEFAULT, "Requested tab bar template index change, but no tab available at index %@", v29, 0xCu);

      }
      objc_storeStrong(&v18, 0);
    }
  }
  else
  {
    location[0] = CarPlaySupportGeneralLogging();
    v27 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
    {
      log = location[0];
      type = v27;
      __os_log_helper_16_0_0(v26);
      _os_log_impl(&dword_21E389000, log, type, "Requested tab bar template index change, but no tab bar template has been set.", v26, 2u);
    }
    objc_storeStrong(location, 0);
  }
}

- (void)pushEntityTemplate:(id)a3 withProxyDelegate:(id)a4 animated:(id)a5 presentationStyle:(unint64_t)a6 reply:(id)a7
{
  NSObject *queue;
  NSObject *log;
  os_log_type_t type;
  uint64_t v14;
  int v15;
  int v16;
  void (*v17)(uint64_t);
  void *v18;
  CPSTemplateInstance *v19;
  id v20;
  id v21;
  id v22;
  id v23[2];
  int v24;
  uint8_t v25[15];
  char v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  id location[2];
  CPSTemplateInstance *v33;

  v33 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v31 = 0;
  objc_storeStrong(&v31, a4);
  v30 = 0;
  objc_storeStrong(&v30, a5);
  v29 = (void *)a6;
  v28 = 0;
  objc_storeStrong(&v28, a7);
  v27 = CarPlaySupportGeneralLogging();
  v26 = 2;
  if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_DEBUG))
  {
    log = v27;
    type = v26;
    __os_log_helper_16_0_0(v25);
    _os_log_debug_impl(&dword_21E389000, log, type, "Entity template requested", v25, 2u);
  }
  objc_storeStrong(&v27, 0);
  if (-[CPSTemplateInstance _templateIsValidForCurrentEntitlement:presentationStyle:](v33, "_templateIsValidForCurrentEntitlement:presentationStyle:", location[0], v29))
  {
    queue = MEMORY[0x24BDAC9B8];
    v14 = MEMORY[0x24BDAC760];
    v15 = -1073741824;
    v16 = 0;
    v17 = __93__CPSTemplateInstance_pushEntityTemplate_withProxyDelegate_animated_presentationStyle_reply___block_invoke;
    v18 = &unk_24E26FA80;
    v19 = v33;
    v20 = location[0];
    v21 = v31;
    v22 = v30;
    v23[1] = v29;
    v23[0] = v28;
    dispatch_async(queue, &v14);

    objc_storeStrong(v23, 0);
    objc_storeStrong(&v22, 0);
    objc_storeStrong(&v21, 0);
    objc_storeStrong(&v20, 0);
    objc_storeStrong((id *)&v19, 0);
    v24 = 0;
  }
  else
  {
    v24 = 1;
  }
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(location, 0);
}

void __93__CPSTemplateInstance_pushEntityTemplate_withProxyDelegate_animated_presentationStyle_reply___block_invoke(uint64_t a1)
{
  CPSEntityViewController *v1;
  char v2;
  uint64_t v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  CPSEntityViewController *v8;
  id v9;
  id v10;
  id v11;
  NSObject *log;
  os_log_type_t type;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  int v19;
  int v20;
  void (*v21)(uint64_t);
  void *v22;
  CPSEntityViewController *v23;
  id v24;
  os_log_type_t v25;
  id v26;
  CPSEntityViewController *v27;
  uint8_t v28[7];
  char v29;
  id location[3];
  uint8_t v31[24];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  location[2] = (id)a1;
  location[1] = (id)a1;
  v16 = (id)objc_msgSend(*(id *)(a1 + 32), "identifierToViewControllerDictionary");
  v15 = (id)objc_msgSend(*(id *)(a1 + 40), "identifier");
  v17 = (id)objc_msgSend(v16, "objectForKey:");

  if (v17)
  {
    location[0] = CarPlaySupportGeneralLogging();
    v29 = 2;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEBUG))
    {
      log = location[0];
      type = v29;
      __os_log_helper_16_0_0(v28);
      _os_log_debug_impl(&dword_21E389000, log, type, "already have an entity view controller for this template", v28, 2u);
    }
    objc_storeStrong(location, 0);
  }
  else
  {
    v8 = [CPSEntityViewController alloc];
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v9 = (id)objc_msgSend(*(id *)(a1 + 32), "templateEnvironment");
    v27 = -[CPSEntityViewController initWithEntityTemplate:templateDelegate:templateEnvironment:](v8, "initWithEntityTemplate:templateDelegate:templateEnvironment:", v6, v7);

    -[CPSBaseTemplateViewController setViewControllerDelegate:](v27, "setViewControllerDelegate:", *(_QWORD *)(a1 + 32));
    v11 = (id)objc_msgSend(*(id *)(a1 + 32), "identifierToViewControllerDictionary");
    v10 = (id)objc_msgSend(*(id *)(a1 + 40), "identifier");
    objc_msgSend(v11, "setObject:forKey:", v27);

    v26 = CarPlaySupportGeneralLogging();
    v25 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_DEBUG))
    {
      v5 = (id)objc_msgSend(*(id *)(a1 + 40), "entity");
      __os_log_helper_16_2_1_8_64((uint64_t)v31, (uint64_t)v5);
      _os_log_debug_impl(&dword_21E389000, (os_log_t)v26, v25, "Pushing Entity View Controller: %@", v31, 0xCu);

    }
    objc_storeStrong(&v26, 0);
    v4 = (id)objc_msgSend(*(id *)(a1 + 32), "overlayViewController");
    v1 = v27;
    v2 = objc_msgSend(*(id *)(a1 + 56), "BOOLValue");
    v3 = *(_QWORD *)(a1 + 72);
    v18 = MEMORY[0x24BDAC760];
    v19 = -1073741824;
    v20 = 0;
    v21 = __93__CPSTemplateInstance_pushEntityTemplate_withProxyDelegate_animated_presentationStyle_reply___block_invoke_88;
    v22 = &unk_24E26FAA8;
    v23 = v27;
    v24 = *(id *)(a1 + 64);
    objc_msgSend(v4, "pushTemplateViewController:animated:presentationStyle:completion:", v1, v2 & 1, v3, &v18);

    objc_storeStrong(&v24, 0);
    objc_storeStrong((id *)&v23, 0);
    objc_storeStrong((id *)&v27, 0);
  }
}

void __93__CPSTemplateInstance_pushEntityTemplate_withProxyDelegate_animated_presentationStyle_reply___block_invoke_88(uint64_t a1)
{
  id v1;
  id v3;

  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "templateProviderFuture");
  v1 = (id)objc_msgSend(v3, "addSuccessBlock:", *(_QWORD *)(a1 + 40));

}

- (void)containsTemplate:(id)a3 reply:(id)a4
{
  NSObject *queue;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(uint64_t);
  void *v10;
  CPSTemplateInstance *v11;
  id v12[2];
  uint64_t v13;
  uint64_t *v14;
  int v15;
  int v16;
  char v17;
  id v18;
  id location[2];
  CPSTemplateInstance *v20;

  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18 = 0;
  objc_storeStrong(&v18, a4);
  v13 = 0;
  v14 = &v13;
  v15 = 0x20000000;
  v16 = 32;
  v17 = 0;
  queue = MEMORY[0x24BDAC9B8];
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __46__CPSTemplateInstance_containsTemplate_reply___block_invoke;
  v10 = &unk_24E26FB70;
  v12[1] = &v13;
  v11 = v20;
  v12[0] = location[0];
  dispatch_sync(queue, &v6);

  (*((void (**)(id, uint64_t))v18 + 2))(v18, v14[3] & 1);
  objc_storeStrong(v12, 0);
  objc_storeStrong((id *)&v11, 0);
  _Block_object_dispose(&v13, 8);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
}

void __46__CPSTemplateInstance_containsTemplate_reply___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "overlayViewController");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "indexOfTemplate:", *(_QWORD *)(a1 + 40)) != 0x7FFFFFFFFFFFFFFFLL;

}

- (void)popToTemplate:(id)a3 animated:(id)a4 reply:(id)a5
{
  NSObject *queue;
  uint64_t v8;
  int v9;
  int v10;
  void (*v11)(uint64_t);
  void *v12;
  CPSTemplateInstance *v13;
  id v14;
  id v15;
  id v16;
  os_log_type_t v17;
  id v18;
  id v19;
  id v20;
  id location[2];
  CPSTemplateInstance *v22;
  uint8_t v23[24];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v20 = 0;
  objc_storeStrong(&v20, a4);
  v19 = 0;
  objc_storeStrong(&v19, a5);
  v18 = CarPlaySupportGeneralLogging();
  v17 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v23, (uint64_t)location[0], (uint64_t)v20);
    _os_log_impl(&dword_21E389000, (os_log_t)v18, v17, "Popping to template: %@ animated: %@", v23, 0x16u);
  }
  objc_storeStrong(&v18, 0);
  queue = MEMORY[0x24BDAC9B8];
  v8 = MEMORY[0x24BDAC760];
  v9 = -1073741824;
  v10 = 0;
  v11 = __52__CPSTemplateInstance_popToTemplate_animated_reply___block_invoke;
  v12 = &unk_24E26F9E0;
  v13 = v22;
  v14 = location[0];
  v15 = v20;
  v16 = v19;
  dispatch_async(queue, &v8);

  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong((id *)&v13, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
}

void __52__CPSTemplateInstance_popToTemplate_animated_reply___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "overlayViewController");
  objc_msgSend(v2, "popToTemplate:animated:completion:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "BOOLValue") & 1, *(_QWORD *)(a1 + 56));

}

- (void)popToRootTemplateAnimated:(id)a3 reply:(id)a4
{
  NSObject *queue;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(uint64_t);
  void *v10;
  CPSTemplateInstance *v11;
  id v12;
  id v13;
  os_log_type_t v14;
  id v15;
  id v16;
  id location[2];
  CPSTemplateInstance *v18;
  uint8_t v19[24];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = 0;
  objc_storeStrong(&v16, a4);
  v15 = CarPlaySupportGeneralLogging();
  v14 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v19, (uint64_t)location[0]);
    _os_log_impl(&dword_21E389000, (os_log_t)v15, v14, "Popping to root template animated: %@", v19, 0xCu);
  }
  objc_storeStrong(&v15, 0);
  queue = MEMORY[0x24BDAC9B8];
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __55__CPSTemplateInstance_popToRootTemplateAnimated_reply___block_invoke;
  v10 = &unk_24E26FAD0;
  v11 = v18;
  v12 = location[0];
  v13 = v16;
  dispatch_async(queue, &v6);

  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

void __55__CPSTemplateInstance_popToRootTemplateAnimated_reply___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "overlayViewController");
  objc_msgSend(v2, "popToRootTemplateAnimated:completion:", objc_msgSend(*(id *)(a1 + 40), "BOOLValue") & 1, *(_QWORD *)(a1 + 48));

}

- (void)popTemplateAnimated:(id)a3 reply:(id)a4
{
  NSObject *queue;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(uint64_t);
  void *v10;
  CPSTemplateInstance *v11;
  id v12;
  id v13;
  os_log_type_t v14;
  id v15;
  id v16;
  id location[2];
  CPSTemplateInstance *v18;
  uint8_t v19[24];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = 0;
  objc_storeStrong(&v16, a4);
  v15 = CarPlaySupportGeneralLogging();
  v14 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v19, (uint64_t)location[0]);
    _os_log_impl(&dword_21E389000, (os_log_t)v15, v14, "Popping a template animated: %@", v19, 0xCu);
  }
  objc_storeStrong(&v15, 0);
  queue = MEMORY[0x24BDAC9B8];
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __49__CPSTemplateInstance_popTemplateAnimated_reply___block_invoke;
  v10 = &unk_24E26FAD0;
  v11 = v18;
  v12 = location[0];
  v13 = v16;
  dispatch_async(queue, &v6);

  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

void __49__CPSTemplateInstance_popTemplateAnimated_reply___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "overlayViewController");
  objc_msgSend(v2, "popTemplateAnimated:completion:", objc_msgSend(*(id *)(a1 + 40), "BOOLValue") & 1, *(_QWORD *)(a1 + 48));

}

- (void)clientRequestNowPlayingTemplateAnimated:(BOOL)a3
{
  id v3;
  CPTemplateServiceClientInterface *v4;
  id v5;
  id v6;
  NSObject *log;
  os_log_type_t type;
  os_log_t oslog;
  os_log_type_t v10;
  id v11;
  os_log_type_t v12;
  id v13;
  uint8_t v14[7];
  os_log_type_t v15;
  id location;
  id v17;
  BOOL v18;
  SEL v19;
  CPSTemplateInstance *v20;
  uint8_t v21[16];
  uint8_t v22[16];
  uint8_t v23[24];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v20 = self;
  v19 = a2;
  v18 = a3;
  v17 = -[CPSTemplateInstance templateEnvironment](self, "templateEnvironment");
  if (v17)
  {
    if ((objc_msgSend(v17, "canBecomeNowPlayingApp") & 1) != 0)
    {
      if ((objc_msgSend(v17, "isNowPlayingApp") & 1) != 0)
      {
        v11 = CarPlaySupportGeneralLogging();
        v10 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
        {
          v5 = (id)objc_msgSend(v17, "bundleIdentifier");
          __os_log_helper_16_2_1_8_66((uint64_t)v22, (uint64_t)v5);
          _os_log_impl(&dword_21E389000, (os_log_t)v11, v10, "Requesting now playing template from client app %{public}@", v22, 0xCu);

        }
        objc_storeStrong(&v11, 0);
        v4 = -[CPSTemplateInstance interfaceControllerRemoteObjectProxy](v20, "interfaceControllerRemoteObjectProxy");
        -[CPTemplateServiceClientInterface clientPushNowPlayingTemplateAnimated:](v4, "clientPushNowPlayingTemplateAnimated:", v18);

      }
      else
      {
        oslog = (os_log_t)CarPlaySupportGeneralLogging();
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          v3 = (id)objc_msgSend(v17, "bundleIdentifier");
          __os_log_helper_16_2_1_8_66((uint64_t)v21, (uint64_t)v3);
          _os_log_impl(&dword_21E389000, oslog, OS_LOG_TYPE_DEFAULT, "Client app %{public}@ is not now playing; not requesting now playing",
            v21,
            0xCu);

        }
        objc_storeStrong((id *)&oslog, 0);
      }
    }
    else
    {
      v13 = CarPlaySupportGeneralLogging();
      v12 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
      {
        v6 = (id)objc_msgSend(v17, "bundleIdentifier");
        __os_log_helper_16_2_1_8_66((uint64_t)v23, (uint64_t)v6);
        _os_log_impl(&dword_21E389000, (os_log_t)v13, v12, "Client app %{public}@ cannot become now playing; not requesting now playing",
          v23,
          0xCu);

      }
      objc_storeStrong(&v13, 0);
    }
  }
  else
  {
    v20->_pendingLaunchToNowPlaying = 1;
    location = CarPlaySupportGeneralLogging();
    v15 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
    {
      log = location;
      type = v15;
      __os_log_helper_16_0_0(v14);
      _os_log_impl(&dword_21E389000, log, type, "Pending launch to now playing template.", v14, 2u);
    }
    objc_storeStrong(&location, 0);
  }
  objc_storeStrong(&v17, 0);
}

- (void)dismissTemplateAnimated:(id)a3 reply:(id)a4
{
  NSObject *queue;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(id *);
  void *v10;
  CPSTemplateInstance *v11;
  id v12;
  id v13;
  os_log_type_t v14;
  id v15;
  id v16;
  id location[2];
  CPSTemplateInstance *v18;
  uint8_t v19[24];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = 0;
  objc_storeStrong(&v16, a4);
  v15 = CarPlaySupportGeneralLogging();
  v14 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v19, (uint64_t)location[0]);
    _os_log_impl(&dword_21E389000, (os_log_t)v15, v14, "Dismissing template animated: %@", v19, 0xCu);
  }
  objc_storeStrong(&v15, 0);
  queue = MEMORY[0x24BDAC9B8];
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __53__CPSTemplateInstance_dismissTemplateAnimated_reply___block_invoke;
  v10 = &unk_24E26FAD0;
  v11 = v18;
  v12 = location[0];
  v13 = v16;
  dispatch_async(queue, &v6);

  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

void __53__CPSTemplateInstance_dismissTemplateAnimated_reply___block_invoke(id *a1)
{
  id v1;
  id v2;
  id v3;
  id v4;
  char v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v11;
  id v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21[3];

  v21[2] = a1;
  v21[1] = a1;
  v21[0] = 0;
  v11 = (id)objc_msgSend(a1[4], "overlayViewController");
  v12 = (id)objc_msgSend(v11, "presentedTemplateViewController");

  if (v12)
  {
    v9 = (id)objc_msgSend(a1[4], "overlayViewController");
    v8 = (id)objc_msgSend(v9, "presentedTemplateViewController");
    v7 = (id)objc_msgSend(v8, "associatedTemplate");
    v1 = (id)objc_msgSend(v7, "identifier");
    v2 = v21[0];
    v21[0] = v1;

  }
  else
  {
    v3 = (id)objc_msgSend(a1[4], "actionSheetIdentifier");
    v4 = v21[0];
    v21[0] = v3;

  }
  v6 = (id)objc_msgSend(a1[4], "overlayViewController");
  v5 = objc_msgSend(a1[5], "BOOLValue");
  v13 = MEMORY[0x24BDAC760];
  v14 = -1073741824;
  v15 = 0;
  v16 = __53__CPSTemplateInstance_dismissTemplateAnimated_reply___block_invoke_2;
  v17 = &unk_24E26FAD0;
  v18 = a1[4];
  v19 = v21[0];
  v20 = a1[6];
  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", v5 & 1, &v13);

  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(v21, 0);
}

uint64_t __53__CPSTemplateInstance_dismissTemplateAnimated_reply___block_invoke_2(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "interfaceControllerRemoteObjectProxy");
  objc_msgSend(v2, "templateIdentifierDidDismiss:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "setActionSheetIdentifier:", 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)getTopTemplateWithReply:(id)a3
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  CPSTemplateInstance *v9;
  id v10;
  id location[2];
  CPSTemplateInstance *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = MEMORY[0x24BDAC9B8];
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __47__CPSTemplateInstance_getTopTemplateWithReply___block_invoke;
  v8 = &unk_24E26FAA8;
  v9 = v12;
  v10 = location[0];
  dispatch_async(queue, &v4);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

void __47__CPSTemplateInstance_getTopTemplateWithReply___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v3;
  id v4;
  id v5[3];

  v5[2] = (id)a1;
  v5[1] = (id)a1;
  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "overlayViewController");
  v5[0] = (id)objc_msgSend(v1, "topTemplate");

  v3 = *(_QWORD *)(a1 + 40);
  v4 = (id)objc_msgSend(v5[0], "identifier");
  (*(void (**)(void))(v3 + 16))();

  objc_storeStrong(v5, 0);
}

- (void)getTemplatesWithReply:(id)a3
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  CPSTemplateInstance *v9;
  id v10;
  id location[2];
  CPSTemplateInstance *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = MEMORY[0x24BDAC9B8];
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __45__CPSTemplateInstance_getTemplatesWithReply___block_invoke;
  v8 = &unk_24E26FAA8;
  v9 = v12;
  v10 = location[0];
  dispatch_async(queue, &v4);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

void __45__CPSTemplateInstance_getTemplatesWithReply___block_invoke(uint64_t a1)
{
  id v1;
  id v3;
  id v4[3];

  v4[2] = (id)a1;
  v4[1] = (id)a1;
  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "overlayViewController");
  v4[0] = (id)objc_msgSend(v1, "templates");

  v3 = (id)objc_msgSend(v4[0], "cps_map:", &__block_literal_global_4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_storeStrong(&v3, 0);
  objc_storeStrong(v4, 0);
}

id __45__CPSTemplateInstance_getTemplatesWithReply___block_invoke_2(void *a1, void *a2)
{
  id v3;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v3 = (id)objc_msgSend(location[0], "identifier");
  objc_storeStrong(location, 0);
  return v3;
}

- (void)getPresentedTemplateWithReply:(id)a3
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  CPSTemplateInstance *v9;
  id v10;
  id location[2];
  CPSTemplateInstance *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = MEMORY[0x24BDAC9B8];
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __53__CPSTemplateInstance_getPresentedTemplateWithReply___block_invoke;
  v8 = &unk_24E26FAA8;
  v9 = v12;
  v10 = location[0];
  dispatch_async(queue, &v4);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

void __53__CPSTemplateInstance_getPresentedTemplateWithReply___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  id v3;
  id v4;
  id v6;
  id v7[3];

  v7[2] = (id)a1;
  v7[1] = (id)a1;
  v1 = (void *)objc_opt_class();
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "overlayViewController");
  v2 = (id)objc_msgSend(v3, "presentedTemplateViewController");
  v7[0] = CPSSafeCast_4(v1, v2);

  v4 = (id)objc_msgSend(v7[0], "associatedTemplate");
  v6 = (id)objc_msgSend(v4, "identifier");

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_storeStrong(&v6, 0);
  objc_storeStrong(v7, 0);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  CPSTemplateEnvironment *v4;
  CPSTemplateEnvironment *v5;
  NSObject *queue;
  CPSTemplateEnvironment *v8;
  BOOL v9;
  NSObject *log;
  os_log_type_t type;
  uint64_t v13;
  int v14;
  int v15;
  void (*v16)(id *);
  void *v17;
  CPSTemplateInstance *v18;
  id v19;
  id v20;
  int v21;
  uint8_t v22[15];
  char v23;
  id v24;
  id v25;
  id location[2];
  CPSTemplateInstance *v27;
  char v28;

  v27 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v25 = 0;
  objc_storeStrong(&v25, a4);
  v24 = CarPlaySupportGeneralLogging();
  v23 = 2;
  if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_DEBUG))
  {
    log = v24;
    type = v23;
    __os_log_helper_16_0_0(v22);
    _os_log_debug_impl(&dword_21E389000, log, type, "Template Instance new connection", v22, 2u);
  }
  objc_storeStrong(&v24, 0);
  v4 = -[CPSTemplateInstance templateEnvironment](v27, "templateEnvironment");
  v9 = v4 != 0;

  if (!v9)
  {
    v5 = [CPSTemplateEnvironment alloc];
    v8 = -[CPSTemplateEnvironment initWithConnection:templateProvider:](v5, "initWithConnection:templateProvider:", v25, v27);
    -[CPSTemplateInstance setTemplateEnvironment:](v27, "setTemplateEnvironment:");

  }
  if (location[0] == v27->_interfaceControllerListener)
  {
    v28 = -[CPSTemplateInstance _handleAppViewConnection:](v27, "_handleAppViewConnection:", v25);
    v21 = 1;
  }
  else if (location[0] == v27->_dashboardControllerListener)
  {
    v28 = -[CPSTemplateInstance _handleDashboardConnection:](v27, "_handleDashboardConnection:", v25);
    v21 = 1;
  }
  else if (location[0] == v27->_instrumentClusterControllerListener)
  {
    objc_initWeak(&v20, v27);
    queue = MEMORY[0x24BDAC9B8];
    v13 = MEMORY[0x24BDAC760];
    v14 = -1073741824;
    v15 = 0;
    v16 = __58__CPSTemplateInstance_listener_shouldAcceptNewConnection___block_invoke;
    v17 = &unk_24E26FBD8;
    v18 = v27;
    objc_copyWeak(&v19, &v20);
    dispatch_async(queue, &v13);

    v28 = -[CPSTemplateInstance _handleInstrumentClusterConnection:](v27, "_handleInstrumentClusterConnection:", v25);
    v21 = 1;
    objc_destroyWeak(&v19);
    objc_storeStrong((id *)&v18, 0);
    objc_destroyWeak(&v20);
  }
  else
  {
    v28 = 0;
    v21 = 1;
  }
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
  return v28 & 1;
}

void __58__CPSTemplateInstance_listener_shouldAcceptNewConnection___block_invoke(id *a1)
{
  id v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  char v20;
  id v21;
  id v22;
  id v23;
  id v24;
  char v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id obj;
  uint64_t v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  BOOL v38;
  CPSInstrumentClusterCardViewController *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  BOOL v46;
  _QWORD __b[8];
  id v48;
  char v49;
  char v50;
  id WeakRetained;
  os_log_type_t v52;
  id v53;
  os_log_type_t v54;
  id location[3];
  _BYTE v56[128];
  uint8_t v57[16];
  uint8_t v58[24];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  location[2] = a1;
  location[1] = a1;
  v1 = (id)objc_msgSend(a1[4], "instrumentClusterCardViewController");
  v46 = v1 != 0;

  if (!v46)
  {
    location[0] = CarPlaySupportGeneralLogging();
    v54 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEBUG))
    {
      v44 = (id)objc_msgSend(a1[4], "templateEnvironment");
      v43 = (id)objc_msgSend(v44, "bundleIdentifier");
      __os_log_helper_16_2_1_8_64((uint64_t)v58, (uint64_t)v43);
      _os_log_debug_impl(&dword_21E389000, (os_log_t)location[0], v54, "Creating _instrumentClusterCardViewController for %@", v58, 0xCu);

    }
    objc_storeStrong(location, 0);
    v39 = objc_alloc_init(CPSInstrumentClusterCardViewController);
    objc_msgSend(a1[4], "setInstrumentClusterCardViewController:");

    v40 = (id)objc_msgSend(a1[4], "instrumentClusterCardViewController");
    objc_msgSend(v40, "setSafeAreaDelegate:", a1[4]);

    v42 = (id)objc_msgSend(a1[4], "navigator");
    v41 = (id)objc_msgSend(a1[4], "instrumentClusterCardViewController");
    objc_msgSend(v42, "addDisplayDelegate:");

  }
  v2 = (id)objc_msgSend(a1[4], "instrumentClusterMapETAViewController");
  v38 = v2 != 0;

  if (!v38)
  {
    v53 = CarPlaySupportGeneralLogging();
    v52 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)v53, OS_LOG_TYPE_DEBUG))
    {
      v37 = (id)objc_msgSend(a1[4], "templateEnvironment");
      v36 = (id)objc_msgSend(v37, "bundleIdentifier");
      __os_log_helper_16_2_1_8_64((uint64_t)v57, (uint64_t)v36);
      _os_log_debug_impl(&dword_21E389000, (os_log_t)v53, v52, "Creating _instrumentClusterMapETAViewController for %@", v57, 0xCu);

    }
    objc_storeStrong(&v53, 0);
    v32 = -[CPSInstrumentClusterCardViewController initForMapContent]([CPSInstrumentClusterCardViewController alloc], "initForMapContent");
    objc_msgSend(a1[4], "setInstrumentClusterMapETAViewController:");

    v33 = (id)objc_msgSend(a1[4], "instrumentClusterMapETAViewController");
    objc_msgSend(v33, "setSafeAreaDelegate:", a1[4]);

    v35 = (id)objc_msgSend(a1[4], "navigator");
    v34 = (id)objc_msgSend(a1[4], "instrumentClusterCardViewController");
    objc_msgSend(v35, "addDisplayDelegate:");

  }
  WeakRetained = objc_loadWeakRetained(a1 + 5);
  v19 = (id)objc_msgSend(WeakRetained, "templateEnvironment");
  v18 = (id)objc_msgSend(v19, "sessionStatus");
  v17 = (id)objc_msgSend(v18, "currentSession");
  v16 = (id)objc_msgSend(v17, "configuration");
  v20 = objc_msgSend(v16, "rightHandDrive");

  v50 = v20 & 1;
  v24 = (id)objc_msgSend(WeakRetained, "templateEnvironment");
  v23 = (id)objc_msgSend(v24, "sessionStatus");
  v22 = (id)objc_msgSend(v23, "currentSession");
  v21 = (id)objc_msgSend(v22, "configuration");
  v25 = objc_msgSend(v21, "supportsVehicleData");

  v49 = v25 & 1;
  memset(__b, 0, sizeof(__b));
  v29 = (id)objc_msgSend(WeakRetained, "templateEnvironment");
  v28 = (id)objc_msgSend(v29, "sessionStatus");
  v27 = (id)objc_msgSend(v28, "currentSession");
  v26 = (id)objc_msgSend(v27, "configuration");
  obj = (id)objc_msgSend(v26, "screens");

  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v56, 16);
  if (v31)
  {
    v13 = *(_QWORD *)__b[2];
    v14 = 0;
    v15 = v31;
    while (1)
    {
      v12 = v14;
      if (*(_QWORD *)__b[2] != v13)
        objc_enumerationMutation(obj);
      v48 = *(id *)(__b[1] + 8 * v14);
      v10 = (id)objc_msgSend(v48, "identifier");
      v9 = (id)objc_msgSend(WeakRetained, "instrumentClusterScene");
      v8 = (id)objc_msgSend(v9, "settings");
      v7 = (id)objc_msgSend(v8, "displayConfiguration");
      v6 = (id)objc_msgSend(v7, "hardwareIdentifier");
      v11 = objc_msgSend(v10, "isEqualToString:");

      if ((v11 & 1) != 0)
      {
        v4 = (id)objc_msgSend(WeakRetained, "instrumentClusterCardViewController");
        objc_msgSend(v4, "setCARScreenInfo:isRightHandDrive:supportsVehicleData:", v48, v50 & 1, v49 & 1);

        v5 = (id)objc_msgSend(WeakRetained, "instrumentClusterMapETAViewController");
        objc_msgSend(v5, "setCARScreenInfo:isRightHandDrive:supportsVehicleData:", v48, v50 & 1, v49 & 1);

      }
      ++v14;
      if (v12 + 1 >= v15)
      {
        v14 = 0;
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v56, 16);
        if (!v15)
          break;
      }
    }
  }

  v3 = (id)objc_msgSend(WeakRetained, "clusterSetupDelegate");
  objc_msgSend(v3, "templateInstanceDidFinishClusterSetup:", WeakRetained);

  objc_storeStrong(&WeakRetained, 0);
}

- (BOOL)_handleAppViewConnection:(id)a3
{
  NSObject *v4;
  os_log_type_t v5;
  NSObject *v6;
  os_log_type_t v7;
  NSObject *queue;
  id v9;
  NSObject *log;
  os_log_type_t type;
  CPSTemplateEnvironment *v12;
  NSString *v13;
  CPSTemplateEnvironment *v14;
  BOOL v15;
  uint8_t v16[7];
  os_log_type_t v17;
  os_log_t v18;
  uint8_t v19[7];
  os_log_type_t v20;
  os_log_t oslog;
  int v22;
  uint64_t v23;
  int v24;
  int v25;
  void (*v26)(id *);
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  int v31;
  int v32;
  void (*v33)(uint64_t);
  void *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint8_t v40[7];
  char v41;
  id v42;
  id location[2];
  CPSTemplateInstance *v44;
  char v45;

  v44 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = -[CPSTemplateInstance templateEnvironment](v44, "templateEnvironment");
  v15 = -[CPSTemplateEnvironment hasAnyTemplateEntitlement](v14, "hasAnyTemplateEntitlement");

  if (v15)
  {
    v12 = -[CPSTemplateInstance templateEnvironment](v44, "templateEnvironment");
    v13 = -[CPSTemplateEnvironment bundleIdentifier](v12, "bundleIdentifier");

    if (v13)
    {
      v42 = CarPlaySupportGeneralLogging();
      v41 = 2;
      if (os_log_type_enabled((os_log_t)v42, OS_LOG_TYPE_DEBUG))
      {
        log = v42;
        type = v41;
        __os_log_helper_16_0_0(v40);
        _os_log_debug_impl(&dword_21E389000, log, type, "Process has Maps/Audio/Communications entitlement, accepting connection", v40, 2u);
      }
      objc_storeStrong(&v42, 0);
      v39 = (id)objc_msgSend(MEMORY[0x24BDB79D8], "_templateProvidingInterface");
      objc_msgSend(location[0], "setExportedInterface:", v39);
      objc_msgSend(location[0], "setExportedObject:", v44);
      v38 = (id)objc_msgSend(MEMORY[0x24BDB79D8], "_templateClientInterface");
      objc_msgSend(location[0], "setRemoteObjectInterface:", v38);
      v9 = (id)objc_msgSend(location[0], "remoteObjectProxy");
      -[CPSTemplateInstance setInterfaceControllerRemoteObjectProxy:](v44, "setInterfaceControllerRemoteObjectProxy:");

      objc_initWeak(&v37, v44);
      v30 = MEMORY[0x24BDAC760];
      v31 = -1073741824;
      v32 = 0;
      v33 = __48__CPSTemplateInstance__handleAppViewConnection___block_invoke;
      v34 = &unk_24E26F520;
      objc_copyWeak(&v35, &v37);
      v36 = (id)MEMORY[0x2207AE654](&v30);
      objc_msgSend(location[0], "setInvalidationHandler:", v36);
      objc_msgSend(location[0], "setInterruptionHandler:", v36);
      objc_msgSend(location[0], "resume");
      -[CPSTemplateInstance setInterfaceControllerConnection:](v44, "setInterfaceControllerConnection:", location[0]);
      objc_initWeak(&v29, v44);
      queue = MEMORY[0x24BDAC9B8];
      v23 = MEMORY[0x24BDAC760];
      v24 = -1073741824;
      v25 = 0;
      v26 = __48__CPSTemplateInstance__handleAppViewConnection___block_invoke_2;
      v27 = &unk_24E26F520;
      objc_copyWeak(&v28, &v29);
      dispatch_async(queue, &v23);

      v45 = 1;
      v22 = 1;
      objc_destroyWeak(&v28);
      objc_destroyWeak(&v29);
      objc_storeStrong(&v36, 0);
      objc_destroyWeak(&v35);
      objc_destroyWeak(&v37);
      objc_storeStrong(&v38, 0);
      objc_storeStrong(&v39, 0);
    }
    else
    {
      oslog = (os_log_t)CarPlaySupportGeneralLogging();
      v20 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        v6 = oslog;
        v7 = v20;
        __os_log_helper_16_0_0(v19);
        _os_log_impl(&dword_21E389000, v6, v7, "Unable to get bundle identifier for connection", v19, 2u);
      }
      objc_storeStrong((id *)&oslog, 0);
      v45 = 0;
      v22 = 1;
    }
  }
  else
  {
    v18 = (os_log_t)CarPlaySupportGeneralLogging();
    v17 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v4 = v18;
      v5 = v17;
      __os_log_helper_16_0_0(v16);
      _os_log_impl(&dword_21E389000, v4, v5, "Process does not have any valid template entitlement, not accepting connection", v16, 2u);
    }
    objc_storeStrong((id *)&v18, 0);
    v45 = 0;
    v22 = 1;
  }
  objc_storeStrong(location, 0);
  return v45 & 1;
}

void __48__CPSTemplateInstance__handleAppViewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_appViewConnectionInvalidationHandler");

}

void __48__CPSTemplateInstance__handleAppViewConnection___block_invoke_2(id *a1)
{
  id v1;
  unsigned int v2;
  id v3;
  id v4[3];

  v4[2] = a1;
  v4[1] = a1;
  v4[0] = objc_loadWeakRetained(a1 + 4);
  v1 = (id)objc_msgSend(v4[0], "interfaceControllerConnection");
  v2 = objc_msgSend(v1, "processIdentifier");

  v3 = (id)objc_msgSend(v4[0], "overlayViewController");
  objc_msgSend(v3, "updateVisibilityForPid:", v2);

  objc_storeStrong(v4, 0);
}

- (void)_appViewConnectionInvalidationHandler
{
  NSObject *queue;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t (*v6)(uint64_t);
  void *v7;
  id v8[2];
  CPSTemplateInstance *v9;

  v9 = self;
  v8[1] = (id)a2;
  queue = MEMORY[0x24BDAC9B8];
  v3 = MEMORY[0x24BDAC760];
  v4 = -1073741824;
  v5 = 0;
  v6 = __60__CPSTemplateInstance__appViewConnectionInvalidationHandler__block_invoke;
  v7 = &unk_24E26F1B8;
  v8[0] = v9;
  dispatch_async(queue, &v3);

  objc_storeStrong(v8, 0);
}

uint64_t __60__CPSTemplateInstance__appViewConnectionInvalidationHandler__block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;

  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "overlayViewController");
  v2 = (id)objc_msgSend(v3, "view");
  objc_msgSend(v2, "removeFromSuperview");

  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "overlayViewController");
  objc_msgSend(v4, "removeFromParentViewController");

  objc_msgSend(*(id *)(a1 + 32), "setTabBarViewController:");
  objc_msgSend(*(id *)(a1 + 32), "setTemplateEnvironment:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setInterfaceControllerRemoteObjectProxy:", 0);
}

- (void)invalidate
{
  CPSBannerSource *v2;
  NSXPCConnection *v3;
  NSXPCConnection *v4;
  CPSOverlayViewController *v5;

  v2 = -[CPSTemplateInstance bannerSource](self, "bannerSource");
  -[CPSBannerSource invalidate](v2, "invalidate");

  v3 = -[CPSTemplateInstance dashboardControllerConnection](self, "dashboardControllerConnection");
  -[NSXPCConnection invalidate](v3, "invalidate");

  v4 = -[CPSTemplateInstance interfaceControllerConnection](self, "interfaceControllerConnection");
  -[NSXPCConnection invalidate](v4, "invalidate");

  v5 = -[CPSTemplateInstance overlayViewController](self, "overlayViewController");
  -[CPSOverlayViewController invalidate](v5, "invalidate");

}

- (BOOL)_handleDashboardConnection:(id)a3
{
  id v4;
  CPSDashboardGuidanceViewController *v5;
  id v6;
  CPSTemplateEnvironment *v7;
  BOOL v8;
  CPSTemplateEnvironment *v9;
  uint64_t v10;
  int v11;
  int v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  BOOL v21;
  id location[2];
  CPSTemplateInstance *v23;
  char v24;

  v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = -[CPSTemplateInstance templateEnvironment](v23, "templateEnvironment");
  v8 = -[CPSTemplateEnvironment hasNavigationEntitlement](v7, "hasNavigationEntitlement");

  v21 = v8;
  v9 = -[CPSTemplateInstance templateEnvironment](v23, "templateEnvironment");
  v20 = -[CPSTemplateEnvironment bundleIdentifier](v9, "bundleIdentifier");

  if (v8 && v20)
  {
    v19 = (id)objc_msgSend(MEMORY[0x24BDB79B0], "_dashboardProvidingInterface");
    objc_msgSend(location[0], "setExportedInterface:", v19);
    objc_msgSend(location[0], "setExportedObject:", v23);
    v18 = (id)objc_msgSend(MEMORY[0x24BDB79B0], "_dashboardClientInterface");
    objc_msgSend(location[0], "setRemoteObjectInterface:", v18);
    v6 = (id)objc_msgSend(location[0], "remoteObjectProxy");
    -[CPSTemplateInstance setDashboardControllerRemoteObjectProxy:](v23, "setDashboardControllerRemoteObjectProxy:");

    objc_initWeak(&v17, v23);
    v10 = MEMORY[0x24BDAC760];
    v11 = -1073741824;
    v12 = 0;
    v13 = __50__CPSTemplateInstance__handleDashboardConnection___block_invoke;
    v14 = &unk_24E26F520;
    objc_copyWeak(&v15, &v17);
    v16 = (id)MEMORY[0x2207AE654](&v10);
    objc_msgSend(location[0], "setInvalidationHandler:", v16);
    objc_msgSend(location[0], "setInterruptionHandler:", v16);
    objc_msgSend(location[0], "resume");
    -[CPSTemplateInstance setDashboardControllerConnection:](v23, "setDashboardControllerConnection:", location[0]);
    v5 = -[CPSTemplateInstance dashboardGuidanceViewController](v23, "dashboardGuidanceViewController");
    v4 = (id)objc_msgSend(location[0], "remoteObjectProxy");
    -[CPSDashboardGuidanceViewController setDashboardClient:](v5, "setDashboardClient:");

    v24 = 1;
    objc_storeStrong(&v16, 0);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_storeStrong(&v18, 0);
    objc_storeStrong(&v19, 0);
  }
  else
  {
    v24 = 0;
  }
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
  return v24 & 1;
}

void __50__CPSTemplateInstance__handleDashboardConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_dashboardConnectionInvalidationHandler");

}

- (void)_dashboardConnectionInvalidationHandler
{
  NSObject *queue;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t (*v6)(uint64_t);
  void *v7;
  id v8[2];
  CPSTemplateInstance *v9;

  v9 = self;
  v8[1] = (id)a2;
  queue = MEMORY[0x24BDAC9B8];
  v3 = MEMORY[0x24BDAC760];
  v4 = -1073741824;
  v5 = 0;
  v6 = __62__CPSTemplateInstance__dashboardConnectionInvalidationHandler__block_invoke;
  v7 = &unk_24E26F1B8;
  v8[0] = v9;
  dispatch_async(queue, &v3);

  objc_storeStrong(v8, 0);
}

uint64_t __62__CPSTemplateInstance__dashboardConnectionInvalidationHandler__block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;

  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "dashboardGuidanceViewController");
  v2 = (id)objc_msgSend(v3, "view");
  objc_msgSend(v2, "removeFromSuperview");

  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "dashboardGuidanceViewController");
  objc_msgSend(v4, "removeFromParentViewController");

  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "dashboardEstimatesViewController");
  v5 = (id)objc_msgSend(v6, "view");
  objc_msgSend(v5, "removeFromSuperview");

  v7 = (id)objc_msgSend(*(id *)(a1 + 32), "dashboardEstimatesViewController");
  objc_msgSend(v7, "removeFromParentViewController");

  return objc_msgSend(*(id *)(a1 + 32), "setDashboardControllerRemoteObjectProxy:", 0);
}

- (BOOL)_handleInstrumentClusterConnection:(id)a3
{
  CPSTemplateEnvironment *v4;
  BOOL v5;
  CPSTemplateEnvironment *v6;
  uint64_t v7;
  int v8;
  int v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  BOOL v17;
  id location[2];
  CPSTemplateInstance *v19;
  char v20;

  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[CPSTemplateInstance templateEnvironment](v19, "templateEnvironment");
  v5 = -[CPSTemplateEnvironment hasNavigationEntitlement](v4, "hasNavigationEntitlement");

  v17 = v5;
  v6 = -[CPSTemplateInstance templateEnvironment](v19, "templateEnvironment");
  v16 = -[CPSTemplateEnvironment bundleIdentifier](v6, "bundleIdentifier");

  if (v5 && v16)
  {
    v15 = (id)objc_msgSend(MEMORY[0x24BDB79D0], "_clusterProvidingInterface");
    objc_msgSend(location[0], "setExportedInterface:", v15);
    objc_msgSend(location[0], "setExportedObject:", v19);
    objc_initWeak(&v14, v19);
    v7 = MEMORY[0x24BDAC760];
    v8 = -1073741824;
    v9 = 0;
    v10 = __58__CPSTemplateInstance__handleInstrumentClusterConnection___block_invoke;
    v11 = &unk_24E26F520;
    objc_copyWeak(&v12, &v14);
    v13 = (id)MEMORY[0x2207AE654](&v7);
    objc_msgSend(location[0], "setInvalidationHandler:", v13);
    objc_msgSend(location[0], "setInterruptionHandler:", v13);
    objc_msgSend(location[0], "resume");
    -[CPSTemplateInstance setInstrumentClusterControllerConnection:](v19, "setInstrumentClusterControllerConnection:", location[0]);
    v20 = 1;
    objc_storeStrong(&v13, 0);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_storeStrong(&v15, 0);
  }
  else
  {
    v20 = 0;
  }
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  return v20 & 1;
}

void __58__CPSTemplateInstance__handleInstrumentClusterConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_instrumentClusterConnectionInvalidationHandler");

}

- (void)_instrumentClusterConnectionInvalidationHandler
{
  NSObject *queue;
  uint64_t v3;
  int v4;
  int v5;
  void (*v6)(uint64_t);
  void *v7;
  id v8[2];
  CPSTemplateInstance *v9;

  v9 = self;
  v8[1] = (id)a2;
  queue = MEMORY[0x24BDAC9B8];
  v3 = MEMORY[0x24BDAC760];
  v4 = -1073741824;
  v5 = 0;
  v6 = __70__CPSTemplateInstance__instrumentClusterConnectionInvalidationHandler__block_invoke;
  v7 = &unk_24E26F1B8;
  v8[0] = v9;
  dispatch_async(queue, &v3);

  objc_storeStrong(v8, 0);
}

void __70__CPSTemplateInstance__instrumentClusterConnectionInvalidationHandler__block_invoke(uint64_t a1)
{
  id v1;
  id v2;
  id v3;
  id v5;

  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "instrumentClusterViewControllerMapTable");
  v2 = (id)objc_msgSend(v3, "objectEnumerator");
  v1 = (id)objc_msgSend(v2, "allObjects");
  objc_msgSend(v1, "enumerateObjectsUsingBlock:", &__block_literal_global_96);

  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "instrumentClusterViewControllerMapTable");
  objc_msgSend(v5, "removeAllObjects");

}

void __70__CPSTemplateInstance__instrumentClusterConnectionInvalidationHandler__block_invoke_2(void *a1, void *a2)
{
  id v2;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v2 = (id)objc_msgSend(location[0], "view");
  objc_msgSend(v2, "removeFromSuperview");

  objc_msgSend(location[0], "removeFromParentViewController");
  objc_storeStrong(location, 0);
}

- (void)allowlistClassesForBaseTemplateProvider:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  unint64_t v17;
  id v18;
  int v19;
  id v20;
  id v21;
  id *v22;
  id v23;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  v22 = location;
  v23 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = location[0];
  v17 = 0x24BDBC000uLL;
  v5 = (id)MEMORY[0x24BDBCF20];
  v8 = 0x24BDBC000uLL;
  v4 = objc_opt_class();
  v9 = 0x24BDB7000uLL;
  v3 = objc_opt_class();
  v10 = 0x24BDB7000uLL;
  v7 = (id)objc_msgSend(v5, "setWithObjects:", v4, v3, objc_opt_class(), 0);
  v14 = 0;
  v19 = 0;
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:");

  v15 = location[0];
  v13 = *(id *)(v17 + 3872);
  v12 = objc_opt_class();
  v11 = objc_opt_class();
  v16 = (id)objc_msgSend(v13, "setWithObjects:", v12, v11, objc_opt_class(), 0);
  objc_msgSend(v15, "setClasses:forSelector:argumentIndex:ofReply:");

  v20 = location[0];
  v18 = *(id *)(v17 + 3872);
  v21 = (id)objc_msgSend(v18, "setWithObject:", objc_opt_class());
  objc_msgSend(v20, "setClasses:forSelector:argumentIndex:ofReply:");

  objc_storeStrong(v22, v23);
}

- (void)_pushNowPlayingIfNeeded
{
  CPTemplateServiceClientInterface *v2;
  NSString *v3;
  CPSTemplateEnvironment *v4;
  CPSTemplateEnvironment *v5;
  BOOL v6;
  id location[2];
  CPSTemplateInstance *v8;
  uint8_t v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v8 = self;
  location[1] = (id)a2;
  if (self->_pendingLaunchToNowPlaying)
  {
    v8->_pendingLaunchToNowPlaying = 0;
    v5 = -[CPSTemplateInstance templateEnvironment](v8, "templateEnvironment");
    v6 = -[CPSTemplateEnvironment canBecomeNowPlayingApp](v5, "canBecomeNowPlayingApp");

    if (v6)
    {
      v2 = -[CPSTemplateInstance interfaceControllerRemoteObjectProxy](v8, "interfaceControllerRemoteObjectProxy");
      -[CPTemplateServiceClientInterface clientPushNowPlayingTemplateAnimated:](v2, "clientPushNowPlayingTemplateAnimated:", 0);

    }
    else
    {
      location[0] = CarPlaySupportGeneralLogging();
      if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
      {
        v4 = -[CPSTemplateInstance templateEnvironment](v8, "templateEnvironment");
        v3 = -[CPSTemplateEnvironment bundleIdentifier](v4, "bundleIdentifier");
        __os_log_helper_16_2_1_8_66((uint64_t)v9, (uint64_t)v3);
        _os_log_impl(&dword_21E389000, (os_log_t)location[0], OS_LOG_TYPE_DEFAULT, "Client app %{public}@ cannot become now playing; not requesting now playing",
          v9,
          0xCu);

      }
      objc_storeStrong(location, 0);
    }
  }
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  CPTemplateServiceClientInterface *v5;
  id v6;
  unint64_t v7;
  CPSTemplateEnvironment *v8;
  BOOL v9;
  CPSOverlayViewController *v10;
  BOOL v11;
  id v12;
  id v13;
  id v16;
  BOOL v17;
  id v18;
  id location[2];
  CPSTemplateInstance *v20;
  uint8_t v21[24];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18 = 0;
  objc_storeStrong(&v18, a4);
  v17 = a5;
  v16 = CarPlaySupportGeneralLogging();
  if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v18;
    v13 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v17);
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v21, (uint64_t)v12, (uint64_t)v13);
    _os_log_impl(&dword_21E389000, (os_log_t)v16, OS_LOG_TYPE_DEFAULT, "Will show navigation item %@ animated %@", v21, 0x16u);

  }
  objc_storeStrong(&v16, 0);
  v10 = -[CPSTemplateInstance overlayViewController](v20, "overlayViewController");
  v11 = -[CPSOverlayViewController shouldHideNavigationBarForViewController:](v10, "shouldHideNavigationBarForViewController:", v18);

  if (v11)
  {
    objc_msgSend(location[0], "setNavigationBarHidden:animated:", 1, 1);
  }
  else if ((objc_msgSend(location[0], "isNavigationBarHidden") & 1) != 0)
  {
    objc_msgSend(location[0], "setNavigationBarHidden:animated:", 0, 1);
  }
  v6 = (id)objc_msgSend(location[0], "viewControllers");
  v7 = objc_msgSend(v6, "count");

  v8 = -[CPSTemplateInstance templateEnvironment](v20, "templateEnvironment");
  v9 = v7 <= -[CPSTemplateEnvironment maximumClientHierarchyDepth](v8, "maximumClientHierarchyDepth");

  if (!v9)
  {
    v5 = -[CPSTemplateInstance interfaceControllerRemoteObjectProxy](v20, "interfaceControllerRemoteObjectProxy");
    -[CPTemplateServiceClientInterface clientExceededHierarchyDepthLimit](v5, "clientExceededHierarchyDepthLimit");

  }
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  id v5;
  id v6;
  os_log_t oslog;
  BOOL v10;
  id v11;
  id location[3];
  uint8_t v13[24];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = 0;
  objc_storeStrong(&v11, a4);
  v10 = a5;
  oslog = (os_log_t)CarPlaySupportGeneralLogging();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v11;
    v6 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v10);
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v13, (uint64_t)v5, (uint64_t)v6);
    _os_log_impl(&dword_21E389000, oslog, OS_LOG_TYPE_DEFAULT, "Did show navigation item %@ animated %@", v13, 0x16u);

  }
  objc_storeStrong((id *)&oslog, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

- (void)templateViewControllerDidPop:(id)a3
{
  id v3;
  CPSApplicationStateMonitor *v4;
  NSMutableDictionary *v5;
  id v6;
  CPTemplateServiceClientInterface *v7;
  id v8;
  id v9;
  id location[2];
  CPSTemplateInstance *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = (id)objc_msgSend(location[0], "associatedTemplate");
  v9 = (id)objc_msgSend(v6, "identifier");

  v7 = -[CPSTemplateInstance interfaceControllerRemoteObjectProxy](v11, "interfaceControllerRemoteObjectProxy");
  -[CPTemplateServiceClientInterface templateIdentifierDidPop:](v7, "templateIdentifierDidPop:", v9);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = location[0];
    objc_msgSend(v8, "setTemplateDelegate:");
    objc_msgSend(v8, "setAssociatedTemplate:", 0);
    objc_storeStrong(&v8, 0);
  }
  else
  {
    objc_msgSend(location[0], "setTemplateDelegate:");
    objc_msgSend(location[0], "setAssociatedTemplate:", 0);
  }
  v5 = -[CPSTemplateInstance identifierToViewControllerDictionary](v11, "identifierToViewControllerDictionary");
  -[NSMutableDictionary removeObjectForKey:](v5, "removeObjectForKey:", v9);

  if ((objc_msgSend(location[0], "conformsToProtocol:", &unk_25541F428) & 1) != 0)
  {
    v4 = -[CPSTemplateInstance applicationStateMonitor](v11, "applicationStateMonitor");
    v3 = CPSSafeProtocolCast_0(&unk_25541F428, location[0]);
    -[CPSApplicationStateMonitor removeApplicationStateObserver:](v4, "removeApplicationStateObserver:");

  }
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)templateViewControllerDidDismiss:(id)a3
{
  id v3;
  CPSApplicationStateMonitor *v4;
  CPTemplateServiceClientInterface *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  id v8;
  id v9;
  id v10;
  id location[2];
  CPSTemplateInstance *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = (id)objc_msgSend(location[0], "associatedTemplate");
  v10 = (id)objc_msgSend(v8, "identifier");

  if (v10)
  {
    v5 = -[CPSTemplateInstance interfaceControllerRemoteObjectProxy](v12, "interfaceControllerRemoteObjectProxy");
    -[CPTemplateServiceClientInterface templateIdentifierDidDismiss:](v5, "templateIdentifierDidDismiss:", v10);

    v6 = -[CPSTemplateInstance identifierToViewControllerDictionary](v12, "identifierToViewControllerDictionary");
    v9 = (id)-[NSMutableDictionary objectForKey:](v6, "objectForKey:", v10);

    objc_msgSend(v9, "setTemplateDelegate:");
    objc_msgSend(v9, "setAssociatedTemplate:", 0);
    v7 = -[CPSTemplateInstance identifierToViewControllerDictionary](v12, "identifierToViewControllerDictionary");
    -[NSMutableDictionary removeObjectForKey:](v7, "removeObjectForKey:", v10);

    objc_storeStrong(&v9, 0);
  }
  if ((objc_msgSend(location[0], "conformsToProtocol:", &unk_25541F428) & 1) != 0)
  {
    v4 = -[CPSTemplateInstance applicationStateMonitor](v12, "applicationStateMonitor");
    v3 = CPSSafeProtocolCast_0(&unk_25541F428, location[0]);
    -[CPSApplicationStateMonitor removeApplicationStateObserver:](v4, "removeApplicationStateObserver:");

  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (void)templateViewController:(id)a3 shouldActivateSiriWithDirectActionContext:(id)a4
{
  id v4;
  SiriDirectActionSource *v5;
  uint64_t v7;
  int v8;
  int v9;
  void (*v10)(NSObject *, char);
  void *v11;
  id v12;
  os_log_type_t v13;
  id v14;
  id v15;
  id location[2];
  CPSTemplateInstance *v17;
  uint8_t v18[24];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = 0;
  objc_storeStrong(&v15, a4);
  v14 = CarPlaySupportGeneralLogging();
  v13 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v18, (uint64_t)v15);
    _os_log_impl(&dword_21E389000, (os_log_t)v14, v13, "Preparing to activate Siri for direct action %@", v18, 0xCu);
  }
  objc_storeStrong(&v14, 0);
  v5 = -[CPSTemplateInstance siriActivationSource](v17, "siriActivationSource");
  v4 = v15;
  v7 = MEMORY[0x24BDAC760];
  v8 = -1073741824;
  v9 = 0;
  v10 = __88__CPSTemplateInstance_templateViewController_shouldActivateSiriWithDirectActionContext___block_invoke;
  v11 = &unk_24E26F168;
  v12 = v15;
  -[SiriDirectActionSource activateWithContext:completion:](v5, "activateWithContext:completion:", v4, &v7);

  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
}

void __88__CPSTemplateInstance_templateViewController_shouldActivateSiriWithDirectActionContext___block_invoke(NSObject *a1, char a2)
{
  uint64_t isa;
  id v3;
  os_log_t oslog[2];
  char v6;
  NSObject *v7;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v7 = a1;
  v6 = a2 & 1;
  oslog[1] = a1;
  oslog[0] = (os_log_t)CarPlaySupportGeneralLogging();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_INFO))
  {
    isa = (uint64_t)a1[4].isa;
    v3 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6 & 1);
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v8, isa, (uint64_t)v3);
    _os_log_impl(&dword_21E389000, oslog[0], OS_LOG_TYPE_INFO, "Performed Siri activation for %@ with result %@", v8, 0x16u);

  }
  objc_storeStrong((id *)oslog, 0);
}

- (UIEdgeInsets)safeAreaInsetsForScene:(id)a3
{
  FBScene *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  FBScene *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  double v38;
  double v39;
  double v40;
  CPSInstrumentClusterCardViewController *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  CPSInstrumentClusterCardViewController *v46;
  id v47;
  id v48;
  char v49;
  id v50;
  CPSInstrumentClusterCardViewController *v51;
  CPSInstrumentClusterCardViewController *v52;
  id v53;
  id v54;
  id v55;
  id v56;
  CPSInstrumentClusterCardViewController *v57;
  id v58;
  id v59;
  char v60;
  FBScene *v61;
  BOOL v62;
  id v63;
  CPSDashboardEstimatesViewController *v64;
  CPSDashboardEstimatesViewController *v65;
  FBScene *v66;
  BOOL v67;
  os_log_t oslog[10];
  int v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  id location[2];
  CPSTemplateInstance *v79;
  __int128 v80;
  __int128 v81;
  uint8_t v82[24];
  uint64_t v83;
  UIEdgeInsets result;

  v83 = *MEMORY[0x24BDAC8D0];
  v79 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v66 = (FBScene *)location[0];
  v3 = -[CPSTemplateInstance mapWidgetScene](v79, "mapWidgetScene");
  v67 = v66 != v3;

  if (v67)
  {
    v61 = (FBScene *)location[0];
    v16 = -[CPSTemplateInstance scene](v79, "scene");
    v62 = v61 != v16;

    if (v62)
    {
      v59 = (id)objc_msgSend(location[0], "settings");
      v58 = (id)objc_msgSend(v59, "displayConfiguration");
      v57 = -[CPSTemplateInstance instrumentClusterMapETAViewController](v79, "instrumentClusterMapETAViewController");
      v56 = (id)-[CPSInstrumentClusterCardViewController view](v57, "view");
      v55 = (id)objc_msgSend(v56, "window");
      v54 = (id)objc_msgSend(v55, "screen");
      v53 = (id)objc_msgSend(v54, "displayConfiguration");
      v60 = objc_msgSend(v58, "isEqual:");

      if ((v60 & 1) != 0)
      {
        v51 = -[CPSTemplateInstance instrumentClusterMapETAViewController](v79, "instrumentClusterMapETAViewController");
        v50 = (id)-[CPSInstrumentClusterCardViewController view](v51, "view");
        objc_msgSend(v50, "safeAreaInsets");
        oslog[5] = v21;
        oslog[6] = v22;
        oslog[7] = v23;
        oslog[8] = v24;

        v52 = -[CPSTemplateInstance instrumentClusterMapETAViewController](v79, "instrumentClusterMapETAViewController");
        -[CPSInstrumentClusterCardViewController currentClientInsets](v52, "currentClientInsets");
        oslog[1] = v25;
        oslog[2] = v26;
        oslog[3] = v27;
        oslog[4] = v28;

        v80 = 0u;
        v81 = 0u;
        UIEdgeInsetsAdd();
        *(_QWORD *)&v80 = v29;
        *((_QWORD *)&v80 + 1) = v30;
        *(_QWORD *)&v81 = v31;
        *((_QWORD *)&v81 + 1) = v32;
        v69 = 1;
      }
      else
      {
        v48 = (id)objc_msgSend(location[0], "settings");
        v47 = (id)objc_msgSend(v48, "displayConfiguration");
        v46 = -[CPSTemplateInstance instrumentClusterCardViewController](v79, "instrumentClusterCardViewController");
        v45 = (id)-[CPSInstrumentClusterCardViewController view](v46, "view");
        v44 = (id)objc_msgSend(v45, "window");
        v43 = (id)objc_msgSend(v44, "screen");
        v42 = (id)objc_msgSend(v43, "displayConfiguration");
        v49 = objc_msgSend(v47, "isEqual:");

        if ((v49 & 1) != 0)
        {
          v80 = 0u;
          v81 = 0u;
          v41 = -[CPSTemplateInstance instrumentClusterCardViewController](v79, "instrumentClusterCardViewController");
          -[CPSInstrumentClusterCardViewController currentClientInsets](v41, "currentClientInsets");
          *(_QWORD *)&v80 = v33;
          *((_QWORD *)&v80 + 1) = v34;
          *(_QWORD *)&v81 = v35;
          *((_QWORD *)&v81 + 1) = v36;

          v69 = 1;
        }
        else
        {
          oslog[0] = (os_log_t)CarPlaySupportGeneralLogging();
          if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_ERROR))
          {
            __os_log_helper_16_2_1_8_66((uint64_t)v82, (uint64_t)location[0]);
            _os_log_error_impl(&dword_21E389000, oslog[0], OS_LOG_TYPE_ERROR, "Requesting safe area for scene not owned by this instance: %{public}@", v82, 0xCu);
          }
          objc_storeStrong((id *)oslog, 0);
          v80 = *MEMORY[0x24BDF7718];
          v81 = *(_OWORD *)(MEMORY[0x24BDF7718] + 16);
          v69 = 1;
        }
      }
    }
    else
    {
      -[CPSTemplateInstance currentSafeAreaInsets](v79, "currentSafeAreaInsets");
      *(_QWORD *)&v80 = v17;
      *((_QWORD *)&v80 + 1) = v18;
      *(_QWORD *)&v81 = v19;
      *((_QWORD *)&v81 + 1) = v20;
      v69 = 1;
    }
  }
  else
  {
    v64 = -[CPSTemplateInstance dashboardEstimatesViewController](v79, "dashboardEstimatesViewController");
    v63 = (id)-[CPSDashboardEstimatesViewController view](v64, "view");
    objc_msgSend(v63, "safeAreaInsets");
    v74 = v4;
    v75 = v5;
    v76 = v6;
    v77 = v7;

    v65 = -[CPSTemplateInstance dashboardEstimatesViewController](v79, "dashboardEstimatesViewController");
    -[CPSDashboardEstimatesViewController safeAreaInsets](v65, "safeAreaInsets");
    v70 = v8;
    v71 = v9;
    v72 = v10;
    v73 = v11;

    v80 = 0u;
    v81 = 0u;
    UIEdgeInsetsAdd();
    *(_QWORD *)&v80 = v12;
    *((_QWORD *)&v80 + 1) = v13;
    *(_QWORD *)&v81 = v14;
    *((_QWORD *)&v81 + 1) = v15;
    v69 = 1;
  }
  objc_storeStrong(location, 0);
  v37 = *((double *)&v81 + 1);
  v38 = *(double *)&v81;
  v39 = *((double *)&v80 + 1);
  v40 = *(double *)&v80;
  result.right = v37;
  result.bottom = v38;
  result.left = v39;
  result.top = v40;
  return result;
}

- (void)viewController:(id)a3 didUpdateSafeAreaInsets:(UIEdgeInsets)a4
{
  CPSDashboardEstimatesViewController *v4;
  FBScene *v5;
  FBScene *v6;
  char v7;
  NSObject *v8;
  os_log_type_t v9;
  NSString *v10;
  FBScene *v11;
  FBScene *v12;
  char v13;
  NSObject *log;
  os_log_type_t type;
  NSString *v16;
  CPSDashboardEstimatesViewController *v17;
  BOOL v18;
  FBScene *v19;
  FBScene *v20;
  char v21;
  CPSInstrumentClusterCardViewController *v22;
  char v23;
  char v24;
  CPSInstrumentClusterCardViewController *v25;
  CPSInstrumentClusterCardViewController *v26;
  uint64_t v27;
  int v28;
  int v29;
  void (*v30)(double *, void *);
  void *v31;
  UIEdgeInsets v32;
  NSString *v33;
  os_log_type_t v34;
  os_log_t oslog;
  uint64_t v36;
  int v37;
  int v38;
  void (*v39)(_QWORD *, void *);
  void *v40;
  CPSTemplateInstance *v41;
  NSString *v42;
  char v43;
  id v44;
  uint64_t v45;
  int v46;
  int v47;
  void (*v48)(_QWORD *, void *);
  void *v49;
  CPSTemplateInstance *v50;
  char v51;
  CPSInstrumentClusterCardViewController *v52;
  char v53;
  CPSInstrumentClusterCardViewController *v54;
  char v55;
  CPSInstrumentClusterCardViewController *v56;
  id location[2];
  CPSTemplateInstance *v58;
  UIEdgeInsets v59;
  uint8_t v60[16];
  uint8_t v61[24];
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v59 = a4;
  v58 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v25 = (CPSInstrumentClusterCardViewController *)location[0];
  v26 = -[CPSTemplateInstance instrumentClusterCardViewController](v58, "instrumentClusterCardViewController");
  v55 = 0;
  v53 = 0;
  v51 = 0;
  if (v25 != v26
    || (v56 = -[CPSTemplateInstance instrumentClusterCardViewController](v58, "instrumentClusterCardViewController"),
        v55 = 1,
        v24 = 1,
        !-[CPSInstrumentClusterCardViewController shouldUpdateContent](v56, "shouldUpdateContent")))
  {
    v22 = (CPSInstrumentClusterCardViewController *)location[0];
    v54 = -[CPSTemplateInstance instrumentClusterMapETAViewController](v58, "instrumentClusterMapETAViewController");
    v53 = 1;
    v23 = 0;
    if (v22 == v54)
    {
      v52 = -[CPSTemplateInstance instrumentClusterMapETAViewController](v58, "instrumentClusterMapETAViewController");
      v51 = 1;
      v23 = -[CPSInstrumentClusterCardViewController shouldUpdateContent](v52, "shouldUpdateContent");
    }
    v24 = v23;
  }
  if ((v51 & 1) != 0)

  if ((v53 & 1) != 0)
  if ((v55 & 1) != 0)

  if ((v24 & 1) != 0)
  {
    v20 = -[CPSTemplateInstance instrumentClusterScene](v58, "instrumentClusterScene");
    v21 = -[FBScene isValid](v20, "isValid");

    if ((v21 & 1) != 0)
    {
      v19 = -[CPSTemplateInstance instrumentClusterScene](v58, "instrumentClusterScene");
      v45 = MEMORY[0x24BDAC760];
      v46 = -1073741824;
      v47 = 0;
      v48 = __62__CPSTemplateInstance_viewController_didUpdateSafeAreaInsets___block_invoke;
      v49 = &unk_24E26F9B8;
      v50 = v58;
      -[FBScene updateUISettingsWithBlock:](v19, "updateUISettingsWithBlock:", &v45);

      objc_storeStrong((id *)&v50, 0);
    }
  }
  else
  {
    v17 = (CPSDashboardEstimatesViewController *)location[0];
    v4 = -[CPSTemplateInstance dashboardEstimatesViewController](v58, "dashboardEstimatesViewController");
    v18 = v17 != v4;

    if (v18)
    {
      oslog = (os_log_t)CarPlaySupportGeneralLogging();
      v34 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
      {
        v8 = oslog;
        v9 = v34;
        v10 = NSStringFromUIEdgeInsets(v59);
        v33 = v10;
        __os_log_helper_16_2_1_8_64((uint64_t)v60, (uint64_t)v33);
        _os_log_impl(&dword_21E389000, v8, v9, "Updating safe area for map template to %@", v60, 0xCu);

        objc_storeStrong((id *)&v33, 0);
      }
      objc_storeStrong((id *)&oslog, 0);
      v58->_currentSafeAreaInsets = v59;
      v6 = -[CPSTemplateInstance scene](v58, "scene");
      v7 = -[FBScene isValid](v6, "isValid");

      if ((v7 & 1) != 0)
      {
        v5 = -[CPSTemplateInstance scene](v58, "scene");
        v27 = MEMORY[0x24BDAC760];
        v28 = -1073741824;
        v29 = 0;
        v30 = __62__CPSTemplateInstance_viewController_didUpdateSafeAreaInsets___block_invoke_153;
        v31 = &__block_descriptor_64_e43_v16__0__UIMutableApplicationSceneSettings_8l;
        v32 = v59;
        -[FBScene updateUISettingsWithBlock:](v5, "updateUISettingsWithBlock:", &v27);

      }
    }
    else
    {
      v44 = CarPlaySupportGeneralLogging();
      v43 = 1;
      if (os_log_type_enabled((os_log_t)v44, OS_LOG_TYPE_INFO))
      {
        log = v44;
        type = v43;
        v16 = NSStringFromUIEdgeInsets(v59);
        v42 = v16;
        __os_log_helper_16_2_1_8_64((uint64_t)v61, (uint64_t)v42);
        _os_log_impl(&dword_21E389000, log, type, "Updating safe area for map template to %@", v61, 0xCu);

        objc_storeStrong((id *)&v42, 0);
      }
      objc_storeStrong(&v44, 0);
      v12 = -[CPSTemplateInstance mapWidgetScene](v58, "mapWidgetScene");
      v13 = -[FBScene isValid](v12, "isValid");

      if ((v13 & 1) != 0)
      {
        v11 = -[CPSTemplateInstance mapWidgetScene](v58, "mapWidgetScene");
        v36 = MEMORY[0x24BDAC760];
        v37 = -1073741824;
        v38 = 0;
        v39 = __62__CPSTemplateInstance_viewController_didUpdateSafeAreaInsets___block_invoke_152;
        v40 = &unk_24E26F9B8;
        v41 = v58;
        -[FBScene updateUISettingsWithBlock:](v11, "updateUISettingsWithBlock:", &v36);

        objc_storeStrong((id *)&v41, 0);
      }
    }
  }
  objc_storeStrong(location, 0);
}

void __62__CPSTemplateInstance_viewController_didUpdateSafeAreaInsets___block_invoke(_QWORD *a1, void *a2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v7;
  id v8;
  id v9;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v8 = location[0];
  v7 = (void *)a1[4];
  v9 = (id)objc_msgSend(v7, "instrumentClusterScene");
  objc_msgSend(v7, "safeAreaInsetsForScene:");
  objc_msgSend(v8, "setSafeAreaInsetsPortrait:", v2, v3, v4, v5);

  objc_storeStrong(location, 0);
}

void __62__CPSTemplateInstance_viewController_didUpdateSafeAreaInsets___block_invoke_152(_QWORD *a1, void *a2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v7;
  id v8;
  id v9;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v8 = location[0];
  v7 = (void *)a1[4];
  v9 = (id)objc_msgSend(v7, "mapWidgetScene");
  objc_msgSend(v7, "safeAreaInsetsForScene:");
  objc_msgSend(v8, "setSafeAreaInsetsPortrait:", v2, v3, v4, v5);

  objc_storeStrong(location, 0);
}

void __62__CPSTemplateInstance_viewController_didUpdateSafeAreaInsets___block_invoke_153(double *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_msgSend(location[0], "setSafeAreaInsetsPortrait:", a1[4], a1[5], a1[6], a1[7]);
  objc_storeStrong(location, 0);
}

- (void)updateInterestingInsets:(UIEdgeInsets)a3
{
  CPTemplateServiceClientInterface *v3;

  v3 = -[CPSTemplateInstance interfaceControllerRemoteObjectProxy](self, "interfaceControllerRemoteObjectProxy");
  -[CPTemplateServiceClientInterface updateInterestingLayoutGuideWithInsets:](v3, "updateInterestingLayoutGuideWithInsets:", a3.top, a3.left, a3.bottom, a3.right);

}

- (void)hostSetShortcutButtons:(id)a3 completion:(id)a4
{
  NSObject *queue;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  CPSTemplateInstance *v11;
  id v12;
  id v13;
  id v14;
  id location[2];
  CPSTemplateInstance *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  queue = MEMORY[0x24BDAC9B8];
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __57__CPSTemplateInstance_hostSetShortcutButtons_completion___block_invoke;
  v10 = &unk_24E26FAD0;
  v11 = v16;
  v12 = location[0];
  v13 = v14;
  dispatch_async(queue, &v6);

  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

uint64_t __57__CPSTemplateInstance_hostSetShortcutButtons_completion___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "dashboardGuidanceViewController");
  objc_msgSend(v2, "setShortCutButtons:", *(_QWORD *)(a1 + 40));

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (id)instrumentClusterViewControllerForDisplayIdentifier:(id)a3
{
  NSMapTable *v3;
  NSMapTable *instrumentClusterViewControllerMapTable;
  CPSInstrumentClusterViewController *v6;
  NSArray *v7;
  NSArray *v8;
  NSMapTable *v9;
  NSMapTable *v10;
  CPSInstrumentClusterViewController *v11;
  id location[2];
  CPSTemplateInstance *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (!v13->_instrumentClusterViewControllerMapTable)
  {
    v3 = (NSMapTable *)(id)objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
    instrumentClusterViewControllerMapTable = v13->_instrumentClusterViewControllerMapTable;
    v13->_instrumentClusterViewControllerMapTable = v3;

  }
  v10 = -[CPSTemplateInstance instrumentClusterViewControllerMapTable](v13, "instrumentClusterViewControllerMapTable");
  v11 = (CPSInstrumentClusterViewController *)-[NSMapTable objectForKey:](v10, "objectForKey:", location[0]);

  if (!v11)
  {
    v11 = objc_alloc_init(CPSInstrumentClusterViewController);

    v7 = -[CPSTemplateInstance clusterInactiveVariants](v13, "clusterInactiveVariants");
    -[CPSInstrumentClusterViewController setInactiveVariants:](v11, "setInactiveVariants:");

    v8 = -[CPSTemplateInstance clusterAttributedInactiveVariants](v13, "clusterAttributedInactiveVariants");
    -[CPSInstrumentClusterViewController setAttributedInactiveVariants:](v11, "setAttributedInactiveVariants:");

    v9 = -[CPSTemplateInstance instrumentClusterViewControllerMapTable](v13, "instrumentClusterViewControllerMapTable");
    -[NSMapTable setObject:forKey:](v9, "setObject:forKey:", v11, location[0]);

  }
  v6 = v11;
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(location, 0);
  return v6;
}

- (void)setCurrentLaneGuidance:(id)a3
{
  CPNavigationManager *v3;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(_QWORD *, void *);
  void *v8;
  id v9;
  id location[2];
  CPSTemplateInstance *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[CPSTemplateInstance navigationManager](v11, "navigationManager");
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __46__CPSTemplateInstance_setCurrentLaneGuidance___block_invoke;
  v8 = &unk_24E26FC60;
  v9 = location[0];
  -[CPNavigationManager modifyRouteGuidance:](v3, "modifyRouteGuidance:");

  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

void __46__CPSTemplateInstance_setCurrentLaneGuidance___block_invoke(_QWORD *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_msgSend(location[0], "setCurrentLaneGuidance:", a1[4]);
  objc_msgSend(location[0], "setLaneGuidanceShowing:", a1[4] != 0);
  objc_storeStrong(location, 0);
}

- (void)startRerouting
{
  CPNavigationManager *v2;

  v2 = -[CPSTemplateInstance navigationManager](self, "navigationManager");
  -[CPNavigationManager startRerouting](v2, "startRerouting");

}

- (void)routeChangedWithReason:(unsigned __int8)a3 routeInfo:(id)a4
{
  CPNavigationManager *v4;
  id location;
  unsigned __int8 v6;
  SEL v7;
  CPSTemplateInstance *v8;

  v8 = self;
  v7 = a2;
  v6 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v4 = -[CPSTemplateInstance navigationManager](v8, "navigationManager");
  -[CPNavigationManager routeChangedWithReason:routeInfo:](v4, "routeChangedWithReason:routeInfo:", v6, location);

  objc_storeStrong(&location, 0);
}

- (void)finishTrip
{
  CPNavigationManager *v2;
  CPNavigationManager *v3;

  v2 = -[CPSTemplateInstance navigationManager](self, "navigationManager");
  -[CPNavigationManager resetRouteGuidance](v2, "resetRouteGuidance");

  v3 = -[CPSTemplateInstance navigationManager](self, "navigationManager");
  -[CPNavigationManager releaseNavigationOwnership](v3, "releaseNavigationOwnership");

}

- (void)setCurrentRoadNameVariants:(id)a3
{
  CPNavigationManager *v3;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(_QWORD *, void *);
  void *v8;
  id v9;
  id location[2];
  CPSTemplateInstance *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[CPSTemplateInstance navigationManager](v11, "navigationManager");
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __50__CPSTemplateInstance_setCurrentRoadNameVariants___block_invoke;
  v8 = &unk_24E26FC60;
  v9 = location[0];
  -[CPNavigationManager modifyRouteGuidance:](v3, "modifyRouteGuidance:");

  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

void __50__CPSTemplateInstance_setCurrentRoadNameVariants___block_invoke(_QWORD *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_msgSend(location[0], "setCurrentRoadNameVariants:", a1[4]);
  objc_storeStrong(location, 0);
}

- (void)setManeuverState:(int64_t)a3
{
  CPNavigationManager *v3;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(_QWORD *, void *);
  void *v8;
  int64_t v9;
  int64_t v10;
  SEL v11;
  CPSTemplateInstance *v12;

  v12 = self;
  v11 = a2;
  v10 = a3;
  v3 = -[CPSTemplateInstance navigationManager](self, "navigationManager");
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __40__CPSTemplateInstance_setManeuverState___block_invoke;
  v8 = &__block_descriptor_40_e25_v16__0__CPRouteGuidance_8l;
  v9 = v10;
  -[CPNavigationManager modifyRouteGuidance:](v3, "modifyRouteGuidance:", &v4);

}

void __40__CPSTemplateInstance_setManeuverState___block_invoke(_QWORD *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_msgSend(location[0], "setManeuverState:", a1[4]);
  objc_storeStrong(location, 0);
}

- (void)pauseTripForReason:(unint64_t)a3
{
  CPNavigationManager *v3;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(uint64_t *, void *);
  void *v8;
  unint64_t v9;
  unint64_t v10;
  SEL v11;
  CPSTemplateInstance *v12;

  v12 = self;
  v11 = a2;
  v10 = a3;
  v3 = -[CPSTemplateInstance navigationManager](self, "navigationManager");
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __42__CPSTemplateInstance_pauseTripForReason___block_invoke;
  v8 = &__block_descriptor_40_e25_v16__0__CPRouteGuidance_8l;
  v9 = v10;
  -[CPNavigationManager modifyRouteGuidance:](v3, "modifyRouteGuidance:", &v4);

}

void __42__CPSTemplateInstance_pauseTripForReason___block_invoke(uint64_t *a1, void *a2)
{
  unsigned __int8 v2;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v2 = CPGuidanceStateFromCPTripPauseReason(a1[4]);
  objc_msgSend(location[0], "setGuidanceState:", v2);
  objc_storeStrong(location, 0);
}

- (void)setSendsNavigationMetadata:(BOOL)a3
{
  BOOL v3;
  CPNavigationManager *v4;
  CPNavigationManager *v5;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(_BYTE *, void *);
  void *v10;
  BOOL v11;
  BOOL v12;
  SEL v13;
  CPSTemplateInstance *v14;

  v14 = self;
  v13 = a2;
  v12 = a3;
  v3 = a3;
  v4 = -[CPSTemplateInstance navigationManager](self, "navigationManager");
  -[CPNavigationManager setSupportsAccNav:](v4, "setSupportsAccNav:", v3);

  v5 = -[CPSTemplateInstance navigationManager](v14, "navigationManager");
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __50__CPSTemplateInstance_setSendsNavigationMetadata___block_invoke;
  v10 = &__block_descriptor_33_e25_v16__0__CPRouteGuidance_8l;
  v11 = v12;
  -[CPNavigationManager modifyRouteGuidance:](v5, "modifyRouteGuidance:", &v6);

}

void __50__CPSTemplateInstance_setSendsNavigationMetadata___block_invoke(_BYTE *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_msgSend(location[0], "setSourceSupportsRouteGuidance:", a1[32] & 1);
  objc_storeStrong(location, 0);
}

- (void)setDestinationTimeZoneOffsetMinutes:(signed __int16)a3
{
  unsigned int v3;
  CPNavigationManager *v4;

  v3 = a3;
  v4 = -[CPSTemplateInstance navigationManager](self, "navigationManager");
  -[CPNavigationManager setDestinationTimeZoneOffsetMinutes:](v4, "setDestinationTimeZoneOffsetMinutes:", v3);

}

- (void)setDestinationNameVariants:(id)a3
{
  CPNavigationManager *v3;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(_QWORD *, void *);
  void *v8;
  id v9;
  id location[2];
  CPSTemplateInstance *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[CPSTemplateInstance navigationManager](v11, "navigationManager");
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __50__CPSTemplateInstance_setDestinationNameVariants___block_invoke;
  v8 = &unk_24E26FC60;
  v9 = location[0];
  -[CPNavigationManager modifyRouteGuidance:](v3, "modifyRouteGuidance:");

  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

void __50__CPSTemplateInstance_setDestinationNameVariants___block_invoke(_QWORD *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_msgSend(location[0], "setDestinationNameVariants:", a1[4]);
  objc_storeStrong(location, 0);
}

- (void)updateTripTravelEstimates:(id)a3
{
  CPNavigationManager *v3;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(id *, void *);
  void *v8;
  id v9;
  id location[2];
  CPSTemplateInstance *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[CPSTemplateInstance navigationManager](v11, "navigationManager");
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __49__CPSTemplateInstance_updateTripTravelEstimates___block_invoke;
  v8 = &unk_24E26FC60;
  v9 = location[0];
  -[CPNavigationManager modifyRouteGuidance:](v3, "modifyRouteGuidance:");

  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

void __49__CPSTemplateInstance_updateTripTravelEstimates___block_invoke(id *a1, void *a2)
{
  id v2;
  id v3;
  void *v5;
  id v6;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v2 = (id)objc_msgSend(a1[4], "distanceRemaining");
  objc_msgSend(location[0], "setDistanceRemaining:");

  v3 = (id)objc_msgSend(a1[4], "distanceRemainingToDisplay");
  objc_msgSend(location[0], "setDistanceRemainingDisplay:");

  objc_msgSend(a1[4], "timeRemaining");
  objc_msgSend(location[0], "setTimeRemaining:");
  v5 = (void *)MEMORY[0x24BDBCE60];
  objc_msgSend(a1[4], "timeRemaining");
  v6 = (id)objc_msgSend(v5, "dateWithTimeIntervalSinceNow:");
  objc_msgSend(location[0], "setEstimatedTimeOfArrival:");

  objc_storeStrong(location, 0);
}

- (void)updateTravelEstimates:(id)a3 forManeuver:(id)a4
{
  CPNavigationManager *v5;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(id *, void *);
  void *v10;
  id v11;
  id v12;
  id v13;
  id location[2];
  CPSTemplateInstance *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = 0;
  objc_storeStrong(&v13, a4);
  v5 = -[CPSTemplateInstance navigationManager](v15, "navigationManager");
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __57__CPSTemplateInstance_updateTravelEstimates_forManeuver___block_invoke;
  v10 = &unk_24E26FCC8;
  v11 = v13;
  v12 = location[0];
  -[CPNavigationManager modifyRouteGuidance:](v5, "modifyRouteGuidance:");

  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

void __57__CPSTemplateInstance_updateTravelEstimates_forManeuver___block_invoke(id *a1, void *a2)
{
  id v2;
  id v3;
  int v5;
  id v6;
  id v7;
  BOOL v8;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v7 = (id)objc_msgSend(location[0], "currentManeuverIndexes");
  v6 = (id)objc_msgSend(v7, "firstObject");
  v5 = objc_msgSend(v6, "unsignedIntValue");
  v8 = v5 != (unsigned __int16)objc_msgSend(a1[4], "index");

  if (!v8)
  {
    v2 = (id)objc_msgSend(a1[5], "distanceRemaining");
    objc_msgSend(location[0], "setDistanceRemainingToNextManeuver:");

    v3 = (id)objc_msgSend(a1[5], "distanceRemainingToDisplay");
    objc_msgSend(location[0], "setDistanceRemainingToNextManeuverDisplay:");

  }
  objc_storeStrong(location, 0);
}

- (void)cancelTrip
{
  CPNavigationManager *v2;
  CPNavigationManager *v3;

  v2 = -[CPSTemplateInstance navigationManager](self, "navigationManager");
  -[CPNavigationManager resetRouteGuidance](v2, "resetRouteGuidance");

  v3 = -[CPSTemplateInstance navigationManager](self, "navigationManager");
  -[CPNavigationManager releaseNavigationOwnership](v3, "releaseNavigationOwnership");

}

- (void)addManeuvers:(id)a3
{
  CPNavigationManager *v3;
  id location[2];
  CPSTemplateInstance *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[CPSTemplateInstance navigationManager](v5, "navigationManager");
  -[CPNavigationManager addManeuvers:](v3, "addManeuvers:", location[0]);

  objc_storeStrong(location, 0);
}

- (void)addLaneGuidances:(id)a3
{
  CPNavigationManager *v3;
  id location[2];
  CPSTemplateInstance *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[CPSTemplateInstance navigationManager](v5, "navigationManager");
  -[CPNavigationManager addLaneGuidances:](v3, "addLaneGuidances:", location[0]);

  objc_storeStrong(location, 0);
}

- (void)setActiveManeuvers:(id)a3
{
  CPNavigationManager *v3;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(_QWORD *, void *);
  void *v8;
  id v9;
  id location[2];
  CPSTemplateInstance *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[CPSTemplateInstance navigationManager](v11, "navigationManager");
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __42__CPSTemplateInstance_setActiveManeuvers___block_invoke;
  v8 = &unk_24E26FC60;
  v9 = location[0];
  -[CPNavigationManager modifyRouteGuidance:](v3, "modifyRouteGuidance:");

  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

void __42__CPSTemplateInstance_setActiveManeuvers___block_invoke(_QWORD *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_msgSend(location[0], "setGuidanceState:", 1);
  objc_msgSend(location[0], "setCurrentManeuvers:", a1[4]);
  objc_storeStrong(location, 0);
}

- (void)navigationOwnershipChangedToOwner:(unint64_t)a3
{
  CPSNavigator *v3;
  NSObject *log;
  os_log_type_t type;
  __CFString *v6;
  CPSNavigator *v7;
  __CFString *v8;
  os_log_type_t v9;
  id v10;
  unint64_t v11;
  SEL v12;
  CPSTemplateInstance *v13;
  uint8_t v14[40];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v13 = self;
  v12 = a2;
  v11 = a3;
  v10 = CarPlaySupportGeneralLogging();
  v9 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
  {
    log = v10;
    type = v9;
    v7 = -[CPSTemplateInstance navigator](v13, "navigator");
    v6 = NSStringFromNavigationOwner(v11);
    v8 = v6;
    __os_log_helper_16_2_3_8_64_8_64_8_64((uint64_t)v14, (uint64_t)v13, (uint64_t)v7, (uint64_t)v8);
    _os_log_impl(&dword_21E389000, log, type, "%@: Informing %@ navigation ownership changed to %@", v14, 0x20u);

    objc_storeStrong((id *)&v8, 0);
  }
  objc_storeStrong(&v10, 0);
  v3 = -[CPSTemplateInstance navigator](v13, "navigator");
  -[CPSNavigator navigationOwnershipChangedToOwner:](v3, "navigationOwnershipChangedToOwner:", v11);

  if (v11 != 1)
    -[CPSTemplateInstance cancelTrip](v13, "cancelTrip");
}

- (void)didCreateNavigator:(id)a3
{
  CPNavigationManager *v3;
  __int16 v4;
  id v5;
  id v6;
  NSArray *v7;
  NSEnumerator *v8;
  NSMapTable *v9;
  CPSTemplateEnvironment *v10;
  BOOL v11;
  char v12;
  CPNavigationManager *v13;
  id v14;
  uint64_t v15;
  int v16;
  int v17;
  void (*v18)(id *, void *);
  void *v19;
  id v20;
  os_log_type_t v21;
  id v22;
  id location[2];
  CPSTemplateInstance *v24;
  uint8_t v25[24];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v22 = CarPlaySupportGeneralLogging();
  v21 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v25, (uint64_t)v24, (uint64_t)location[0]);
    _os_log_impl(&dword_21E389000, (os_log_t)v22, v21, "%@: did create navigator %@", v25, 0x16u);
  }
  objc_storeStrong(&v22, 0);
  -[CPSTemplateInstance setNavigator:](v24, "setNavigator:", location[0]);
  v14 = (id)objc_msgSend(location[0], "trip");
  v12 = objc_msgSend(v14, "sendsNavigationMetadata");
  v13 = -[CPSTemplateInstance navigationManager](v24, "navigationManager");
  -[CPNavigationManager setSupportsAccNav:](v13, "setSupportsAccNav:", v12 & 1);

  if (v24->_dashboardGuidanceViewController)
  {
    objc_msgSend(location[0], "addDisplayDelegate:", v24->_dashboardGuidanceViewController);
    objc_msgSend(location[0], "addDisplayDelegate:", v24->_dashboardEstimatesViewController);
  }
  if (v24->_instrumentClusterCardViewController)
    objc_msgSend(location[0], "addDisplayDelegate:", v24->_instrumentClusterCardViewController);
  if (v24->_instrumentClusterMapETAViewController)
    objc_msgSend(location[0], "addDisplayDelegate:", v24->_instrumentClusterMapETAViewController);
  v10 = -[CPSTemplateInstance templateEnvironment](v24, "templateEnvironment");
  v11 = -[CPSTemplateEnvironment supportsInstrumentCluster](v10, "supportsInstrumentCluster");

  if (v11)
    objc_msgSend(location[0], "setAppSupportsInstrumentCluster:", 1);
  v3 = -[CPSTemplateInstance navigationManager](v24, "navigationManager");
  -[CPNavigationManager requestNavigationOwnership](v3, "requestNavigationOwnership");

  objc_msgSend(location[0], "setMetadataDelegate:", v24);
  v6 = (id)objc_msgSend(location[0], "trip");
  v4 = objc_msgSend(v6, "destinationTimeZoneOffsetFromGMT");
  v5 = (id)objc_msgSend(location[0], "metadataDelegate");
  objc_msgSend(v5, "setDestinationTimeZoneOffsetMinutes:", v4);

  v9 = -[CPSTemplateInstance instrumentClusterViewControllerMapTable](v24, "instrumentClusterViewControllerMapTable");
  v8 = -[NSMapTable objectEnumerator](v9, "objectEnumerator");
  v7 = -[NSEnumerator allObjects](v8, "allObjects");
  v15 = MEMORY[0x24BDAC760];
  v16 = -1073741824;
  v17 = 0;
  v18 = __42__CPSTemplateInstance_didCreateNavigator___block_invoke;
  v19 = &unk_24E26FCF0;
  v20 = location[0];
  -[NSArray enumerateObjectsUsingBlock:](v7, "enumerateObjectsUsingBlock:", &v15);

  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
}

void __42__CPSTemplateInstance_didCreateNavigator___block_invoke(id *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_msgSend(a1[4], "addDisplayDelegate:", location[0]);
  objc_storeStrong(location, 0);
}

- (void)setWindowSceneForMapWidgetScene:(id)a3
{
  CPSApplicationStateMonitor *v3;
  id location[2];
  CPSTemplateInstance *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeWeak((id *)&v5->_windowSceneForMapWidgetScene, location[0]);
  v3 = -[CPSTemplateInstance applicationStateMonitor](v5, "applicationStateMonitor");
  -[CPSApplicationStateMonitor setWindowSceneForMapWidgetScene:](v3, "setWindowSceneForMapWidgetScene:", location[0]);

  objc_storeStrong(location, 0);
}

- (void)setWindowSceneForGuidanceWidgetScene:(id)a3
{
  CPSApplicationStateMonitor *v3;
  id location[2];
  CPSTemplateInstance *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeWeak((id *)&v5->_windowSceneForGuidanceWidgetScene, location[0]);
  v3 = -[CPSTemplateInstance applicationStateMonitor](v5, "applicationStateMonitor");
  -[CPSApplicationStateMonitor setWindowSceneForGuidanceWidgetScene:](v3, "setWindowSceneForGuidanceWidgetScene:", location[0]);

  objc_storeStrong(location, 0);
}

- (void)setWindowSceneForTemplateApplicationScene:(id)a3
{
  CPSApplicationStateMonitor *v3;
  id location[2];
  CPSTemplateInstance *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeWeak((id *)&v5->_windowSceneForTemplateApplicationScene, location[0]);
  v3 = -[CPSTemplateInstance applicationStateMonitor](v5, "applicationStateMonitor");
  -[CPSApplicationStateMonitor setWindowSceneForTemplateApplicationScene:](v3, "setWindowSceneForTemplateApplicationScene:", location[0]);

  objc_storeStrong(location, 0);
}

- (void)hostConnectToClient
{
  NSObject *log;
  os_log_type_t type;
  uint8_t v4[7];
  os_log_type_t v5;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = CarPlaySupportGeneralLogging();
  v5 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    log = location[0];
    type = v5;
    __os_log_helper_16_0_0(v4);
    _os_log_impl(&dword_21E389000, log, type, "Cluster connection established", v4, 2u);
  }
  objc_storeStrong(location, 0);
}

- (void)hostSetInactiveVariants:(id)a3
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(id *);
  void *v8;
  CPSTemplateInstance *v9;
  id v10;
  id location[2];
  CPSTemplateInstance *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = MEMORY[0x24BDAC9B8];
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __47__CPSTemplateInstance_hostSetInactiveVariants___block_invoke;
  v8 = &unk_24E26EF28;
  v9 = v12;
  v10 = location[0];
  dispatch_async(queue, &v4);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

void __47__CPSTemplateInstance_hostSetInactiveVariants___block_invoke(id *a1)
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  int v6;
  int v7;
  void (*v8)(_QWORD *, void *);
  void *v9;
  id v10[3];

  v10[2] = a1;
  v10[1] = a1;
  objc_msgSend(a1[4], "setClusterInactiveVariants:", a1[5]);
  v4 = (id)objc_msgSend(a1[4], "instrumentClusterViewControllerMapTable");
  v3 = (id)objc_msgSend(v4, "objectEnumerator");
  v2 = (id)objc_msgSend(v3, "allObjects");
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __47__CPSTemplateInstance_hostSetInactiveVariants___block_invoke_2;
  v9 = &unk_24E26FCF0;
  v10[0] = a1[5];
  objc_msgSend(v2, "enumerateObjectsUsingBlock:");

  objc_storeStrong(v10, 0);
}

void __47__CPSTemplateInstance_hostSetInactiveVariants___block_invoke_2(_QWORD *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_msgSend(location[0], "setInactiveVariants:", a1[4]);
  objc_storeStrong(location, 0);
}

- (void)hostSetAttributedInactiveVariants:(id)a3
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(id *);
  void *v8;
  CPSTemplateInstance *v9;
  id v10;
  id location[2];
  CPSTemplateInstance *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = MEMORY[0x24BDAC9B8];
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __57__CPSTemplateInstance_hostSetAttributedInactiveVariants___block_invoke;
  v8 = &unk_24E26EF28;
  v9 = v12;
  v10 = location[0];
  dispatch_async(queue, &v4);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

void __57__CPSTemplateInstance_hostSetAttributedInactiveVariants___block_invoke(id *a1)
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  int v6;
  int v7;
  void (*v8)(_QWORD *, void *);
  void *v9;
  id v10[3];

  v10[2] = a1;
  v10[1] = a1;
  objc_msgSend(a1[4], "setClusterAttributedInactiveVariants:", a1[5]);
  v4 = (id)objc_msgSend(a1[4], "instrumentClusterViewControllerMapTable");
  v3 = (id)objc_msgSend(v4, "objectEnumerator");
  v2 = (id)objc_msgSend(v3, "allObjects");
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __57__CPSTemplateInstance_hostSetAttributedInactiveVariants___block_invoke_2;
  v9 = &unk_24E26FCF0;
  v10[0] = a1[5];
  objc_msgSend(v2, "enumerateObjectsUsingBlock:");

  objc_storeStrong(v10, 0);
}

void __57__CPSTemplateInstance_hostSetAttributedInactiveVariants___block_invoke_2(_QWORD *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_msgSend(location[0], "setAttributedInactiveVariants:", a1[4]);
  objc_storeStrong(location, 0);
}

- (NSString)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (CPSOverlayViewController)overlayViewController
{
  return self->_overlayViewController;
}

- (void)setOverlayViewController:(id)a3
{
  objc_storeStrong((id *)&self->_overlayViewController, a3);
}

- (FBScene)scene
{
  return (FBScene *)objc_loadWeakRetained((id *)&self->_scene);
}

- (UIWindowScene)windowSceneForTemplateApplicationScene
{
  return (UIWindowScene *)objc_loadWeakRetained((id *)&self->_windowSceneForTemplateApplicationScene);
}

- (UIWindowScene)windowSceneForMapWidgetScene
{
  return (UIWindowScene *)objc_loadWeakRetained((id *)&self->_windowSceneForMapWidgetScene);
}

- (UIWindowScene)windowSceneForGuidanceWidgetScene
{
  return (UIWindowScene *)objc_loadWeakRetained((id *)&self->_windowSceneForGuidanceWidgetScene);
}

- (UIWindowScene)windowSceneForInstrumentClusterMapWidgetScene
{
  return (UIWindowScene *)objc_loadWeakRetained((id *)&self->_windowSceneForInstrumentClusterMapWidgetScene);
}

- (void)setWindowSceneForInstrumentClusterMapWidgetScene:(id)a3
{
  objc_storeWeak((id *)&self->_windowSceneForInstrumentClusterMapWidgetScene, a3);
}

- (FBScene)mapWidgetScene
{
  return (FBScene *)objc_loadWeakRetained((id *)&self->_mapWidgetScene);
}

- (FBScene)instrumentClusterScene
{
  return (FBScene *)objc_loadWeakRetained((id *)&self->_instrumentClusterScene);
}

- (CPSClusterTemplateSetupDelegate)clusterSetupDelegate
{
  return (CPSClusterTemplateSetupDelegate *)objc_loadWeakRetained((id *)&self->_clusterSetupDelegate);
}

- (void)setClusterSetupDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_clusterSetupDelegate, a3);
}

- (CPSDashboardGuidanceViewController)dashboardGuidanceViewController
{
  return self->_dashboardGuidanceViewController;
}

- (CPSDashboardEstimatesViewController)dashboardEstimatesViewController
{
  return self->_dashboardEstimatesViewController;
}

- (CPSInstrumentClusterCardViewController)instrumentClusterCardViewController
{
  return self->_instrumentClusterCardViewController;
}

- (void)setInstrumentClusterCardViewController:(id)a3
{
  objc_storeStrong((id *)&self->_instrumentClusterCardViewController, a3);
}

- (CPSInstrumentClusterCardViewController)instrumentClusterMapETAViewController
{
  return self->_instrumentClusterMapETAViewController;
}

- (void)setInstrumentClusterMapETAViewController:(id)a3
{
  objc_storeStrong((id *)&self->_instrumentClusterMapETAViewController, a3);
}

- (UIEdgeInsets)currentSafeAreaInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  left = self->_currentSafeAreaInsets.left;
  top = self->_currentSafeAreaInsets.top;
  right = self->_currentSafeAreaInsets.right;
  bottom = self->_currentSafeAreaInsets.bottom;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setCurrentSafeAreaInsets:(UIEdgeInsets)a3
{
  self->_currentSafeAreaInsets = a3;
}

- (NSXPCListener)interfaceControllerListener
{
  return self->_interfaceControllerListener;
}

- (void)setInterfaceControllerListener:(id)a3
{
  objc_storeStrong((id *)&self->_interfaceControllerListener, a3);
}

- (NSXPCConnection)interfaceControllerConnection
{
  return self->_interfaceControllerConnection;
}

- (void)setInterfaceControllerConnection:(id)a3
{
  objc_storeStrong((id *)&self->_interfaceControllerConnection, a3);
}

- (CPTemplateServiceClientInterface)interfaceControllerRemoteObjectProxy
{
  return self->_interfaceControllerRemoteObjectProxy;
}

- (void)setInterfaceControllerRemoteObjectProxy:(id)a3
{
  objc_storeStrong((id *)&self->_interfaceControllerRemoteObjectProxy, a3);
}

- (NSXPCListener)dashboardControllerListener
{
  return self->_dashboardControllerListener;
}

- (void)setDashboardControllerListener:(id)a3
{
  objc_storeStrong((id *)&self->_dashboardControllerListener, a3);
}

- (NSXPCConnection)dashboardControllerConnection
{
  return self->_dashboardControllerConnection;
}

- (void)setDashboardControllerConnection:(id)a3
{
  objc_storeStrong((id *)&self->_dashboardControllerConnection, a3);
}

- (CPDashboardClientInterface)dashboardControllerRemoteObjectProxy
{
  return self->_dashboardControllerRemoteObjectProxy;
}

- (void)setDashboardControllerRemoteObjectProxy:(id)a3
{
  objc_storeStrong((id *)&self->_dashboardControllerRemoteObjectProxy, a3);
}

- (NSXPCListener)instrumentClusterControllerListener
{
  return self->_instrumentClusterControllerListener;
}

- (void)setInstrumentClusterControllerListener:(id)a3
{
  objc_storeStrong((id *)&self->_instrumentClusterControllerListener, a3);
}

- (NSXPCConnection)instrumentClusterControllerConnection
{
  return self->_instrumentClusterControllerConnection;
}

- (void)setInstrumentClusterControllerConnection:(id)a3
{
  objc_storeStrong((id *)&self->_instrumentClusterControllerConnection, a3);
}

- (NSMutableDictionary)identifierToViewControllerDictionary
{
  return self->_identifierToViewControllerDictionary;
}

- (void)setIdentifierToViewControllerDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_identifierToViewControllerDictionary, a3);
}

- (CPSBannerSource)bannerSource
{
  return self->_bannerSource;
}

- (void)setBannerSource:(id)a3
{
  objc_storeStrong((id *)&self->_bannerSource, a3);
}

- (UIViewController)rootViewController
{
  return self->_rootViewController;
}

- (void)setRootViewController:(id)a3
{
  objc_storeStrong((id *)&self->_rootViewController, a3);
}

- (CPSApplicationStateMonitor)applicationStateMonitor
{
  return self->_applicationStateMonitor;
}

- (void)setApplicationStateMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_applicationStateMonitor, a3);
}

- (NSUUID)actionSheetIdentifier
{
  return self->_actionSheetIdentifier;
}

- (void)setActionSheetIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (CPSTabBarViewController)tabBarViewController
{
  return self->_tabBarViewController;
}

- (void)setTabBarViewController:(id)a3
{
  objc_storeStrong((id *)&self->_tabBarViewController, a3);
}

- (CPSTemplateEnvironment)templateEnvironment
{
  return self->_templateEnvironment;
}

- (void)setTemplateEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_templateEnvironment, a3);
}

- (SiriDirectActionSource)siriActivationSource
{
  return self->_siriActivationSource;
}

- (void)setSiriActivationSource:(id)a3
{
  objc_storeStrong((id *)&self->_siriActivationSource, a3);
}

- (NSMapTable)instrumentClusterViewControllerMapTable
{
  return self->_instrumentClusterViewControllerMapTable;
}

- (void)setInstrumentClusterViewControllerMapTable:(id)a3
{
  objc_storeStrong((id *)&self->_instrumentClusterViewControllerMapTable, a3);
}

- (NSArray)clusterInactiveVariants
{
  return self->_clusterInactiveVariants;
}

- (void)setClusterInactiveVariants:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (NSArray)clusterAttributedInactiveVariants
{
  return self->_clusterAttributedInactiveVariants;
}

- (void)setClusterAttributedInactiveVariants:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (CPNavigationManager)navigationManager
{
  return self->_navigationManager;
}

- (void)setNavigationManager:(id)a3
{
  objc_storeStrong((id *)&self->_navigationManager, a3);
}

- (CPSNavigator)navigator
{
  return (CPSNavigator *)objc_loadWeakRetained((id *)&self->_navigator);
}

- (void)setNavigator:(id)a3
{
  objc_storeWeak((id *)&self->_navigator, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_navigator);
  objc_storeStrong((id *)&self->_navigationManager, 0);
  objc_storeStrong((id *)&self->_clusterAttributedInactiveVariants, 0);
  objc_storeStrong((id *)&self->_clusterInactiveVariants, 0);
  objc_storeStrong((id *)&self->_instrumentClusterViewControllerMapTable, 0);
  objc_storeStrong((id *)&self->_siriActivationSource, 0);
  objc_storeStrong((id *)&self->_templateEnvironment, 0);
  objc_storeStrong((id *)&self->_tabBarViewController, 0);
  objc_storeStrong((id *)&self->_actionSheetIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationStateMonitor, 0);
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_storeStrong((id *)&self->_bannerSource, 0);
  objc_storeStrong((id *)&self->_identifierToViewControllerDictionary, 0);
  objc_storeStrong((id *)&self->_instrumentClusterControllerConnection, 0);
  objc_storeStrong((id *)&self->_instrumentClusterControllerListener, 0);
  objc_storeStrong((id *)&self->_dashboardControllerRemoteObjectProxy, 0);
  objc_storeStrong((id *)&self->_dashboardControllerConnection, 0);
  objc_storeStrong((id *)&self->_dashboardControllerListener, 0);
  objc_storeStrong((id *)&self->_interfaceControllerRemoteObjectProxy, 0);
  objc_storeStrong((id *)&self->_interfaceControllerConnection, 0);
  objc_storeStrong((id *)&self->_interfaceControllerListener, 0);
  objc_storeStrong((id *)&self->_instrumentClusterMapETAViewController, 0);
  objc_storeStrong((id *)&self->_instrumentClusterCardViewController, 0);
  objc_storeStrong((id *)&self->_dashboardEstimatesViewController, 0);
  objc_storeStrong((id *)&self->_dashboardGuidanceViewController, 0);
  objc_destroyWeak((id *)&self->_clusterSetupDelegate);
  objc_destroyWeak((id *)&self->_instrumentClusterScene);
  objc_destroyWeak((id *)&self->_mapWidgetScene);
  objc_destroyWeak((id *)&self->_windowSceneForInstrumentClusterMapWidgetScene);
  objc_destroyWeak((id *)&self->_windowSceneForGuidanceWidgetScene);
  objc_destroyWeak((id *)&self->_windowSceneForMapWidgetScene);
  objc_destroyWeak((id *)&self->_windowSceneForTemplateApplicationScene);
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_overlayViewController, 0);
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
}

@end
