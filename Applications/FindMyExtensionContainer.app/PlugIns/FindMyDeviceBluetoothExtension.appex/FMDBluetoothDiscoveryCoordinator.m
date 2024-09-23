@implementation FMDBluetoothDiscoveryCoordinator

- (FMDBluetoothDiscoveryCoordinator)initWithDiscovery:(id)a3
{
  id v4;
  FMDBluetoothDiscoveryCoordinator *v5;
  dispatch_queue_t v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id location;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FMDBluetoothDiscoveryCoordinator;
  v5 = -[FMDBluetoothDiscoveryCoordinator init](&v16, "init");
  if (v5)
  {
    v6 = dispatch_queue_create("FMDBluetoothDiscoveryCoordinatorQueue", 0);
    -[FMDBluetoothDiscoveryCoordinator setSerialQueue:](v5, "setSerialQueue:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    -[FMDBluetoothDiscoveryCoordinator setActiveTokens:](v5, "setActiveTokens:", v7);

    -[FMDBluetoothDiscoveryCoordinator setDiscovery:](v5, "setDiscovery:", v4);
    objc_initWeak(&location, v5);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100010724;
    v13[3] = &unk_1000215F8;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v4, "setDidDiscoverDevice:", v13);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100010788;
    v11[3] = &unk_1000215F8;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v4, "setDidLoseDevice:", v11);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000107EC;
    v9[3] = &unk_100021620;
    objc_copyWeak(&v10, &location);
    objc_msgSend(v4, "setDidEndDiscovery:", v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (id)newDiscovery
{
  FMDBluetoothDiscoveryToken *v3;
  id v4;
  NSObject *v5;
  int v7;
  FMDBluetoothDiscoveryToken *v8;

  v3 = objc_alloc_init(FMDBluetoothDiscoveryToken);
  -[FMDBluetoothDiscoveryToken setDelegate:](v3, "setDelegate:", self);
  v4 = sub_100007584();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "FMDBluetoothDiscoveryCoordinator generating token %@", (uint8_t *)&v7, 0xCu);
  }

  return v3;
}

