@implementation DADeviceObserverLocal

- (void)discoverAllDevicesWithCompletionHandler:(id)a3
{
  id v3;

  v3 = -[DADeviceObserverLocal beginDiscoveringDevicesWithHandler:](self, "beginDiscoveringDevicesWithHandler:", a3);
}

- (id)beginDiscoveringDevicesWithHandler:(id)a3
{
  id v3;
  dispatch_queue_global_t global_queue;
  NSObject *v5;
  id v6;
  void *v7;
  _QWORD block[4];
  id v10;

  v3 = a3;
  global_queue = dispatch_get_global_queue(21, 0);
  v5 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002525C;
  block[3] = &unk_1001329C8;
  v10 = v3;
  v6 = v3;
  dispatch_async(v5, block);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  return v7;
}

@end
