@implementation GTPMController

- (GTPMController)initWithGPUFamily:(id)a3
{
  id v4;
  GTPMController *v5;
  NSString *v6;
  NSString *gpuFamily;
  NSXPCConnection *v8;
  NSXPCConnection *connectionToService;
  int v10;
  __objc2_prot **v11;
  NSXPCConnection *v12;
  void *v13;
  dispatch_semaphore_t v14;
  OS_dispatch_semaphore *semaphore;
  void **v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  id location;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)GTPMController;
  v5 = -[GTPMController init](&v23, "init");
  if (v5)
  {
    v6 = (NSString *)objc_msgSend(v4, "copy");
    gpuFamily = v5->_gpuFamily;
    v5->_gpuFamily = v6;

    if ((objc_msgSend(v4, "containsString:", CFSTR("Intel")) & 1) != 0
      || objc_msgSend(v4, "containsString:", CFSTR("AMD")))
    {
      if (objc_msgSend(v4, "containsString:", CFSTR("Intel")))
      {
        v8 = (NSXPCConnection *)objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithServiceName:", CFSTR("com.apple.gputools.GTPMService"));
        connectionToService = v5->_connectionToService;
        v5->_connectionToService = v8;
        v10 = 1;
        v11 = &protocolRef_GTPMServiceProtocol;
      }
      else
      {
        if (!objc_msgSend(v4, "containsString:", CFSTR("AMD")))
        {
LABEL_9:
          objc_initWeak(&location, v5);
          v17 = _NSConcreteStackBlock;
          v18 = 3221225472;
          v19 = __36__GTPMController_initWithGPUFamily___block_invoke;
          v20 = &unk_7265C8;
          objc_copyWeak(&v21, &location);
          -[NSXPCConnection setInterruptionHandler:](v5->_connectionToService, "setInterruptionHandler:", &v17);
          -[NSXPCConnection resume](v5->_connectionToService, "resume", v17, v18, v19, v20);
          v14 = dispatch_semaphore_create(0);
          semaphore = v5->_semaphore;
          v5->_semaphore = (OS_dispatch_semaphore *)v14;

          objc_destroyWeak(&v21);
          objc_destroyWeak(&location);
          goto LABEL_10;
        }
        v12 = (NSXPCConnection *)objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithServiceName:", CFSTR("com.apple.gputools.GTAMDPMService"));
        connectionToService = v5->_connectionToService;
        v5->_connectionToService = v12;
        v10 = 2;
        v11 = &protocolRef_GTAMDPMServiceProtocol;
      }

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", *v11));
      -[NSXPCConnection setRemoteObjectInterface:](v5->_connectionToService, "setRemoteObjectInterface:", v13);

      v5->_gpuVendor = v10;
      goto LABEL_9;
    }
  }
LABEL_10:

  return v5;
}

- (void)_initGTPM
{
  NSXPCConnection *connectionToService;
  void *v4;
  NSString *gpuFamily;
  NSObject *semaphore;
  dispatch_time_t v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[5];
  id location;

  self->_initialized = 1;
  if (self)
  {
    if (self->_connectionToService)
    {
      objc_initWeak(&location, self);
      connectionToService = self->_connectionToService;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = __27__GTPMController__initGTPM__block_invoke;
      v10[3] = &unk_7265F0;
      v10[4] = self;
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](connectionToService, "remoteObjectProxyWithErrorHandler:", v10));
      gpuFamily = self->_gpuFamily;
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = __27__GTPMController__initGTPM__block_invoke_2;
      v8[3] = &unk_726618;
      objc_copyWeak(&v9, &location);
      objc_msgSend(v4, "initGPU:withReply:", gpuFamily, v8);

      semaphore = self->_semaphore;
      v7 = dispatch_time(0, 10000000000);
      dispatch_semaphore_wait(semaphore, v7);
      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }
  }
}

