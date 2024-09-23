@implementation _DKCPUUsageMonitor

- (unint64_t)getCurrentCPUUsageLevel
{
  unint64_t lastCPUUsageLevel;
  uint64_t v5;

  v5 = 0;
  lastCPUUsageLevel = self->_lastCPUUsageLevel;
  if (-[_DKCPUUsageMonitor updateCPUUsagePercentage:](self, "updateCPUUsagePercentage:", &v5))
    return -[_DKCPUUsageMonitor getCPUUsageLevelFromPercentage:](self, "getCPUUsageLevelFromPercentage:", v5);
  return lastCPUUsageLevel;
}

- (BOOL)updateCPUUsagePercentage:(unint64_t *)a3
{
  unint64_t lastUserTick;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  BOOL v11;
  char v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t lastIdleTick;
  unint64_t lastSysTick;
  unint64_t v18;

  lastUserTick = self->_lastUserTick;
  lastSysTick = self->_lastSysTick;
  v18 = lastUserTick;
  lastIdleTick = self->_lastIdleTick;
  -[_DKCPUUsageMonitor getCPUTicksForUser:system:idle:](self, "getCPUTicksForUser:system:idle:", &v18, &lastSysTick, &lastIdleTick);
  v6 = self->_lastUserTick;
  v7 = self->_lastSysTick;
  v8 = self->_lastIdleTick;
  v9 = v18 - v6;
  v11 = v18 == v6 && lastSysTick == v7 && lastIdleTick == v8;
  v12 = v11;
  if (!v11)
  {
    v13 = lastIdleTick - v8;
    v14 = lastSysTick - v7;
    *a3 = (unint64_t)((double)(v14 + v9) / (double)(v13 + v14 + v9) * 100.0);
    self->_lastUserTick += v9;
    self->_lastSysTick += v14;
    self->_lastIdleTick += v13;
  }
  return v12 ^ 1;
}

- (unint64_t)getCPUUsageLevelFromPercentage:(unint64_t)a3
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = 90;
  v4 = 75;
  v5 = 50;
  if (a3 <= 0x32)
    v5 = 0;
  if (a3 <= 0x4B)
    v4 = v5;
  if (a3 <= 0x5A)
    v3 = v4;
  if (a3 <= 0x5F)
    return v3;
  else
    return 95;
}

- (void)getCPUTicksForUser:(unint64_t *)a3 system:(unint64_t *)a4 idle:(unint64_t *)a5
{
  host_t v8;
  unint64_t v9;
  unint64_t v10;
  mach_msg_type_number_t host_info_outCnt;
  integer_t host_info_out[2];
  uint64_t v13;

  *(_QWORD *)host_info_out = 0;
  v13 = 0;
  host_info_outCnt = 4;
  v8 = MEMORY[0x219A29200](self, a2);
  if (!host_statistics(v8, 3, host_info_out, &host_info_outCnt))
  {
    v9 = host_info_out[1];
    v10 = v13;
    *a3 = (HIDWORD(v13) + host_info_out[0]);
    *a4 = v9;
    *a5 = v10;
  }
}

- (void)setCurrentCPUUsageLevel:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  if (self->_lastCPUUsageLevel != a3)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B170], "userContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B180], "keyPathForCPUUsageLevel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v7);

    self->_lastCPUUsageLevel = a3;
  }
}

+ (id)eventStream
{
  return CFSTR("CPUUsageLevel");
}

+ (id)entitlements
{
  return 0;
}

- (id)loadState
{
  return 0;
}

- (void)start
{
  NSObject *v3;
  _QWORD block[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_DKCPUUsageMonitor;
  if (-[_DKMonitor instantMonitorNeedsActivation](&v5, sel_instantMonitorNeedsActivation))
  {
    -[_DKMonitor queue](self, "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __27___DKCPUUsageMonitor_start__block_invoke;
    block[3] = &unk_24DA66D10;
    block[4] = self;
    dispatch_sync(v3, block);

  }
}

- (void)stop
{
  NSObject *timer;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_DKCPUUsageMonitor;
  if (-[_DKMonitor instantMonitorNeedsDeactivation](&v4, sel_instantMonitorNeedsDeactivation))
  {
    timer = self->_timer;
    if (timer)
      dispatch_suspend(timer);
  }
}

- (void)synchronouslyReflectCurrentValue
{
  -[_DKCPUUsageMonitor setCurrentCPUUsageLevel:](self, "setCurrentCPUUsageLevel:", self->_lastCPUUsageLevel);
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (unint64_t)lastUserTick
{
  return self->_lastUserTick;
}

- (void)setLastUserTick:(unint64_t)a3
{
  self->_lastUserTick = a3;
}

- (unint64_t)lastIdleTick
{
  return self->_lastIdleTick;
}

- (void)setLastIdleTick:(unint64_t)a3
{
  self->_lastIdleTick = a3;
}

- (unint64_t)lastSysTick
{
  return self->_lastSysTick;
}

- (void)setLastSysTick:(unint64_t)a3
{
  self->_lastSysTick = a3;
}

- (unint64_t)lastCPUUsageLevel
{
  return self->_lastCPUUsageLevel;
}

- (void)setLastCPUUsageLevel:(unint64_t)a3
{
  self->_lastCPUUsageLevel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
}

@end
