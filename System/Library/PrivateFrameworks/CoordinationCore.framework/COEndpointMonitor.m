@implementation COEndpointMonitor

- (COEndpointMonitor)init
{
  COEndpointMonitor *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)COEndpointMonitor;
  v2 = -[COEndpointMonitor init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.Coordination.EndpointMonitoring", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (void)startMonitoring
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_215E92000, log, OS_LOG_TYPE_DEBUG, "Start monitoring endpoints", v1, 2u);
}

- (void)_activateLink
{
  RPCompanionLinkClient *client;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  client = self->_client;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __34__COEndpointMonitor__activateLink__block_invoke;
  v4[3] = &unk_24D4B0880;
  objc_copyWeak(&v5, &location);
  -[RPCompanionLinkClient activateWithCompletion:](client, "activateWithCompletion:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __34__COEndpointMonitor__activateLink__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    COCoreLogForCategory(6);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (a2)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        __34__COEndpointMonitor__activateLink__block_invoke_cold_1(v5);
    }
    else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_215E92000, v5, OS_LOG_TYPE_DEFAULT, "Successfully activated link to monitor endpoints", v6, 2u);
    }

  }
}

- (COEndpointMonitorDelegate)delegate
{
  return (COEndpointMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

void __34__COEndpointMonitor__activateLink__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_215E92000, log, OS_LOG_TYPE_ERROR, "Could not activate rapport link to monitor endpoints", v1, 2u);
}

@end
