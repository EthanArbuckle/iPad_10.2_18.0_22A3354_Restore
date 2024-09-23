@implementation CPSApplicationStateMonitor

- (CPSApplicationStateMonitor)init
{
  dispatch_queue_t v2;
  OS_dispatch_queue *stateObserverQueue;
  id v4;
  uint64_t v5;
  CARObserverHashTable *stateObservers;
  CPSApplicationStateMonitor *v8;
  CPSApplicationStateMonitor *v9;
  objc_super v10;
  SEL v11;
  CPSApplicationStateMonitor *v12;

  v11 = a2;
  v12 = 0;
  v10.receiver = self;
  v10.super_class = (Class)CPSApplicationStateMonitor;
  v9 = -[CPSApplicationStateMonitor init](&v10, sel_init);
  v12 = v9;
  objc_storeStrong((id *)&v12, v9);
  if (v9)
  {
    v2 = dispatch_queue_create("com.apple.carplaysupport.observerqueue", 0);
    stateObserverQueue = v12->_stateObserverQueue;
    v12->_stateObserverQueue = (OS_dispatch_queue *)v2;

    v4 = objc_alloc(MEMORY[0x24BE15228]);
    v5 = objc_msgSend(v4, "initWithProtocol:callbackQueue:", &unk_25541F428, v12->_stateObserverQueue);
    stateObservers = v12->_stateObservers;
    v12->_stateObservers = (CARObserverHashTable *)v5;

  }
  v8 = v12;
  objc_storeStrong((id *)&v12, 0);
  return v8;
}

- (void)_observeScene:(id)a3
{
  id v3;
  id v4;
  id v5;
  id location[2];
  CPSApplicationStateMonitor *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v3, "addObserver:selector:name:object:", v7, sel__sceneWillEnterForeground_, *MEMORY[0x24BDF7D40], location[0]);

  v4 = (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v4, "addObserver:selector:name:object:", v7, sel__sceneActivated_, *MEMORY[0x24BDF7D18], location[0]);

  v5 = (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v5, "addObserver:selector:name:object:", v7, sel__sceneDidEnterBackground_, *MEMORY[0x24BDF7D28], location[0]);

  objc_storeStrong(location, 0);
}

- (void)setWindowSceneForGuidanceWidgetScene:(id)a3
{
  id WeakRetained;
  CPSApplicationStateMonitor *v4;
  id v5;
  BOOL v6;
  id location[2];
  CPSApplicationStateMonitor *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  WeakRetained = objc_loadWeakRetained((id *)&v8->_windowSceneForGuidanceWidgetScene);
  v6 = WeakRetained == location[0];

  if (!v6)
  {
    objc_storeWeak((id *)&v8->_windowSceneForGuidanceWidgetScene, location[0]);
    v4 = v8;
    v5 = objc_loadWeakRetained((id *)&v8->_windowSceneForGuidanceWidgetScene);
    -[CPSApplicationStateMonitor _observeScene:](v4, "_observeScene:");

  }
  objc_storeStrong(location, 0);
}

- (void)setWindowSceneForMapWidgetScene:(id)a3
{
  id WeakRetained;
  CPSApplicationStateMonitor *v4;
  id v5;
  BOOL v6;
  id location[2];
  CPSApplicationStateMonitor *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  WeakRetained = objc_loadWeakRetained((id *)&v8->_windowSceneForMapWidgetScene);
  v6 = WeakRetained == location[0];

  if (!v6)
  {
    objc_storeWeak((id *)&v8->_windowSceneForMapWidgetScene, location[0]);
    v4 = v8;
    v5 = objc_loadWeakRetained((id *)&v8->_windowSceneForMapWidgetScene);
    -[CPSApplicationStateMonitor _observeScene:](v4, "_observeScene:");

  }
  objc_storeStrong(location, 0);
}

- (void)setWindowSceneForTemplateApplicationScene:(id)a3
{
  id WeakRetained;
  CPSApplicationStateMonitor *v4;
  id v5;
  BOOL v6;
  id location[2];
  CPSApplicationStateMonitor *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  WeakRetained = objc_loadWeakRetained((id *)&v8->_windowSceneForTemplateApplicationScene);
  v6 = WeakRetained == location[0];

  if (!v6)
  {
    objc_storeWeak((id *)&v8->_windowSceneForTemplateApplicationScene, location[0]);
    v4 = v8;
    v5 = objc_loadWeakRetained((id *)&v8->_windowSceneForTemplateApplicationScene);
    -[CPSApplicationStateMonitor _observeScene:](v4, "_observeScene:");

  }
  objc_storeStrong(location, 0);
}

- (void)dealloc
{
  id v2;
  objc_super v3;
  SEL v4;
  CPSApplicationStateMonitor *v5;

  v5 = self;
  v4 = a2;
  v2 = (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v2, "removeObserver:", v5);

  v3.receiver = v5;
  v3.super_class = (Class)CPSApplicationStateMonitor;
  -[CPSApplicationStateMonitor dealloc](&v3, sel_dealloc);
}

- (void)addApplicationStateObserver:(id)a3
{
  id location[2];
  CPSApplicationStateMonitor *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[CARObserverHashTable addObserver:](v4->_stateObservers, "addObserver:", location[0]);
  objc_storeStrong(location, 0);
}

