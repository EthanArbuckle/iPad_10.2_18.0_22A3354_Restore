@implementation BluetoothScanController

- (void)start
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[BluetoothScanController checkPresence](self, "checkPresence"));
  if ((-[BluetoothScanController isCancelled](self, "isCancelled") & 1) == 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BluetoothScanController result](self, "result"));
    objc_msgSend(v3, "setStatusCode:", v4);

  }
  -[BluetoothScanController setFinished:](self, "setFinished:", 1);

}

- (id)checkPresence
{
  void *v3;
  dispatch_semaphore_t v4;
  dispatch_queue_t v5;
  OSDBluetooth *v6;
  NSObject *v7;
  id v8;
  _QWORD v10[5];
  NSObject *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  _UNKNOWN **v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_100003360;
  v17 = sub_100003370;
  v18 = &off_100008530;
  v3 = objc_autoreleasePoolPush();
  v4 = dispatch_semaphore_create(0);
  v5 = dispatch_queue_create((const char *)objc_msgSend(CFSTR("com.apple.Diagnostics.DABluetooth"), "UTF8String"), 0);
  v6 = objc_alloc_init(OSDBluetooth);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100003378;
  v10[3] = &unk_100008270;
  v10[4] = self;
  v12 = &v13;
  v7 = v4;
  v11 = v7;
  -[OSDBluetooth performScanOnQueue:timeout:gracePeriod:completionBlock:](v6, "performScanOnQueue:timeout:gracePeriod:completionBlock:", v5, v10, 10.0, 2.0);
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);

  objc_autoreleasePoolPop(v3);
  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

@end
