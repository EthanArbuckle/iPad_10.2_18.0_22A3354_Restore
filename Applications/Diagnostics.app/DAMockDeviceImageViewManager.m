@implementation DAMockDeviceImageViewManager

+ (id)sharedInstance
{
  if (qword_10016E8E8 != -1)
    dispatch_once(&qword_10016E8E8, &stru_1001336C8);
  return (id)qword_10016E8E0;
}

- (void)deviceImageViewForDeviceState:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  dispatch_queue_global_t global_queue;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a3;
  v6 = a4;
  global_queue = dispatch_get_global_queue(0, 0);
  v8 = objc_claimAutoreleasedReturnValue(global_queue);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001DE60;
  v11[3] = &unk_100132860;
  v12 = v5;
  v13 = v6;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, v11);

}

@end
