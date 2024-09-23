@implementation _DKThermalPressureMonitor

- (void)dealloc
{
  objc_super v3;

  -[_DKThermalPressureMonitor deactivate](self, "deactivate");
  v3.receiver = self;
  v3.super_class = (Class)_DKThermalPressureMonitor;
  -[_DKMonitor dealloc](&v3, sel_dealloc);
}

+ (id)eventStream
{
  return CFSTR("ThermalPressureLevel");
}

+ (id)entitlements
{
  return 0;
}

- (id)loadState
{
  return 0;
}

- (void)setCurrentThermalLevel:(int)a3
{
  void *v5;
  void *v6;
  void *v7;

  if (!self->_initialized || self->_lastThermalPressureLevel != a3)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(_QWORD *)&a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B170], "userContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B180], "keyPathForThermalPressureLevel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v7);

    self->_lastThermalPressureLevel = a3;
    self->_initialized = 1;
  }
}

- (void)setCurrentPeakPowerPressureLevel:(unsigned int)a3
{
  void *v5;
  void *v6;
  void *v7;

  if (self->_peakPowerPressureLevel != a3)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B170], "userContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B198], "ephemeralKeyPathWithKey:", CFSTR("/system/peakPowerPressureLevel"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v7);

    self->_peakPowerPressureLevel = a3 != 0;
  }
}

- (void)start
{
  NSObject *v3;
  _QWORD block[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_DKThermalPressureMonitor;
  if (-[_DKMonitor instantMonitorNeedsActivation](&v5, sel_instantMonitorNeedsActivation))
  {
    self->_initialized = 0;
    -[_DKMonitor queue](self, "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __34___DKThermalPressureMonitor_start__block_invoke;
    block[3] = &unk_24DA66D10;
    block[4] = self;
    dispatch_sync(v3, block);

    -[_DKThermalPressureMonitor synchronouslyReflectCurrentValue](self, "synchronouslyReflectCurrentValue");
  }
}

- (void)stop
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_DKThermalPressureMonitor;
  if (-[_DKMonitor instantMonitorNeedsDeactivation](&v3, sel_instantMonitorNeedsDeactivation))
    -[_DKThermalPressureMonitor deactivate](self, "deactivate");
}

- (void)deactivate
{
  int thermalPressureToken;
  int peakPowerPressureToken;

  thermalPressureToken = self->_thermalPressureToken;
  if (thermalPressureToken)
  {
    notify_cancel(thermalPressureToken);
    self->_thermalPressureToken = 0;
  }
  peakPowerPressureToken = self->_peakPowerPressureToken;
  if (peakPowerPressureToken)
  {
    notify_cancel(peakPowerPressureToken);
    self->_peakPowerPressureToken = 0;
  }
  self->_initialized = 0;
}

- (void)getThermalPressureLevelWithToken:(int)a3
{
  uint64_t v4;
  uint64_t state64;

  state64 = 0;
  if (notify_get_state(a3, &state64))
    v4 = 0;
  else
    v4 = state64;
  -[_DKThermalPressureMonitor setCurrentThermalLevel:](self, "setCurrentThermalLevel:", v4);
}

- (void)getPeakPowerPressureLevelWithToken:(int)a3
{
  uint64_t v4;
  uint64_t state64;

  state64 = 0;
  if (notify_get_state(a3, &state64))
    v4 = 0;
  else
    v4 = state64;
  -[_DKThermalPressureMonitor setCurrentPeakPowerPressureLevel:](self, "setCurrentPeakPowerPressureLevel:", v4);
}

- (void)synchronouslyReflectCurrentValue
{
  -[_DKThermalPressureMonitor getThermalPressureLevelWithToken:](self, "getThermalPressureLevelWithToken:", self->_thermalPressureToken);
  -[_DKThermalPressureMonitor getPeakPowerPressureLevelWithToken:](self, "getPeakPowerPressureLevelWithToken:", self->_peakPowerPressureToken);
}

- (BOOL)initialized
{
  return self->_initialized;
}

- (void)setInitialized:(BOOL)a3
{
  self->_initialized = a3;
}

- (int)thermalPressureToken
{
  return self->_thermalPressureToken;
}

- (void)setThermalPressureToken:(int)a3
{
  self->_thermalPressureToken = a3;
}

- (int)lastThermalPressureLevel
{
  return self->_lastThermalPressureLevel;
}

- (void)setLastThermalPressureLevel:(int)a3
{
  self->_lastThermalPressureLevel = a3;
}

- (int)peakPowerPressureToken
{
  return self->_peakPowerPressureToken;
}

- (void)setPeakPowerPressureToken:(int)a3
{
  self->_peakPowerPressureToken = a3;
}

- (BOOL)peakPowerPressureLevel
{
  return self->_peakPowerPressureLevel;
}

- (void)setPeakPowerPressureLevel:(BOOL)a3
{
  self->_peakPowerPressureLevel = a3;
}

@end
