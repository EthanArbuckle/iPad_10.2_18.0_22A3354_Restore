@implementation IDSOffGridConnectionMonitor

- (IDSOffGridConnectionMonitor)init
{
  IDSOffGridConnectionMonitor *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  uint64_t v7;
  CTStewieStateMonitor *stewieConnectionMonitor;
  int v9;
  NSObject *v10;
  const __CFString *v11;
  CTStewieStateMonitor *v12;
  uint64_t v13;
  IMNetworkConnectionMonitor *networkConnectionMonitor;
  objc_super v16;
  uint8_t buf[4];
  const __CFString *v18;
  __int16 v19;
  CTStewieStateMonitor *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)IDSOffGridConnectionMonitor;
  v2 = -[IDSOffGridConnectionMonitor init](&v16, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_DEFAULT, 0);
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = dispatch_queue_create("com.apple.ids.connectionMonitor.ct", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = objc_msgSend(objc_alloc((Class)MEMORY[0x19400F24C](CFSTR("CTStewieStateMonitor"), CFSTR("CoreTelephony"))), "initWithDelegate:queue:", v2, v2->_queue);
    stewieConnectionMonitor = v2->_stewieConnectionMonitor;
    v2->_stewieConnectionMonitor = (CTStewieStateMonitor *)v7;

    v9 = -[CTStewieStateMonitor start](v2->_stewieConnectionMonitor, "start");
    objc_msgSend(MEMORY[0x1E0D34D40], "IDSOffGridStateManager");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = CFSTR("NO");
      v12 = v2->_stewieConnectionMonitor;
      if (v9)
        v11 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      v18 = v11;
      v19 = 2112;
      v20 = v12;
      _os_log_impl(&dword_1906E0000, v10, OS_LOG_TYPE_DEFAULT, "Started stewie connection monitor %@ %@", buf, 0x16u);
    }

    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0D36A88]), "initWithRemoteHost:delegate:", 0, v2);
    networkConnectionMonitor = v2->_networkConnectionMonitor;
    v2->_networkConnectionMonitor = (IMNetworkConnectionMonitor *)v13;

  }
  return v2;
}

- (BOOL)isConnectionSuitableForIMLOverStewie
{
  return !-[IDSOffGridConnectionMonitor isDeviceOnline](self, "isDeviceOnline")
      && -[IDSOffGridConnectionMonitor isIMLActive](self, "isIMLActive");
}

- (BOOL)isIMLAvailable
{
  void *v2;
  char v3;

  -[CTStewieStateMonitor getState](self->_stewieConnectionMonitor, "getState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAllowedService:", 16);

  return v3;
}

- (BOOL)isIMLActive
{
  void *v2;
  char v3;

  -[CTStewieStateMonitor getState](self->_stewieConnectionMonitor, "getState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isActiveService:", 16);

  return v3;
}

- (BOOL)isDeviceOnline
{
  return MEMORY[0x1E0DE7D20](self->_networkConnectionMonitor, sel_isImmediatelyReachable);
}

- (NSString)description
{
  void *v3;
  const __CFString *v4;
  const __CFString *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  if (-[IDSOffGridConnectionMonitor isIMLAvailable](self, "isIMLAvailable"))
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  if (-[IDSOffGridConnectionMonitor isIMLActive](self, "isIMLActive"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<IDSOffGridConnectionMonitor %p>: isIMLAvailable %@, isIMLActive %@>"), self, v4, v5);
}

- (IMNetworkConnectionMonitor)networkConnectionMonitor
{
  return self->_networkConnectionMonitor;
}

- (void)setNetworkConnectionMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_networkConnectionMonitor, a3);
}

- (CTStewieStateMonitor)stewieConnectionMonitor
{
  return self->_stewieConnectionMonitor;
}

- (void)setStewieConnectionMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_stewieConnectionMonitor, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_stewieConnectionMonitor, 0);
  objc_storeStrong((id *)&self->_networkConnectionMonitor, 0);
}

@end
