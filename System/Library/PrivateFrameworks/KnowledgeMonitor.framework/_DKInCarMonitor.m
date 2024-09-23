@implementation _DKInCarMonitor

- (void)dealloc
{
  objc_super v3;

  -[_DKInCarMonitor deactivate](self, "deactivate");
  v3.receiver = self;
  v3.super_class = (Class)_DKInCarMonitor;
  -[_DKMonitor dealloc](&v3, sel_dealloc);
}

+ (id)eventStream
{
  return CFSTR("InCar");
}

+ (id)entitlements
{
  return 0;
}

- (id)loadState
{
  return 0;
}

+ (void)setIsConnected:(BOOL)a3
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B170], "userContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B180], "keyPathForCarConnectedStatus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, v4);

}

- (void)setConnectedStatus:(BOOL)a3
{
  if (self->_enabled && self->_connected != a3)
  {
    self->_connected = a3;
    objc_msgSend((id)objc_opt_class(), "setIsConnected:", a3);
  }
}

- (void)start
{
  const char *v3;
  NSObject *v4;
  uint64_t v5;
  const char *v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD block[5];
  _QWORD v10[5];
  _QWORD handler[5];
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_DKInCarMonitor;
  if (-[_DKMonitor instantMonitorNeedsActivation](&v12, sel_instantMonitorNeedsActivation))
  {
    self->_enabled = 1;
    v3 = (const char *)objc_msgSend(CFSTR("com.apple.locationd.vehicle.connected"), "UTF8String");
    -[_DKMonitor queue](self, "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x24BDAC760];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __24___DKInCarMonitor_start__block_invoke;
    handler[3] = &unk_24DA670E8;
    handler[4] = self;
    notify_register_dispatch(v3, &self->_connectedToken, v4, handler);

    v6 = (const char *)objc_msgSend(CFSTR("com.apple.locationd.vehicle.disconnected"), "UTF8String");
    -[_DKMonitor queue](self, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __24___DKInCarMonitor_start__block_invoke_2;
    v10[3] = &unk_24DA670E8;
    v10[4] = self;
    notify_register_dispatch(v6, &self->_disconnectedToken, v7, v10);

    -[_DKMonitor queue](self, "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __24___DKInCarMonitor_start__block_invoke_3;
    block[3] = &unk_24DA66D10;
    block[4] = self;
    dispatch_sync(v8, block);

  }
}

- (void)stop
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_DKInCarMonitor;
  if (-[_DKMonitor instantMonitorNeedsDeactivation](&v3, sel_instantMonitorNeedsDeactivation))
    -[_DKInCarMonitor deactivate](self, "deactivate");
}

- (void)deactivate
{
  int connectedToken;
  int disconnectedToken;

  self->_enabled = 0;
  connectedToken = self->_connectedToken;
  if (connectedToken)
    notify_cancel(connectedToken);
  disconnectedToken = self->_disconnectedToken;
  if (disconnectedToken)
    notify_cancel(disconnectedToken);
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)connected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (int)connectedToken
{
  return self->_connectedToken;
}

- (void)setConnectedToken:(int)a3
{
  self->_connectedToken = a3;
}

- (int)disconnectedToken
{
  return self->_disconnectedToken;
}

- (void)setDisconnectedToken:(int)a3
{
  self->_disconnectedToken = a3;
}

@end
