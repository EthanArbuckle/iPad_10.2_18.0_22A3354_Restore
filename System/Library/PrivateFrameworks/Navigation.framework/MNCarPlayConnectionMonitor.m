@implementation MNCarPlayConnectionMonitor

+ (MNCarPlayConnectionMonitor)sharedInstance
{
  if (qword_1ED0C4050 != -1)
    dispatch_once(&qword_1ED0C4050, &__block_literal_global_33);
  return (MNCarPlayConnectionMonitor *)(id)_MergedGlobals_38;
}

void __44__MNCarPlayConnectionMonitor_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_MergedGlobals_38;
  _MergedGlobals_38 = v0;

}

- (MNCarPlayConnectionMonitor)init
{
  MNCarPlayConnectionMonitor *v2;
  NSObject *v3;
  CARSessionStatus *v4;
  CARSessionStatus *carSessionStatus;
  MNCarPlayConnectionMonitor *v6;
  uint8_t v8[16];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MNCarPlayConnectionMonitor;
  v2 = -[MNCarPlayConnectionMonitor init](&v9, sel_init);
  if (v2)
  {
    MNGetMNCarPlayConnectionMonitorLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_DEFAULT, "CarPlay connection monitor started.", v8, 2u);
    }

    v2->_isConnected = 0;
    v4 = (CARSessionStatus *)objc_alloc_init(MEMORY[0x1E0D0D340]);
    carSessionStatus = v2->_carSessionStatus;
    v2->_carSessionStatus = v4;

    -[CARSessionStatus addSessionObserver:](v2->_carSessionStatus, "addSessionObserver:", v2);
    v6 = v2;
  }

  return v2;
}

- (void)dealloc
{
  CARSessionStatus *carSessionStatus;
  objc_super v4;

  -[CARSessionStatus removeSessionObserver:](self->_carSessionStatus, "removeSessionObserver:", self);
  carSessionStatus = self->_carSessionStatus;
  self->_carSessionStatus = 0;

  v4.receiver = self;
  v4.super_class = (Class)MNCarPlayConnectionMonitor;
  -[MNCarPlayConnectionMonitor dealloc](&v4, sel_dealloc);
}

- (BOOL)isConnectedSynchronous
{
  if (self->_shouldWait)
  {
    -[CARSessionStatus waitForSessionInitialization](self->_carSessionStatus, "waitForSessionInitialization");
    self->_shouldWait = 0;
  }
  return self->_isConnected;
}

- (void)sessionDidConnect:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  MNGetMNCarPlayConnectionMonitorLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B0AD7000, v4, OS_LOG_TYPE_DEFAULT, "CarPlay session connected.", v5, 2u);
  }

  self->_isConnected = 1;
}

- (void)sessionDidDisconnect:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  MNGetMNCarPlayConnectionMonitorLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B0AD7000, v4, OS_LOG_TYPE_DEFAULT, "CarPlay session disconnected.", v5, 2u);
  }

  self->_isConnected = 0;
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carSessionStatus, 0);
}

@end
