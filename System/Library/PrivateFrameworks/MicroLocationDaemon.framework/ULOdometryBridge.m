@implementation ULOdometryBridge

- (ULOdometryBridge)initWithQueue:(id)a3 delegate:(id)a4
{
  NSObject *v6;
  id v7;
  ULOdometryBridge *v8;
  ULOdometryBridge *v9;
  NSObject *v10;
  objc_super v12;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(MEMORY[0x24BDC1408], "isBackgroundAvailable") & 1) != 0)
  {
    v12.receiver = self;
    v12.super_class = (Class)ULOdometryBridge;
    v8 = -[ULOdometryBridge init](&v12, sel_init);
    dispatch_assert_queue_V2(v6);
    if (v8)
    {
      -[ULOdometryBridge setQueue:](v8, "setQueue:", v6);
      -[ULOdometryBridge setDelegate:](v8, "setDelegate:", v7);
    }
    self = v8;
    v9 = self;
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_79);
    v10 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2419D9000, v10, OS_LOG_TYPE_ERROR, "requested odometry, but background updates are unavailable", buf, 2u);
    }
    v9 = 0;
  }

  return v9;
}

- (void)startBackgroundUpdates
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[8];
  id location;

  objc_initWeak(&location, self);
  -[ULOdometryBridge queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[ULOdometryBridge backgroudUpdatesRunning](self, "backgroudUpdatesRunning"))
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_79);
    v4 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2419D9000, v4, OS_LOG_TYPE_ERROR, "odometry updates requested but already running, ignoring request", buf, 2u);
    }
  }
  else
  {
    -[ULOdometryBridge odometryManager](self, "odometryManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      if (onceToken_MicroLocation_Default != -1)
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_79);
      v6 = logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2419D9000, v6, OS_LOG_TYPE_DEFAULT, "starting odometry manager", buf, 2u);
      }
      v7 = objc_alloc_init(MEMORY[0x24BDC1408]);
      -[ULOdometryBridge setOdometryManager:](self, "setOdometryManager:", v7);

    }
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_79);
    v8 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2419D9000, v8, OS_LOG_TYPE_DEFAULT, "requesting odometry updates", buf, 2u);
    }
    v9 = objc_alloc_init(MEMORY[0x24BDD1710]);
    -[ULOdometryBridge queue](self, "queue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setUnderlyingQueue:", v10);

    -[ULOdometryBridge odometryManager](self, "odometryManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __42__ULOdometryBridge_startBackgroundUpdates__block_invoke;
    v12[3] = &unk_2511D94C0;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v11, "startBackgroundUpdatesUsingReferenceFrame:toQueue:withHandler:", 8, v9, v12);

    -[ULOdometryBridge setBackgroudUpdatesRunning:](self, "setBackgroudUpdatesRunning:", 1);
    objc_destroyWeak(&v13);

  }
  objc_destroyWeak(&location);
}

void __42__ULOdometryBridge_startBackgroundUpdates__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  NSObject *v8;
  ULOdometryState *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  ULOdometryState *v15;
  void *v16;
  id v17;

  v17 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v8);

    v9 = [ULOdometryState alloc];
    objc_msgSend(v17, "timestamp");
    v11 = v10;
    objc_msgSend(v17, "deltaPositionX");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "deltaPositionY");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "deltaPositionZ");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[ULOdometryState initWithTimestamp:deltaPositionX:deltaPositionY:deltaPositionZ:](v9, "initWithTimestamp:deltaPositionX:deltaPositionY:deltaPositionZ:", v12, v13, v14, v11);

    objc_msgSend(v7, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "didReceiveOdometryUpdate:withError:", v15, v5);

  }
}

- (void)stopBackgroundUpdates
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  -[ULOdometryBridge queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[ULOdometryBridge backgroudUpdatesRunning](self, "backgroudUpdatesRunning"))
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_79);
    v4 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_2419D9000, v4, OS_LOG_TYPE_DEFAULT, "stopping odometry updates", v7, 2u);
    }
    -[ULOdometryBridge odometryManager](self, "odometryManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stopBackgroundUpdates");

    -[ULOdometryBridge setOdometryManager:](self, "setOdometryManager:", 0);
    -[ULOdometryBridge setBackgroudUpdatesRunning:](self, "setBackgroudUpdatesRunning:", 0);
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_79);
    v6 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2419D9000, v6, OS_LOG_TYPE_ERROR, "requested to stop odometry updates but already stopped, ignoring request", buf, 2u);
    }
  }
}

+ (BOOL)isBackgroundAvailable
{
  return objc_msgSend(MEMORY[0x24BDC1408], "isBackgroundAvailable");
}

- (ULOdometryBridgeDelegate)delegate
{
  return (ULOdometryBridgeDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (CMOdometryManager)odometryManager
{
  return self->_odometryManager;
}

- (void)setOdometryManager:(id)a3
{
  objc_storeStrong((id *)&self->_odometryManager, a3);
}

- (BOOL)backgroudUpdatesRunning
{
  return self->_backgroudUpdatesRunning;
}

- (void)setBackgroudUpdatesRunning:(BOOL)a3
{
  self->_backgroudUpdatesRunning = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_odometryManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
