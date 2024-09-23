@implementation DADeviceConnectionWatchProxy

- (DADeviceConnectionWatchProxy)initWithState:(id)a3 nanoDevice:(id)a4
{
  id v7;
  DADeviceConnectionWatchProxy *v8;
  DADeviceConnectionWatchProxy *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)DADeviceConnectionWatchProxy;
  v8 = -[DADeviceConnectionIDSProxy initWithState:](&v13, "initWithState:", a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_nanoDevice, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v10, "addObserver:selector:name:object:", v9, "deviceDidBecomeActive:", NRPairedDeviceRegistryDeviceDidBecomeActive, 0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v11, "addObserver:selector:name:object:", v9, "deviceDidBecomeInactive:", NRPairedDeviceRegistryDeviceDidBecomeInactive, 0);

  }
  return v9;
}

- (id)destination
{
  DAIDSDestination **p_destination;
  DAIDSDestination *destination;
  dispatch_semaphore_t v5;
  void *v6;
  NSObject *v7;
  DAIDSDestination *v8;
  _QWORD v10[4];
  NSObject *v11;
  uint64_t *v12;
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  id location;

  objc_initWeak(&location, self);
  p_destination = &self->_destination;
  destination = self->_destination;
  if (!destination)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = sub_100006174;
    v18 = sub_100006184;
    v19 = 0;
    v5 = dispatch_semaphore_create(0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionIDSProxy messenger](self, "messenger"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000618C;
    v10[3] = &unk_1001328D8;
    objc_copyWeak(&v13, &location);
    v12 = &v14;
    v7 = v5;
    v11 = v7;
    objc_msgSend(v6, "availableDestinationsWithCompletion:", v10);

    dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
    objc_storeStrong((id *)p_destination, (id)v15[5]);

    objc_destroyWeak(&v13);
    _Block_object_dispose(&v14, 8);

    destination = *p_destination;
  }
  v8 = destination;
  objc_destroyWeak(&location);
  return v8;
}

- (void)connect
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unsigned int v12;
  objc_super v13;
  _QWORD v14[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getActivePairedDevice"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionWatchProxy nanoDevice](self, "nanoDevice"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForProperty:", NRDevicePropertyIsAltAccount));
  v7 = objc_msgSend(v6, "BOOLValue");

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100006428;
    v14[3] = &unk_100132900;
    v14[4] = self;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "getAllDevicesWithArchivedAltAccountDevicesMatching:", v14));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));

    v4 = (void *)v10;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionWatchProxy nanoDevice](self, "nanoDevice"));
  v12 = objc_msgSend(v4, "isEqual:", v11);

  if (v12)
  {
    v13.receiver = self;
    v13.super_class = (Class)DADeviceConnectionWatchProxy;
    -[DADeviceConnectionIDSProxy connect](&v13, "connect");
  }

}

- (void)start
{
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unsigned int v13;
  void *v14;
  _QWORD v15[5];
  _QWORD v16[5];

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000662C;
  v16[3] = &unk_100132928;
  v16[4] = self;
  v3 = objc_retainBlock(v16);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getActivePairedDevice"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionWatchProxy nanoDevice](self, "nanoDevice"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueForProperty:", NRDevicePropertyIsAltAccount));
  v8 = objc_msgSend(v7, "BOOLValue");

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100006668;
    v15[3] = &unk_100132900;
    v15[4] = self;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "getAllDevicesWithArchivedAltAccountDevicesMatching:", v15));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));

    v5 = (void *)v11;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionWatchProxy nanoDevice](self, "nanoDevice"));
  v13 = objc_msgSend(v5, "isEqual:", v12) ^ 1 | v8;

  if (v13 == 1)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionWatchProxy nanoDevice](self, "nanoDevice"));
    -[DADeviceConnectionWatchProxy quickSwitchToNRDevice:completion:](self, "quickSwitchToNRDevice:completion:", v14, v3);

  }
  else
  {
    ((void (*)(_QWORD *, uint64_t))v3[2])(v3, 1);
  }

}

- (void)end
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  dispatch_time_t v8;
  dispatch_queue_global_t global_queue;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  objc_super v13;
  uint8_t buf[4];
  void *v15;

  v13.receiver = self;
  v13.super_class = (Class)DADeviceConnectionWatchProxy;
  -[DADeviceConnectionIDSProxy end](&v13, "end");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionWatchProxy activeDeviceAssertion](self, "activeDeviceAssertion"));

  if (v3)
  {
    v4 = DiagnosticLogHandleForCategory(10);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionWatchProxy activeDeviceAssertion](self, "activeDeviceAssertion"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "device"));
      *(_DWORD *)buf = 138412290;
      v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Invalidating Active Device Assertion for Device: %@", buf, 0xCu);

    }
    objc_initWeak((id *)buf, self);
    v8 = dispatch_time(0, 2000000000);
    global_queue = dispatch_get_global_queue(2, 0);
    v10 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000685C;
    block[3] = &unk_100132950;
    objc_copyWeak(&v12, (id *)buf);
    dispatch_after(v8, v10, block);

    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }
}

- (void)quickSwitchToNRDevice:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = DiagnosticLogHandleForCategory(10);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Switching to Watch: %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100006B08;
  v13[3] = &unk_1001329A0;
  objc_copyWeak(&v16, (id *)buf);
  v13[4] = self;
  v11 = v6;
  v14 = v11;
  v12 = v7;
  v15 = v12;
  objc_msgSend(v10, "setActivePairedDevice:withActiveDeviceAssertionHandler:", v11, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);

}

- (void)deviceDidBecomeActive:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  id v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", NRPairedDeviceRegistryDevice));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionWatchProxy nanoDevice](self, "nanoDevice"));
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (v7)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionIDSProxy state](self, "state"));
    objc_msgSend(v8, "removeErrorCode:", 7);

  }
}

- (void)deviceDidBecomeInactive:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", NRPairedDeviceRegistryDevice));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionWatchProxy nanoDevice](self, "nanoDevice"));
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (v7)
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionIDSProxy state](self, "state"));
    if (objc_msgSend(v11, "phase"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionIDSProxy state](self, "state"));
      v9 = objc_msgSend(v8, "phase");

      if (v9 == (id)1)
        return;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionIDSProxy state](self, "state"));
      objc_msgSend(v10, "setPhase:", 1);

      v11 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionIDSProxy state](self, "state"));
      objc_msgSend(v11, "addErrorCode:userInfo:", 7, 0);
    }

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)DADeviceConnectionWatchProxy;
  -[DADeviceConnectionWatchProxy dealloc](&v4, "dealloc");
}

- (NRDevice)nanoDevice
{
  return self->_nanoDevice;
}

- (void)setNanoDevice:(id)a3
{
  objc_storeStrong((id *)&self->_nanoDevice, a3);
}

- (NRActiveDeviceAssertion)activeDeviceAssertion
{
  return self->_activeDeviceAssertion;
}

- (void)setActiveDeviceAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_activeDeviceAssertion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeDeviceAssertion, 0);
  objc_storeStrong((id *)&self->_nanoDevice, 0);
  objc_storeStrong((id *)&self->_destination, 0);
}

@end
