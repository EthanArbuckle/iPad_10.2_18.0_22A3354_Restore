@implementation SKUIOctaneBag

+ (id)shared
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100020B00;
  block[3] = &unk_100049D30;
  block[4] = a1;
  if (qword_100063338 != -1)
    dispatch_once(&qword_100063338, block);
  return (id)qword_100063330;
}

- (SKUIOctaneBag)init
{
  SKUIOctaneBag *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *dispatchQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SKUIOctaneBag;
  v2 = -[SKUIOctaneBag init](&v8, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("com.apple.StoreKit.UIService.OctaneBag.dispatch", v4);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100020BF8;
  block[3] = &unk_1000490B8;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
}

- (id)URLForKey:(id)a3
{
  return -[SKUIOctaneBag _bagValueForKey:ofType:](self, "_bagValueForKey:ofType:", a3, 5);
}

- (id)arrayForKey:(id)a3
{
  return -[SKUIOctaneBag _bagValueForKey:ofType:](self, "_bagValueForKey:ofType:", a3, 0);
}

- (id)BOOLForKey:(id)a3
{
  return -[SKUIOctaneBag _bagValueForKey:ofType:](self, "_bagValueForKey:ofType:", a3, 1);
}

- (void)createSnapshotWithCompletion:(id)a3
{
  void (**v4)(id, void *, id);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v4 = (void (**)(id, void *, id))a3;
  v5 = (void *)objc_opt_new(AMSSnapshotBagBuilder);
  objc_msgSend(v5, "setData:", self->_dictionary);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
  objc_msgSend(v5, "setExpirationDate:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess"));
  objc_msgSend(v5, "setProcessInfo:", v7);

  objc_msgSend(v5, "setProfile:", CFSTR("appstored"));
  objc_msgSend(v5, "setProfileVersion:", CFSTR("1"));
  v10 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "buildWithError:", &v10));
  v9 = v10;
  v4[2](v4, v8, v9);

}

- (id)dictionaryForKey:(id)a3
{
  return -[SKUIOctaneBag _bagValueForKey:ofType:](self, "_bagValueForKey:ofType:", a3, 6);
}

- (id)doubleForKey:(id)a3
{
  return -[SKUIOctaneBag _bagValueForKey:ofType:](self, "_bagValueForKey:ofType:", a3, 2);
}

- (id)integerForKey:(id)a3
{
  return -[SKUIOctaneBag _bagValueForKey:ofType:](self, "_bagValueForKey:ofType:", a3, 3);
}

- (id)stringForKey:(id)a3
{
  return -[SKUIOctaneBag _bagValueForKey:ofType:](self, "_bagValueForKey:ofType:", a3, 4);
}

- (int64_t)_activePort
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  void *v6;
  NSXPCConnection *v7;
  void *v8;
  int64_t v9;
  _QWORD v11[5];
  id location;
  id *p_location;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;

  connection = self->_connection;
  if (!connection)
  {
    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithMachServiceName:options:", CFSTR("com.apple.storekit.configuration.xpc"), 4096);
    v5 = self->_connection;
    self->_connection = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___ASDOctaneServiceProtocol));
    -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", v6);

    objc_initWeak(&location, self);
    v7 = self->_connection;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100020EF0;
    v16[3] = &unk_100048FD0;
    objc_copyWeak(&v17, &location);
    -[NSXPCConnection setInvalidationHandler:](v7, "setInvalidationHandler:", v16);
    -[NSXPCConnection resume](self->_connection, "resume");
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }
  location = 0;
  p_location = &location;
  v14 = 0x2020000000;
  v15 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", &stru_100049D70));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100020F28;
  v11[3] = &unk_100049D98;
  v11[4] = &location;
  objc_msgSend(v8, "getActivePortWithCompletion:", v11);

  v9 = (int64_t)p_location[3];
  _Block_object_dispose(&location, 8);
  return v9;
}

- (id)_bagValueForKey:(id)a3 ofType:(unint64_t)a4
{
  id v6;
  NSObject *dispatchQueue;
  id v8;
  void *v9;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  SKUIOctaneBag *v15;
  id v16;
  uint64_t *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_10002104C;
  v23 = sub_10002105C;
  v24 = 0;
  dispatchQueue = self->_dispatchQueue;
  v11 = _NSConcreteStackBlock;
  v12 = 3221225472;
  v13 = sub_100021064;
  v14 = &unk_100049DC0;
  v15 = self;
  v17 = &v19;
  v8 = v6;
  v16 = v8;
  v18 = a4;
  dispatch_sync(dispatchQueue, &v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[AMSBagValue frozenBagValueWithKey:value:valueType:](AMSBagValue, "frozenBagValueWithKey:value:valueType:", v8, v20[5], a4, v11, v12, v13, v14, v15));

  _Block_object_dispose(&v19, 8);
  return v9;
}

- (void)_fetchBag
{
  int64_t v3;
  int64_t v4;
  dispatch_semaphore_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[4];
  NSObject *v13;
  id v14;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v3 = -[SKUIOctaneBag _activePort](self, "_activePort");
  v4 = v3;
  if (!self->_dictionary || v3 != self->_port)
  {
    if (v3)
    {
      self->_port = v3;
      v5 = dispatch_semaphore_create(0);
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("http://localhost:%ld/WebObjects/MZInit.woa/wa/initiateSession"), v4));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v6));

      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLRequest requestWithURL:cachePolicy:timeoutInterval:](NSURLRequest, "requestWithURL:cachePolicy:timeoutInterval:", v7, 4, 10.0));
      objc_initWeak(&location, self);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSession sharedSession](NSURLSession, "sharedSession"));
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100021424;
      v12[3] = &unk_100049DE8;
      objc_copyWeak(&v14, &location);
      v10 = v5;
      v13 = v10;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dataTaskWithRequest:completionHandler:", v8, v12));

      objc_msgSend(v11, "resume");
      dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);

    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100029D24();
    }
  }
}

- (NSDate)expirationDate
{
  return self->expirationDate;
}

- (BOOL)isExpired
{
  return self->expired;
}

- (NSString)profile
{
  return self->profile;
}

- (NSString)profileVersion
{
  return self->profileVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->profileVersion, 0);
  objc_storeStrong((id *)&self->profile, 0);
  objc_storeStrong((id *)&self->expirationDate, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end
