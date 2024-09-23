@implementation HMDDeviceNotificationHandlerDefaultDataSource

- (HMDDeviceNotificationHandlerDefaultDataSource)initWithHome:(id)a3
{
  id v4;
  HMDDeviceNotificationHandlerDefaultDataSource *v5;
  HMDDeviceNotificationHandlerDefaultDataSource *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HMDDeviceNotificationHandlerDefaultDataSource;
  v5 = -[HMDDeviceNotificationHandlerDefaultDataSource init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_home, v4);

  return v6;
}

- (id)timerWithType:(unsigned __int8)a3
{
  int v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  -[HMDDeviceNotificationHandlerDefaultDataSource home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isCurrentDeviceAvailableResident");
  if (v3 == 1)
  {
    if (v5)
      v6 = pendingResponseTickPeriod;
    else
      v6 = delayNotificationsPeriod;
  }
  else
  {
    v6 = 0;
    if (!v3)
      v6 = coalesceNotificationsPeriod;
  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 1, *(double *)&v6);

  return v7;
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (void)setHome:(id)a3
{
  objc_storeWeak((id *)&self->_home, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_home);
}

@end