- (void)discoveryRequestedStop:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  id v13;

  v4 = a3;
  v5 = sub_100007584();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FMDBluetoothDiscoveryCoordinator discoveryRequestedStop %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v7 = objc_claimAutoreleasedReturnValue(-[FMDBluetoothDiscoveryCoordinator serialQueue](self, "serialQueue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100010A58;
  v9[3] = &unk_1000216C8;
  objc_copyWeak(&v11, (id *)buf);
  v10 = v4;
  v8 = v4;
  dispatch_async(v7, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

- (void)discoveryRequestedStart:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  id v13;

  v4 = a3;
  v5 = sub_100007584();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FMDBluetoothDiscoveryCoordinator discoveryRequestedStart %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v7 = objc_claimAutoreleasedReturnValue(-[FMDBluetoothDiscoveryCoordinator serialQueue](self, "serialQueue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100010C70;
  v9[3] = &unk_1000216C8;
  objc_copyWeak(&v11, (id *)buf);
  v10 = v4;
  v8 = v4;
  dispatch_async(v7, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

- (void)didEndDiscoveryWithError:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  _QWORD block[4];
  id v11;
  id buf[2];

  v4 = a3;
  v5 = sub_100007584();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FMDBluetoothDiscoveryCoordinator discoveryEnded - clearing tokens", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v7 = objc_claimAutoreleasedReturnValue(-[FMDBluetoothDiscoveryCoordinator serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100010E24;
  block[3] = &unk_100021570;
  objc_copyWeak(&v11, buf);
  dispatch_async(v7, block);

  -[FMDBluetoothDiscoveryCoordinator setIsDiscoveryActive:](self, "setIsDiscoveryActive:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothDiscoveryCoordinator didEndDiscovery](self, "didEndDiscovery"));

  if (v8)
  {
    v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[FMDBluetoothDiscoveryCoordinator didEndDiscovery](self, "didEndDiscovery"));
    ((void (**)(_QWORD, id))v9)[2](v9, v4);

  }
  objc_destroyWeak(&v11);
  objc_destroyWeak(buf);

}

- (void)startDiscoveryTimerWithDuration:(double)a3
{
  void *v5;
  void *v6;
  FMDDispatchTimer *v7;
  id v8;
  FMDDispatchTimer *v9;
  void *v10;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothDiscoveryCoordinator discoveryTimer](self, "discoveryTimer"));
  objc_msgSend(v5, "cancel");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", a3));
  -[FMDBluetoothDiscoveryCoordinator setDiscoveryEndDate:](self, "setDiscoveryEndDate:", v6);

  objc_initWeak(&location, self);
  v7 = [FMDDispatchTimer alloc];
  v8 = &_dispatch_main_q;
  v11 = _NSConcreteStackBlock;
  v12 = 3221225472;
  v13 = sub_100011054;
  v14 = &unk_100021570;
  objc_copyWeak(&v15, &location);
  v9 = -[FMDDispatchTimer initWithQueue:timeout:completion:](v7, "initWithQueue:timeout:completion:", &_dispatch_main_q, &v11, a3);
  -[FMDBluetoothDiscoveryCoordinator setDiscoveryTimer:](self, "setDiscoveryTimer:", v9, v11, v12, v13, v14);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothDiscoveryCoordinator discoveryTimer](self, "discoveryTimer"));
  objc_msgSend(v10, "start");

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)scanningTimerFired
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id location;

  v3 = sub_100007584();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_100013834(v4, v5, v6, v7, v8, v9, v10, v11);

  objc_initWeak(&location, self);
  v12 = objc_claimAutoreleasedReturnValue(-[FMDBluetoothDiscoveryCoordinator serialQueue](self, "serialQueue"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10001115C;
  v13[3] = &unk_100021570;
  objc_copyWeak(&v14, &location);
  dispatch_async(v12, v13);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)updateDisccovery
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  id v16;
  NSObject *v17;
  void *v18;
  void (**v19)(void);
  id v20;
  NSObject *v21;
  void *v22;
  id v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  NSObject *v34;
  id v35;
  NSObject *v36;
  int v37;
  double v38;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothDiscoveryCoordinator activeTokens](self, "activeTokens"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothDiscoveryCoordinator activeTokens](self, "activeTokens"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sortedArrayUsingComparator:", &stru_100021748));

    v7 = sub_100007584();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v37 = 138412290;
      v38 = *(double *)&v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "FMDBluetoothDiscoveryCoordinator active tokens %@", (uint8_t *)&v37, 0xCu);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothDiscoveryCoordinator discoveryEndDate](self, "discoveryEndDate"));
    objc_msgSend(v10, "timeIntervalSinceNow");
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "endDate"));
    objc_msgSend(v13, "timeIntervalSinceNow");
    v15 = v14;

    v16 = sub_100007584();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v37 = 138412290;
      v38 = *(double *)&v9;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "FMDBluetoothDiscoveryCoordinator updating discovery with token %@", (uint8_t *)&v37, 0xCu);
    }

    if (v15 < 0.0 || v15 > 600.0)
    {
      v33 = sub_100007584();
      v34 = objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        v37 = 138412290;
        v38 = *(double *)&v9;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "FMDBluetoothDiscoveryCoordinator discovery expired, stopping discovery %@", (uint8_t *)&v37, 0xCu);
      }

      -[FMDBluetoothDiscoveryCoordinator discoveryRequestedStop:](self, "discoveryRequestedStop:", v9);
    }
    else if (v15 <= v12)
    {
      v35 = sub_100007584();
      v36 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        v37 = 134217984;
        v38 = v12;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "FMDBluetoothDiscoveryCoordinator discovery already running %f", (uint8_t *)&v37, 0xCu);
      }

    }
    else
    {
      if (!-[FMDBluetoothDiscoveryCoordinator isDiscoveryActive](self, "isDiscoveryActive"))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothDiscoveryCoordinator didStartDiscovery](self, "didStartDiscovery"));

        if (v18)
        {
          v19 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[FMDBluetoothDiscoveryCoordinator didStartDiscovery](self, "didStartDiscovery"));
          v19[2]();

        }
      }
      v20 = sub_100007584();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v37 = 134217984;
        v38 = v15;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "FMDBluetoothDiscoveryCoordinator discovery will run %f", (uint8_t *)&v37, 0xCu);
      }

      -[FMDBluetoothDiscoveryCoordinator startDiscoveryTimerWithDuration:](self, "startDiscoveryTimerWithDuration:", v15);
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothDiscoveryCoordinator discovery](self, "discovery"));
      objc_msgSend(v22, "startDiscovery");

      -[FMDBluetoothDiscoveryCoordinator setIsDiscoveryActive:](self, "setIsDiscoveryActive:", 1);
    }

  }
  else
  {
    v23 = sub_100007584();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      sub_100013868(v24, v25, v26, v27, v28, v29, v30, v31);

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothDiscoveryCoordinator discovery](self, "discovery"));
    objc_msgSend(v32, "stopDiscovery");

    -[FMDBluetoothDiscoveryCoordinator setIsDiscoveryActive:](self, "setIsDiscoveryActive:", 0);
  }
}

- (BOOL)isDiscoveryActive
{
  return self->_isDiscoveryActive;
}

- (void)setIsDiscoveryActive:(BOOL)a3
{
  self->_isDiscoveryActive = a3;
}

- (id)didEndDiscovery
{
  return self->_didEndDiscovery;
}

- (void)setDidEndDiscovery:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)didStartDiscovery
{
  return self->_didStartDiscovery;
}

- (void)setDidStartDiscovery:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)didDiscoverDevice
{
  return self->_didDiscoverDevice;
}

- (void)setDidDiscoverDevice:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)didLoseDevice
{
  return self->_didLoseDevice;
}

- (void)setDidLoseDevice:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (FMDDeviceDiscovering)discovery
{
  return self->_discovery;
}

- (void)setDiscovery:(id)a3
{
  objc_storeStrong((id *)&self->_discovery, a3);
}

- (NSMutableArray)activeTokens
{
  return self->_activeTokens;
}

- (void)setActiveTokens:(id)a3
{
  objc_storeStrong((id *)&self->_activeTokens, a3);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (NSDate)discoveryEndDate
{
  return self->_discoveryEndDate;
}

- (void)setDiscoveryEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_discoveryEndDate, a3);
}

- (FMDDispatchTimer)discoveryTimer
{
  return self->_discoveryTimer;
}

- (void)setDiscoveryTimer:(id)a3
{
  objc_storeStrong((id *)&self->_discoveryTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoveryTimer, 0);
  objc_storeStrong((id *)&self->_discoveryEndDate, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_activeTokens, 0);
  objc_storeStrong((id *)&self->_discovery, 0);
  objc_storeStrong(&self->_didLoseDevice, 0);
  objc_storeStrong(&self->_didDiscoverDevice, 0);
  objc_storeStrong(&self->_didStartDiscovery, 0);
  objc_storeStrong(&self->_didEndDiscovery, 0);
}

@end
