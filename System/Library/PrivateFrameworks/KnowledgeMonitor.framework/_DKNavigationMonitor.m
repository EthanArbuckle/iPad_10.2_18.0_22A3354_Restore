@implementation _DKNavigationMonitor

- (void)dealloc
{
  objc_super v3;

  -[_DKNavigationMonitor deactivate](self, "deactivate");
  v3.receiver = self;
  v3.super_class = (Class)_DKNavigationMonitor;
  -[_DKMonitor dealloc](&v3, sel_dealloc);
}

+ (id)eventStream
{
  return CFSTR("NavigationInProgress");
}

+ (id)entitlements
{
  return 0;
}

- (id)loadState
{
  return 0;
}

+ (void)setIsNavigating:(BOOL)a3
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B170], "userContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B180], "keyPathForNavigationStatus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, v4);

}

- (void)setNavigationStatus:(BOOL)a3
{
  if (self->_enabled && self->_navigating != a3)
  {
    self->_navigating = a3;
    objc_msgSend((id)objc_opt_class(), "setIsNavigating:", a3);
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
  v12.super_class = (Class)_DKNavigationMonitor;
  if (-[_DKMonitor instantMonitorNeedsActivation](&v12, sel_instantMonitorNeedsActivation))
  {
    self->_enabled = 1;
    v3 = (const char *)objc_msgSend(CFSTR("com.apple.GeoServices.navigation.started"), "UTF8String");
    -[_DKMonitor queue](self, "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x24BDAC760];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __29___DKNavigationMonitor_start__block_invoke;
    handler[3] = &unk_24DA670E8;
    handler[4] = self;
    notify_register_dispatch(v3, &self->_startedToken, v4, handler);

    v6 = (const char *)objc_msgSend(CFSTR("com.apple.GeoServices.navigation.stopped"), "UTF8String");
    -[_DKMonitor queue](self, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __29___DKNavigationMonitor_start__block_invoke_2;
    v10[3] = &unk_24DA670E8;
    v10[4] = self;
    notify_register_dispatch(v6, &self->_stoppedToken, v7, v10);

    -[_DKMonitor queue](self, "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __29___DKNavigationMonitor_start__block_invoke_3;
    block[3] = &unk_24DA66D10;
    block[4] = self;
    dispatch_sync(v8, block);

  }
}

- (void)stop
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_DKNavigationMonitor;
  if (-[_DKMonitor instantMonitorNeedsDeactivation](&v3, sel_instantMonitorNeedsDeactivation))
    -[_DKNavigationMonitor deactivate](self, "deactivate");
}

- (void)deactivate
{
  int startedToken;
  int stoppedToken;

  self->_enabled = 0;
  startedToken = self->_startedToken;
  if (startedToken)
  {
    notify_cancel(startedToken);
    self->_startedToken = 0;
  }
  stoppedToken = self->_stoppedToken;
  if (stoppedToken)
  {
    notify_cancel(stoppedToken);
    self->_stoppedToken = 0;
  }
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)navigating
{
  return self->_navigating;
}

- (void)setNavigating:(BOOL)a3
{
  self->_navigating = a3;
}

- (int)startedToken
{
  return self->_startedToken;
}

- (void)setStartedToken:(int)a3
{
  self->_startedToken = a3;
}

- (int)stoppedToken
{
  return self->_stoppedToken;
}

- (void)setStoppedToken:(int)a3
{
  self->_stoppedToken = a3;
}

@end
