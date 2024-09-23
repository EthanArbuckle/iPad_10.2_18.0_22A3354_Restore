@implementation AXAuditThrottler

+ (id)throttlerWithInterval:(double)a3 target:(id)a4 selector:(SEL)a5 queue:(id)a6 alwaysReschedule:(BOOL)a7
{
  _BOOL8 v7;
  id v11;
  id v12;
  void *v13;

  v7 = a7;
  v11 = a6;
  v12 = a4;
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "set_interval:", a3);
  objc_msgSend(v13, "set_selector:", a5);
  objc_msgSend(v13, "set_target:", v12);

  objc_msgSend(v13, "set_fireQueue:", v11);
  objc_msgSend(v13, "set_alwaysReschedule:", v7);
  return v13;
}

- (OS_dispatch_queue)_fireQueue
{
  OS_dispatch_queue *fireQueue;
  OS_dispatch_queue *v3;
  id v4;

  fireQueue = self->__fireQueue;
  if (fireQueue)
  {
    v3 = fireQueue;
  }
  else
  {
    v3 = (OS_dispatch_queue *)MEMORY[0x24BDAC9B8];
    v4 = MEMORY[0x24BDAC9B8];
  }
  return v3;
}

- (void)_scheduleTimerAfterDelay:(double)a3
{
  void *v5;
  dispatch_time_t v6;
  double v7;
  NSObject *v8;
  dispatch_source_t v9;
  NSObject *v10;
  dispatch_time_t v11;
  double v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *source;
  _QWORD handler[5];

  -[AXAuditThrottler _dispatchTimer](self, "_dispatchTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AXAuditThrottler _dispatchTimer](self, "_dispatchTimer");
    source = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    -[AXAuditThrottler _interval](self, "_interval");
    dispatch_source_set_timer(source, v6, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(v7 * 0.1 * 1000000000.0));

  }
  else
  {
    -[AXAuditThrottler _fireQueue](self, "_fireQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v8);
    -[AXAuditThrottler set_dispatchTimer:](self, "set_dispatchTimer:", v9);

    -[AXAuditThrottler _dispatchTimer](self, "_dispatchTimer");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    -[AXAuditThrottler _interval](self, "_interval");
    dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(v12 * 0.1 * 1000000000.0));

    -[AXAuditThrottler _dispatchTimer](self, "_dispatchTimer");
    v13 = objc_claimAutoreleasedReturnValue();
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __45__AXAuditThrottler__scheduleTimerAfterDelay___block_invoke;
    handler[3] = &unk_25071ABD8;
    handler[4] = self;
    dispatch_source_set_event_handler(v13, handler);

    -[AXAuditThrottler _dispatchTimer](self, "_dispatchTimer");
    v14 = objc_claimAutoreleasedReturnValue();
    dispatch_activate(v14);

  }
}

uint64_t __45__AXAuditThrottler__scheduleTimerAfterDelay___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fire");
}

- (void)_fire
{
  const char *v3;
  void *v4;
  id v5;

  -[AXAuditThrottler _target](self, "_target");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[AXAuditThrottler _selector](self, "_selector");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXAuditThrottler set_lastFireTime:](self, "set_lastFireTime:", v4);

    ((void (*)(id, const char *))objc_msgSend(v5, "methodForSelector:", v3))(v5, v3);
  }
  -[AXAuditThrottler set_pendingFire:](self, "set_pendingFire:", 0);

}

- (void)scheduleNow
{
  uint64_t v3;
  void *v4;
  const char *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  AXAuditThrottler *v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  NSObject *v19;
  id v20;
  _QWORD block[5];

  -[AXAuditThrottler _target](self, "_target");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v20 = (id)v3;
    -[AXAuditThrottler _target](self, "_target");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEqual:", self))
    {

      return;
    }
    v5 = -[AXAuditThrottler _selector](self, "_selector");

    if (v5)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXAuditThrottler _lastFireTime](self, "_lastFireTime");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "timeIntervalSinceDate:", v7);
      v9 = v8;

      -[AXAuditThrottler _interval](self, "_interval");
      v11 = v10;
      if (-[AXAuditThrottler _alwaysReschedule](self, "_alwaysReschedule"))
      {
        -[AXAuditThrottler _interval](self, "_interval");
        v12 = self;
      }
      else
      {
        if (-[AXAuditThrottler _pendingFire](self, "_pendingFire"))
          goto LABEL_16;
        -[AXAuditThrottler _lastFireTime](self, "_lastFireTime");
        v13 = objc_claimAutoreleasedReturnValue();
        if (!v13
          || (v14 = (void *)v13,
              -[AXAuditThrottler _interval](self, "_interval"),
              v16 = v15,
              v14,
              v9 >= v16))
        {
          -[AXAuditThrottler _fireQueue](self, "_fireQueue");
          v19 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __31__AXAuditThrottler_scheduleNow__block_invoke;
          block[3] = &unk_25071ABD8;
          block[4] = self;
          dispatch_async(v19, block);

          goto LABEL_16;
        }
        v17 = v11 - v9;
        -[AXAuditThrottler set_pendingFire:](self, "set_pendingFire:", 1);
        -[AXAuditThrottler _interval](self, "_interval");
        if (v17 < 0.0 || v17 > v18)
          -[AXAuditThrottler _interval](self, "_interval");
        v12 = self;
      }
      -[AXAuditThrottler _scheduleTimerAfterDelay:](v12, "_scheduleTimerAfterDelay:");
LABEL_16:

    }
  }
}

uint64_t __31__AXAuditThrottler_scheduleNow__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fire");
}

- (double)_interval
{
  return self->__interval;
}

- (void)set_interval:(double)a3
{
  self->__interval = a3;
}

- (NSDate)_lastFireTime
{
  return self->__lastFireTime;
}

- (void)set_lastFireTime:(id)a3
{
  objc_storeStrong((id *)&self->__lastFireTime, a3);
}

- (SEL)_selector
{
  return self->__selector;
}

- (void)set_selector:(SEL)a3
{
  self->__selector = a3;
}

- (BOOL)_alwaysReschedule
{
  return self->__alwaysReschedule;
}

- (void)set_alwaysReschedule:(BOOL)a3
{
  self->__alwaysReschedule = a3;
}

- (BOOL)_pendingFire
{
  return self->__pendingFire;
}

- (void)set_pendingFire:(BOOL)a3
{
  self->__pendingFire = a3;
}

- (NSObject)_target
{
  return objc_loadWeakRetained((id *)&self->__target);
}

- (void)set_target:(id)a3
{
  objc_storeWeak((id *)&self->__target, a3);
}

- (void)set_fireQueue:(id)a3
{
  objc_storeStrong((id *)&self->__fireQueue, a3);
}

- (OS_dispatch_source)_dispatchTimer
{
  return self->__dispatchTimer;
}

- (void)set_dispatchTimer:(id)a3
{
  objc_storeStrong((id *)&self->__dispatchTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__dispatchTimer, 0);
  objc_storeStrong((id *)&self->__fireQueue, 0);
  objc_destroyWeak((id *)&self->__target);
  objc_storeStrong((id *)&self->__lastFireTime, 0);
}

@end
