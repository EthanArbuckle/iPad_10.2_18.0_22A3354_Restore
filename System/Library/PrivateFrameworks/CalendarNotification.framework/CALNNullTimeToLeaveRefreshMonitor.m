@implementation CALNNullTimeToLeaveRefreshMonitor

+ (CALNNullTimeToLeaveRefreshMonitor)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__CALNNullTimeToLeaveRefreshMonitor_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_17 != -1)
    dispatch_once(&sharedInstance_onceToken_17, block);
  return (CALNNullTimeToLeaveRefreshMonitor *)(id)sharedInstance_sharedInstance_14;
}

void __51__CALNNullTimeToLeaveRefreshMonitor_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance_14;
  sharedInstance_sharedInstance_14 = (uint64_t)v1;

}

- (CALNTimeToLeaveRefreshMonitorDelegate)delegate
{
  return (CALNTimeToLeaveRefreshMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
