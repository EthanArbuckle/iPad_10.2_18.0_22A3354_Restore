@implementation ASDTPMDeviceProxy

+ (id)forPMDevice:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initForPMDevice:", v4);

  return v5;
}

- (id)initForPMDevice:(id)a3
{
  id v4;
  ASDTPMDeviceProxy *v5;
  ASDTPMDeviceProxy *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ASDTPMDeviceProxy;
  v5 = -[ASDTPMDeviceProxy init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[ASDTPMDeviceProxy setProxiedDevice:](v5, "setProxiedDevice:", v4);

  return v6;
}

- (NSString)name
{
  void *v2;
  void *v3;

  -[ASDTPMDeviceProxy proxiedDevice](self, "proxiedDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (unsigned)pmOrderPowerUp
{
  void *v2;
  unsigned int v3;

  -[ASDTPMDeviceProxy proxiedDevice](self, "proxiedDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "pmOrderPowerUp");

  return v3;
}

- (unsigned)pmOrderPowerDown
{
  void *v2;
  unsigned int v3;

  -[ASDTPMDeviceProxy proxiedDevice](self, "proxiedDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "pmOrderPowerDown");

  return v3;
}

- (BOOL)pmNoStateChangeOnFailure
{
  void *v2;
  char v3;

  -[ASDTPMDeviceProxy proxiedDevice](self, "proxiedDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "pmNoStateChangeOnFailure");

  return v3;
}

- (int)powerState
{
  void *v2;
  int v3;

  -[ASDTPMDeviceProxy proxiedDevice](self, "proxiedDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "powerState");

  return v3;
}

- (void)setPowerState:(int)a3
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)&a3;
  -[ASDTPMDeviceProxy proxiedDevice](self, "proxiedDevice");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPowerState:", v3);

}

- (int)asdtPowerStateChange:(int)a3
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)&a3;
  -[ASDTPMDeviceProxy proxiedDevice](self, "proxiedDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v4, "asdtPowerStateChange:", v3);

  return v3;
}

- (BOOL)asdtHandlesPowerTransition:(int)a3
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)&a3;
  -[ASDTPMDeviceProxy proxiedDevice](self, "proxiedDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "asdtHandlesPowerTransition:", v3);

  return v3;
}

- (int)performPowerStateSleep
{
  void *v2;
  int v3;

  -[ASDTPMDeviceProxy proxiedDevice](self, "proxiedDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "performPowerStateSleep");

  return v3;
}

- (int)performPowerStateIdle:(int)a3
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)&a3;
  -[ASDTPMDeviceProxy proxiedDevice](self, "proxiedDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v4, "performPowerStateIdle:", v3);

  return v3;
}

- (int)performPowerStatePrepare:(int)a3
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)&a3;
  -[ASDTPMDeviceProxy proxiedDevice](self, "proxiedDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v4, "performPowerStatePrepare:", v3);

  return v3;
}

- (int)performPowerStatePrewarm:(int)a3
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)&a3;
  -[ASDTPMDeviceProxy proxiedDevice](self, "proxiedDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v4, "performPowerStatePrewarm:", v3);

  return v3;
}

- (int)performPowerStateOn
{
  void *v2;
  int v3;

  -[ASDTPMDeviceProxy proxiedDevice](self, "proxiedDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "performPowerStateOn");

  return v3;
}

- (ASDTPMProtocol)proxiedDevice
{
  return (ASDTPMProtocol *)objc_loadWeakRetained((id *)&self->_proxiedDevice);
}

- (void)setProxiedDevice:(id)a3
{
  objc_storeWeak((id *)&self->_proxiedDevice, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_proxiedDevice);
}

@end