- (BOOL)serviceLaunched
{
  if (self->_connected)
    return 1;
  if (self->_initialized)
    return 0;
  -[GTPMController _initGTPM](self, "_initGTPM");
  return self->_connected;
}

- (void)tearDown
{
  id v2;

  if (self)
  {
    if (self->_connected)
    {
      self->_connected = 0;
      v2 = (id)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connectionToService, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_6540));
      objc_msgSend(v2, "setControlMode:withReply:", 0, &__block_literal_global_60);

    }
  }
}

- (void)setPerfState:(id)a3
{
  id v4;
  id v5;
  int v6;
  NSXPCConnection *connectionToService;
  void *v8;
  NSObject *semaphore;
  dispatch_time_t v10;
  _QWORD v11[4];
  id v12;
  GTPMController *v13;
  id v14;
  _QWORD v15[5];
  id location;

  v4 = a3;
  if (v4)
  {
    if (-[GTPMController serviceLaunched](self, "serviceLaunched"))
    {
      v5 = objc_msgSend(v4, "integerValue");
      if ((uint64_t)v5 >= 1)
      {
        v6 = (int)v5;
        objc_initWeak(&location, self);
        connectionToService = self->_connectionToService;
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = __31__GTPMController_setPerfState___block_invoke;
        v15[3] = &unk_7265F0;
        v15[4] = self;
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](connectionToService, "remoteObjectProxyWithErrorHandler:", v15));
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472;
        v11[2] = __31__GTPMController_setPerfState___block_invoke_2;
        v11[3] = &unk_7266C0;
        objc_copyWeak(&v14, &location);
        v12 = v4;
        v13 = self;
        objc_msgSend(v8, "setState:withReply:", (v6 - 1), v11);

        semaphore = self->_semaphore;
        v10 = dispatch_time(0, 10000000000);
        dispatch_semaphore_wait(semaphore, v10);

        objc_destroyWeak(&v14);
        objc_destroyWeak(&location);
      }
    }
  }

}

- (void)clearStateOccupancy
{
  NSXPCConnection *connectionToService;
  void *v4;
  NSObject *semaphore;
  dispatch_time_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[5];
  id location;

  if (-[GTPMController serviceLaunched](self, "serviceLaunched"))
  {
    objc_initWeak(&location, self);
    connectionToService = self->_connectionToService;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = __37__GTPMController_clearStateOccupancy__block_invoke;
    v9[3] = &unk_7265F0;
    v9[4] = self;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](connectionToService, "remoteObjectProxyWithErrorHandler:", v9));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = __37__GTPMController_clearStateOccupancy__block_invoke_2;
    v7[3] = &unk_7266E8;
    objc_copyWeak(&v8, &location);
    objc_msgSend(v4, "clearOccupancyWithReply:", v7);

    semaphore = self->_semaphore;
    v6 = dispatch_time(0, 10000000000);
    dispatch_semaphore_wait(semaphore, v6);
    NSLog(CFSTR("Occupancy Cleared semaphore"));
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (double)getStateOccupancy
{
  NSXPCConnection *connectionToService;
  void *v4;
  NSObject *semaphore;
  dispatch_time_t v6;
  double v7;
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];
  id location;
  uint64_t v13;
  double *v14;
  uint64_t v15;
  unint64_t v16;

  v13 = 0;
  v14 = (double *)&v13;
  v15 = 0x2020000000;
  v16 = 0xBFF0000000000000;
  if (-[GTPMController serviceLaunched](self, "serviceLaunched"))
  {
    objc_initWeak(&location, self);
    sleep(1u);
    connectionToService = self->_connectionToService;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = __35__GTPMController_getStateOccupancy__block_invoke;
    v11[3] = &unk_7265F0;
    v11[4] = self;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](connectionToService, "remoteObjectProxyWithErrorHandler:", v11));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = __35__GTPMController_getStateOccupancy__block_invoke_2;
    v9[3] = &unk_726710;
    objc_copyWeak(&v10, &location);
    v9[4] = &v13;
    objc_msgSend(v4, "getOccupancyWithReply:", v9);

    semaphore = self->_semaphore;
    v6 = dispatch_time(0, 10000000000);
    dispatch_semaphore_wait(semaphore, v6);
    v7 = v14[3];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else
  {
    v7 = v14[3];
  }
  _Block_object_dispose(&v13, 8);
  return v7;
}

