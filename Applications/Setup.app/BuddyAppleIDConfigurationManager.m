@implementation BuddyAppleIDConfigurationManager

+ (id)sharedManager
{
  id location;
  dispatch_once_t *v4;

  v4 = (dispatch_once_t *)&unk_1002EE9B0;
  location = 0;
  objc_storeStrong(&location, &stru_1002826B0);
  if (*v4 != -1)
    dispatch_once(v4, location);
  objc_storeStrong(&location, 0);
  return (id)qword_1002EE9A8;
}

- (BuddyAppleIDConfigurationManager)init
{
  dispatch_queue_t v2;
  void *v3;
  BuddyAppleIDConfigurationManager *v4;
  objc_super v6;
  SEL v7;
  id location;

  v7 = a2;
  location = 0;
  v6.receiver = self;
  v6.super_class = (Class)BuddyAppleIDConfigurationManager;
  location = -[BuddyAppleIDConfigurationManager init](&v6, "init");
  objc_storeStrong(&location, location);
  if (location)
  {
    v2 = dispatch_queue_create("com.apple.purplebuddy.urlconfigurationqueue", 0);
    v3 = (void *)*((_QWORD *)location + 2);
    *((_QWORD *)location + 2) = v2;

    *((_BYTE *)location + 24) = 1;
  }
  v4 = (BuddyAppleIDConfigurationManager *)location;
  objc_storeStrong(&location, 0);
  return v4;
}

- (void)getURLConfigurationWithHandler:(id)a3
{
  NSObject *v3;
  void **block;
  int v5;
  int v6;
  void (*v7)(id *);
  void *v8;
  BuddyAppleIDConfigurationManager *v9;
  id v10;
  id location[2];
  BuddyAppleIDConfigurationManager *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = dispatch_get_global_queue(21, 0);
  block = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_1000D463C;
  v8 = &unk_1002806E0;
  v9 = v12;
  v10 = location[0];
  dispatch_async(v3, &block);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (id)URLConfiguration
{
  NSObject *urlConfigurationQueue;
  id v3;
  void **v5;
  int v6;
  int v7;
  void (*v8);
  void *v9;
  id v10[2];
  uint64_t v11;
  uint64_t *v12;
  int v13;
  int v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17[3];

  v17[2] = self;
  v17[1] = (id)a2;
  v11 = 0;
  v12 = &v11;
  v13 = 838860800;
  v14 = 48;
  v15 = sub_1000D4870;
  v16 = sub_1000D48A0;
  v17[0] = 0;
  urlConfigurationQueue = self->_urlConfigurationQueue;
  v5 = _NSConcreteStackBlock;
  v6 = -1073741824;
  v7 = 0;
  v8 = sub_1000D48AC;
  v9 = &unk_100282378;
  v10[0] = self;
  v10[1] = &v11;
  dispatch_sync(urlConfigurationQueue, &v5);
  v3 = (id)v12[5];
  objc_storeStrong(v10, 0);
  _Block_object_dispose(&v11, 8);
  objc_storeStrong(v17, 0);
  return v3;
}

- (BOOL)isServiceEnabled
{
  return self->_serviceEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlConfigurationQueue, 0);
  objc_storeStrong((id *)&self->_configurationResponse, 0);
}

@end
