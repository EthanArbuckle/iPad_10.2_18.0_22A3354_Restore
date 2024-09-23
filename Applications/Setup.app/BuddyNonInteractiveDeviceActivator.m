@implementation BuddyNonInteractiveDeviceActivator

- (void)dealloc
{
  BuddyActivationEngine *v2;
  objc_super v3;
  SEL v4;
  BuddyNonInteractiveDeviceActivator *v5;

  v5 = self;
  v4 = a2;
  v2 = -[BuddyNonInteractiveDeviceActivator activationEngine](self, "activationEngine");
  -[BuddyActivationEngine cancel](v2, "cancel");

  v3.receiver = v5;
  v3.super_class = (Class)BuddyNonInteractiveDeviceActivator;
  -[BuddyNonInteractiveDeviceActivator dealloc](&v3, "dealloc");
}

- (BuddyNonInteractiveDeviceActivator)initWithActivationConfiguration:(id)a3 activationEngine:(id)a4
{
  id v5;
  BuddyNonInteractiveDeviceActivator *v6;
  objc_super v8;
  id obj;
  id location[2];
  id v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  obj = 0;
  objc_storeStrong(&obj, a4);
  v5 = v11;
  v11 = 0;
  v8.receiver = v5;
  v8.super_class = (Class)BuddyNonInteractiveDeviceActivator;
  v11 = -[BuddyNonInteractiveDeviceActivator init](&v8, "init");
  objc_storeStrong(&v11, v11);
  if (v11)
  {
    objc_storeStrong((id *)v11 + 2, location[0]);
    objc_storeStrong((id *)v11 + 3, obj);
  }
  v6 = (BuddyNonInteractiveDeviceActivator *)v11;
  objc_storeStrong(&obj, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v11, 0);
  return v6;
}

+ (id)activatorUsingWiFi
{
  id v2;
  BuddyActivationConfiguration *v3;
  id v4;
  id v5;

  v2 = objc_alloc((Class)a1);
  v3 = objc_alloc_init(BuddyActivationConfiguration);
  v4 = +[BuddyActivationEngine wifiActivationEngineWithOverrideActivationURL:sessionURL:](BuddyActivationEngine, "wifiActivationEngineWithOverrideActivationURL:sessionURL:", 0, 0, a2, a1);
  v5 = objc_msgSend(v2, "initWithActivationConfiguration:activationEngine:", v3, v4);

  return v5;
}

- (BOOL)isActivated
{
  BuddyActivationConfiguration *v2;
  unsigned __int8 v3;

  v2 = -[BuddyNonInteractiveDeviceActivator activationConfiguration](self, "activationConfiguration", a2, self);
  v3 = -[BuddyActivationConfiguration isActivated](v2, "isActivated");

  return v3 & 1;
}

- (void)activateWithCompletion:(id)a3
{
  void *v3;
  void **block;
  int v5;
  int v6;
  void (*v7)(id *);
  void *v8;
  BuddyNonInteractiveDeviceActivator *v9;
  id v10;
  id location[2];
  BuddyNonInteractiveDeviceActivator *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_1000FA468;
  v8 = &unk_1002806E0;
  v9 = v12;
  v10 = location[0];
  dispatch_async((dispatch_queue_t)v3, &block);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)activationFinishedWithData:(id)a3 responseHeaders:(id)a4 error:(id)a5 completionHandler:(id)a6
{
  void *v9;
  void **block;
  int v11;
  int v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id v16;
  BuddyNonInteractiveDeviceActivator *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id location[2];
  BuddyNonInteractiveDeviceActivator *v24;

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
  v9 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  v11 = -1073741824;
  v12 = 0;
  v13 = sub_1000FA89C;
  v14 = &unk_100282E60;
  v15 = v21;
  v19 = v20;
  v16 = v22;
  v17 = v24;
  v18 = location[0];
  dispatch_async((dispatch_queue_t)v9, &block);

  objc_storeStrong(&v18, 0);
  objc_storeStrong((id *)&v17, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
}

- (void)activateWithData:(id)a3 headers:(id)a4 completion:(id)a5
{
  NSObject *v7;
  void **block;
  int v9;
  int v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id v14;
  BuddyNonInteractiveDeviceActivator *v15;
  id v16;
  id v17;
  id v18;
  id location[2];
  BuddyNonInteractiveDeviceActivator *v20;

  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18 = 0;
  objc_storeStrong(&v18, a4);
  v17 = 0;
  objc_storeStrong(&v17, a5);
  v7 = dispatch_get_global_queue(25, 0);
  block = _NSConcreteStackBlock;
  v9 = -1073741824;
  v10 = 0;
  v11 = sub_1000FADD4;
  v12 = &unk_100282E88;
  v13 = v18;
  v14 = location[0];
  v15 = v20;
  v16 = v17;
  dispatch_async(v7, &block);

  objc_storeStrong(&v16, 0);
  objc_storeStrong((id *)&v15, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
}

- (BuddyActivationConfiguration)activationConfiguration
{
  return self->_activationConfiguration;
}

- (BuddyActivationEngine)activationEngine
{
  return self->_activationEngine;
}

- (BOOL)isActivating
{
  return self->_activating;
}

- (void)setActivating:(BOOL)a3
{
  self->_activating = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationEngine, 0);
  objc_storeStrong((id *)&self->_activationConfiguration, 0);
}

@end