- (void)removeApplicationStateObserver:(id)a3
{
  id location[2];
  CPSApplicationStateMonitor *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[CARObserverHashTable removeObserver:](v4->_stateObservers, "removeObserver:", location[0]);
  objc_storeStrong(location, 0);
}

- (BOOL)isApplicationActive
{
  UIWindowScene *v4;
  BOOL v5;
  UIWindowScene *v6;
  BOOL v7;
  UIWindowScene *v8;
  BOOL v9;
  char v10;

  v4 = -[CPSApplicationStateMonitor windowSceneForTemplateApplicationScene](self, "windowSceneForTemplateApplicationScene");
  v5 = -[CPSApplicationStateMonitor _sceneIsForeground:](self, "_sceneIsForeground:");

  v6 = -[CPSApplicationStateMonitor windowSceneForGuidanceWidgetScene](self, "windowSceneForGuidanceWidgetScene");
  v7 = -[CPSApplicationStateMonitor _sceneIsForeground:](self, "_sceneIsForeground:");

  v8 = -[CPSApplicationStateMonitor windowSceneForMapWidgetScene](self, "windowSceneForMapWidgetScene");
  v9 = -[CPSApplicationStateMonitor _sceneIsForeground:](self, "_sceneIsForeground:");

  v10 = 1;
  if (!v5)
  {
    v10 = 1;
    if (!v7)
      v10 = v9;
  }
  return v10 & 1;
}

- (BOOL)_sceneIsForeground:(id)a3
{
  BOOL v4;
  id location[3];
  BOOL v6;

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    v4 = 1;
    if (objc_msgSend(location[0], "activationState"))
      v4 = objc_msgSend(location[0], "activationState") == 1;
    v6 = v4;
  }
  else
  {
    v6 = 0;
  }
  objc_storeStrong(location, 0);
  return v6;
}

- (BOOL)canPostManeuverNotification
{
  return !-[CPSApplicationStateMonitor isApplicationActive](self, "isApplicationActive", a2, self);
}

- (BOOL)canPostNavigationAlertNotification
{
  UIWindowScene *v4;
  int v5;

  v4 = -[CPSApplicationStateMonitor windowSceneForTemplateApplicationScene](self, "windowSceneForTemplateApplicationScene");
  v5 = !-[CPSApplicationStateMonitor _sceneIsForeground:](self, "_sceneIsForeground:");

  return v5 & 1;
}

- (BOOL)templateApplicationSceneIsActive
{
  int v3;
  UIWindowScene *v4;
  char v5;
  UIWindowScene *v6;

  v4 = -[CPSApplicationStateMonitor windowSceneForTemplateApplicationScene](self, "windowSceneForTemplateApplicationScene");
  v5 = 0;
  if (v4)
  {
    v6 = -[CPSApplicationStateMonitor windowSceneForTemplateApplicationScene](self, "windowSceneForTemplateApplicationScene");
    v5 = 1;
    v3 = -[CPSApplicationStateMonitor _sceneIsForeground:](self, "_sceneIsForeground:");
  }
  else
  {
    v3 = 0;
  }
  if ((v5 & 1) != 0)

  return v3 != 0;
}

- (void)_notifyObserversForeground:(BOOL)a3
{
  -[CARObserverHashTable applicationStateMonitor:didBecomeActive:](self->_stateObservers, "applicationStateMonitor:didBecomeActive:", self, -[CPSApplicationStateMonitor isApplicationActive](self, "isApplicationActive"));
}

- (void)_sceneWillEnterForeground:(id)a3
{
  id location[2];
  CPSApplicationStateMonitor *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[CPSApplicationStateMonitor _notifyObserversForeground:](v4, "_notifyObserversForeground:", -[CPSApplicationStateMonitor isApplicationActive](v4, "isApplicationActive"));
  objc_storeStrong(location, 0);
}

- (void)_sceneActivated:(id)a3
{
  id location[2];
  CPSApplicationStateMonitor *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[CPSApplicationStateMonitor _notifyObserversForeground:](v4, "_notifyObserversForeground:", -[CPSApplicationStateMonitor isApplicationActive](v4, "isApplicationActive"));
  objc_storeStrong(location, 0);
}

- (void)_sceneDidEnterBackground:(id)a3
{
  id location[2];
  CPSApplicationStateMonitor *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[CPSApplicationStateMonitor _notifyObserversForeground:](v4, "_notifyObserversForeground:", -[CPSApplicationStateMonitor isApplicationActive](v4, "isApplicationActive"));
  objc_storeStrong(location, 0);
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

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (CARObserverHashTable)stateObservers
{
  return self->_stateObservers;
}

- (void)setStateObservers:(id)a3
{
  objc_storeStrong((id *)&self->_stateObservers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateObservers, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_destroyWeak((id *)&self->_windowSceneForGuidanceWidgetScene);
  objc_destroyWeak((id *)&self->_windowSceneForMapWidgetScene);
  objc_destroyWeak((id *)&self->_windowSceneForTemplateApplicationScene);
  objc_storeStrong((id *)&self->_stateObserverQueue, 0);
}

@end
