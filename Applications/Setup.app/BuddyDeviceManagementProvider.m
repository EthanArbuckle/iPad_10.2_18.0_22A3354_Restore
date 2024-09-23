@implementation BuddyDeviceManagementProvider

- (void)loadSkipKeys:(id)a3
{
  NSArray *v3;
  id v4;
  void **v5;
  int v6;
  int v7;
  void (*v8)(NSObject *, void *, void *);
  void *v9;
  id v10;
  id v11;
  id location[3];
  uint64_t v13;

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = objc_alloc_init((Class)DMFFetchDevicePropertiesRequest);
  v13 = DMFDeviceSkippedSetupPanesKey;
  v3 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1);
  objc_msgSend(v11, "setPropertyKeys:", v3);

  v4 = +[DMFConnection systemConnection](DMFConnection, "systemConnection");
  v5 = _NSConcreteStackBlock;
  v6 = -1073741824;
  v7 = 0;
  v8 = sub_1000BD9E8;
  v9 = &unk_100282328;
  v10 = location[0];
  objc_msgSend(v4, "performRequest:completion:", v11, &v5);

  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

@end