- (NSXPCConnection)connectionToService
{
  return self->_connectionToService;
}

- (void)setConnectionToService:(id)a3
{
  objc_storeStrong((id *)&self->_connectionToService, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionToService, 0);
  objc_storeStrong((id *)&self->_semaphore, 0);
  objc_storeStrong((id *)&self->_perfState, 0);
  objc_storeStrong((id *)&self->_gpuFamily, 0);
}

intptr_t __35__GTPMController_getStateOccupancy__block_invoke(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("Can't Invoke Remote Object %@"), a2);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 32));
}

void __35__GTPMController_getStateOccupancy__block_invoke_2(uint64_t a1, int a2, double a3)
{
  dispatch_semaphore_t *WeakRetained;
  dispatch_semaphore_t *v7;

  WeakRetained = (dispatch_semaphore_t *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (a2)
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
    v7 = WeakRetained;
    dispatch_semaphore_signal(WeakRetained[4]);
    WeakRetained = v7;
  }

}

intptr_t __37__GTPMController_clearStateOccupancy__block_invoke(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("Can't Invoke Remote Object %@"), a2);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 32));
}

void __37__GTPMController_clearStateOccupancy__block_invoke_2(uint64_t a1)
{
  dispatch_semaphore_t *WeakRetained;
  dispatch_semaphore_t *v2;

  WeakRetained = (dispatch_semaphore_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    dispatch_semaphore_signal(WeakRetained[4]);
    WeakRetained = v2;
  }

}

intptr_t __31__GTPMController_setPerfState___block_invoke(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("Can't Invoke Remote Object %@"), a2);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 32));
}

void __31__GTPMController_setPerfState___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "copy");
    v3 = (void *)WeakRetained[3];
    WeakRetained[3] = v2;

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 40) + 32));
  }

}

void __26__GTPMController_tearDown__block_invoke(id a1, NSError *a2)
{
  NSLog(CFSTR("Can't Invoke Remote Object %@"), a2);
}

intptr_t __27__GTPMController__initGTPM__block_invoke(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("Can't Invoke Remote Object %@"), a2);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 32));
}

void __27__GTPMController__initGTPM__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id *WeakRetained;
  id *v6;
  id v7;

  v7 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    if (a2
      && (objc_msgSend(WeakRetained[1], "containsString:", CFSTR("Intel"))
       && (objc_msgSend(v7, "containsString:", CFSTR("IG")) & 1) != 0
       || objc_msgSend(v6[1], "containsString:", CFSTR("AMD"))
       && objc_msgSend(v7, "containsString:", CFSTR("EG"))))
    {
      *((_BYTE *)v6 + 21) = 1;
    }
    dispatch_semaphore_signal((dispatch_semaphore_t)v6[4]);
  }

}

void __36__GTPMController_initWithGPUFamily___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  _WORD *v3;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  NSLog(CFSTR("Service crashed, trying to restart the service %p"), WeakRetained);

  v3 = objc_loadWeakRetained(v1);
  if (v3)
    v3[10] = 0;

}

+ (id)stateFromWeightedAverage:(double)a3
{
  unsigned int v4;

  if (a3 < -2.22044605e-16 || vabdd_f64(a3, floor(a3)) > 2.22044605e-16)
    return CFSTR("mixed");
  v4 = (a3 + 2.22044605e-16);
  if (v4 > 2)
    return CFSTR("none");
  else
    return off_726960[v4];
}

@end
