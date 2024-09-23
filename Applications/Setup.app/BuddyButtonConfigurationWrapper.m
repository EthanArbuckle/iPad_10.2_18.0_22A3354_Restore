@implementation BuddyButtonConfigurationWrapper

- (void)prepare:(id)a3
{
  id v3;
  void **v4;
  int v5;
  int v6;
  void (*v7)(NSObject *, char);
  void *v8;
  BuddyButtonConfigurationWrapper *v9;
  id v10;
  id location[2];
  BuddyButtonConfigurationWrapper *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = sub_1000F9A1C();
  v4 = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_1000F9B08;
  v8 = &unk_100280708;
  v9 = v12;
  v10 = location[0];
  objc_msgSend(v3, "preloadResourcesWithCompletion:", &v4);
  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (id)configurationCompleted
{
  return self->_configurationCompleted;
}

- (void)setConfigurationCompleted:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
  objc_storeStrong((id *)&self->_viewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong(&self->_configurationCompleted, 0);
}

@end
