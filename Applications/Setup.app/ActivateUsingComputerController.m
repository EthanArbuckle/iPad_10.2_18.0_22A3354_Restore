@implementation ActivateUsingComputerController

- (ActivateUsingComputerController)init
{
  dispatch_queue_t v2;
  void *v3;
  ActivateUsingComputerController *v4;
  objc_super v6;
  SEL v7;
  id location;

  v7 = a2;
  location = 0;
  v6.receiver = self;
  v6.super_class = (Class)ActivateUsingComputerController;
  location = -[RestoreFromComputerController init](&v6, "init");
  objc_storeStrong(&location, location);
  if (location)
  {
    v2 = dispatch_queue_create("Computer Activation Queue", 0);
    v3 = (void *)*((_QWORD *)location + 9);
    *((_QWORD *)location + 9) = v2;

  }
  v4 = (ActivateUsingComputerController *)location;
  objc_storeStrong(&location, 0);
  return v4;
}

+ (unint64_t)applicableDispositions
{
  return 14;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  void **v5;
  int v6;
  int v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id location[2];
  ActivateUsingComputerController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = +[BuddyActivationConfiguration currentConfiguration](BuddyActivationConfiguration, "currentConfiguration");
  objc_msgSend(v3, "addDelegate:", v12);

  v4 = dispatch_get_global_queue(0, 0);
  v5 = _NSConcreteStackBlock;
  v6 = -1073741824;
  v7 = 0;
  v8 = sub_100138B88;
  v9 = &unk_100280780;
  v10 = location[0];
  dispatch_async(v4, &v5);

  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)isEphemeral
{
  return 1;
}

- (void)activationConfigurationChanged:(BOOL)a3 isActivated:(BOOL)a4
{
  void *v4;
  void **v5;
  int v6;
  int v7;
  void (*v8)(id *);
  void *v9;
  ActivateUsingComputerController *v10;
  BOOL v11;
  BOOL v12;
  BOOL v13;
  BOOL v14;
  SEL v15;
  ActivateUsingComputerController *v16;

  v16 = self;
  v15 = a2;
  v14 = a3;
  v13 = a4;
  if (a3)
  {
    v4 = &_dispatch_main_q;
    v5 = _NSConcreteStackBlock;
    v6 = -1073741824;
    v7 = 0;
    v8 = sub_100138CF0;
    v9 = &unk_100281DC8;
    v11 = v14;
    v10 = v16;
    v12 = v13;
    dispatch_async((dispatch_queue_t)v4, &v5);

    objc_storeStrong((id *)&v10, 0);
  }
}

- (BuddyMiscState)miscState
{
  return self->_miscState;
}

- (void)setMiscState:(id)a3
{
  objc_storeStrong((id *)&self->_miscState, a3);
}

- (BYSoftwareUpdateCache)softwareUpdateCache
{
  return self->_softwareUpdateCache;
}

- (void)setSoftwareUpdateCache:(id)a3
{
  objc_storeStrong((id *)&self->_softwareUpdateCache, a3);
}

- (BOOL)didActivate
{
  return self->_didActivate;
}

- (void)setDidActivate:(BOOL)a3
{
  self->_didActivate = a3;
}

- (OS_dispatch_queue)activationQueue
{
  return self->_activationQueue;
}

- (void)setActivationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_activationQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationQueue, 0);
  objc_storeStrong((id *)&self->_softwareUpdateCache, 0);
  objc_storeStrong((id *)&self->_miscState, 0);
}

@end
