@implementation _DKWakeRequestMonitor

- (void)obtainNextUserVisibleWakeRequest
{
  CFArrayRef v3;
  CFTypeID v4;
  void *v5;
  NSDate **p_nextUserVisibleWakeRequestDate;
  NSDate *v7;
  NSString *nextUserVisibleWakeRequestor;
  uint64_t v9;
  double v10;
  double v11;
  NSDate *v12;
  NSString *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  NSString *v21;
  NSString *v22;
  NSDate *v23;
  void *v24;
  double v25;
  NSDate *v26;
  void *v27;
  void *v28;
  NSDate *v29;
  void *v30;
  void *v31;
  double v32;
  NSString *v33;
  int64_t v34;
  NSObject *updateTimer;
  dispatch_time_t v36;
  NSString *v37;
  void *v38;
  void *v39;
  NSString *v40;
  NSDate *v41;
  void *cf;

  v3 = IOPMCopyScheduledPowerEvents();
  if (v3)
  {
    cf = v3;
    v4 = CFGetTypeID(v3);
    if (v4 == CFArrayGetTypeID())
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      p_nextUserVisibleWakeRequestDate = &self->_nextUserVisibleWakeRequestDate;
      v7 = self->_nextUserVisibleWakeRequestDate;
      nextUserVisibleWakeRequestor = self->_nextUserVisibleWakeRequestor;
      if (!nextUserVisibleWakeRequestor)
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
        v9 = objc_claimAutoreleasedReturnValue();

        nextUserVisibleWakeRequestor = self->_nextUserVisibleWakeRequestor;
        v7 = (NSDate *)v9;
      }
      v41 = v7;
      v40 = nextUserVisibleWakeRequestor;
      if (*p_nextUserVisibleWakeRequestDate)
      {
        objc_msgSend(v5, "timeIntervalSinceDate:");
        if (v10 >= 120.0 || (objc_msgSend(v5, "timeIntervalSinceDate:", *p_nextUserVisibleWakeRequestDate), v11 < 0.0))
        {
          v12 = *p_nextUserVisibleWakeRequestDate;
          *p_nextUserVisibleWakeRequestDate = 0;

          v13 = self->_nextUserVisibleWakeRequestor;
          self->_nextUserVisibleWakeRequestor = 0;

        }
      }
      v14 = v5;
      if (objc_msgSend(cf, "count"))
      {
        v15 = 0;
        do
        {
          objc_msgSend(cf, "objectAtIndexedSubscript:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("UserVisible"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v17, "BOOLValue"))
          {
            objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("time"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (!*p_nextUserVisibleWakeRequestDate
              || (-[NSDate timeIntervalSinceDate:](*p_nextUserVisibleWakeRequestDate, "timeIntervalSinceDate:", v18),
                  v19 > 0.0))
            {
              objc_msgSend(v5, "timeIntervalSinceDate:", v18);
              if (v20 < 120.0)
              {
                objc_storeStrong((id *)&self->_nextUserVisibleWakeRequestDate, v18);
                objc_msgSend(v16, "objectForKey:", CFSTR("scheduledby"));
                v21 = (NSString *)objc_claimAutoreleasedReturnValue();
                v22 = self->_nextUserVisibleWakeRequestor;
                self->_nextUserVisibleWakeRequestor = v21;

              }
            }

          }
          ++v15;
        }
        while (v15 < objc_msgSend(cf, "count"));
      }
      v23 = *p_nextUserVisibleWakeRequestDate;
      v24 = v41;
      if (v41)
      {
        if (v23)
        {
          -[NSDate timeIntervalSinceDate:](v41, "timeIntervalSinceDate:");
          if (fabs(v25) > 1.0)
            goto LABEL_26;
        }
      }
      else if (!v23)
      {
        v32 = 900.0;
        v33 = v40;
        goto LABEL_33;
      }
      if (!self->_nextUserVisibleWakeRequestor)
      {
        objc_msgSend(MEMORY[0x24BE1B170], "userContext");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BE1B180], "keyPathForNextUserVisibleWakeDate");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setObject:forKeyedSubscript:", v41, v31);

        v29 = v41;
LABEL_28:
        -[NSDate timeIntervalSinceDate:](v29, "timeIntervalSinceDate:", v14);
        v33 = v40;
        if (v32 > 900.0)
        {
          v34 = 900000000000;
          goto LABEL_34;
        }
        if (v32 <= 120.0)
        {
          v34 = 120000000000;
          goto LABEL_34;
        }
LABEL_33:
        v34 = llround(v32 * 1000000000.0);
LABEL_34:
        updateTimer = self->_updateTimer;
        if (updateTimer)
        {
          v36 = dispatch_walltime(0, v34);
          dispatch_source_set_timer(updateTimer, v36, 0xFFFFFFFFFFFFFFFFLL, 0x3CuLL);
        }
        v37 = self->_nextUserVisibleWakeRequestor;
        if (v33)
        {
          if (v37)
          {
            -[NSString isEqual:](v33, "isEqual:", self->_nextUserVisibleWakeRequestor);
            v37 = self->_nextUserVisibleWakeRequestor;
          }
        }
        else if (!v37)
        {
LABEL_41:

          goto LABEL_42;
        }
        objc_msgSend(MEMORY[0x24BE1B170], "userContext");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BE1B198], "keyPathWithKey:", CFSTR("/system/nextUserVisibleWakeRequestor"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setObject:forKeyedSubscript:", v37, v39);

        goto LABEL_41;
      }
LABEL_26:
      v26 = *p_nextUserVisibleWakeRequestDate;
      objc_msgSend(MEMORY[0x24BE1B170], "userContext");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE1B180], "keyPathForNextUserVisibleWakeDate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setObject:forKeyedSubscript:", v26, v28);

      v29 = *p_nextUserVisibleWakeRequestDate;
      goto LABEL_28;
    }
    CFRelease(cf);
  }
  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  cf = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B170], "userContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B180], "keyPathForNextUserVisibleWakeDate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", cf, v24);
LABEL_42:

}

- (void)dealloc
{
  NSObject *updateTimer;
  objc_super v4;

  -[_DKWakeRequestMonitor deactivate](self, "deactivate");
  updateTimer = self->_updateTimer;
  if (updateTimer && !self->_updateTimerResumed)
  {
    dispatch_source_cancel(updateTimer);
    dispatch_resume((dispatch_object_t)self->_updateTimer);
    self->_updateTimerResumed = 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)_DKWakeRequestMonitor;
  -[_DKMonitor dealloc](&v4, sel_dealloc);
}

+ (id)eventStream
{
  return CFSTR("WakeRequestMonitor");
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
  OS_dispatch_source *v4;
  OS_dispatch_source *updateTimer;
  NSObject *v6;
  dispatch_time_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD v11[5];
  _QWORD handler[5];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_DKWakeRequestMonitor;
  if (-[_DKMonitor instantMonitorNeedsActivation](&v13, sel_instantMonitorNeedsActivation))
  {
    -[_DKMonitor queue](self, "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v3);
    updateTimer = self->_updateTimer;
    self->_updateTimer = v4;

    v6 = self->_updateTimer;
    v7 = dispatch_walltime(0, 0);
    dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    v8 = self->_updateTimer;
    v9 = MEMORY[0x24BDAC760];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __30___DKWakeRequestMonitor_start__block_invoke;
    handler[3] = &unk_24DA66D10;
    handler[4] = self;
    dispatch_source_set_event_handler(v8, handler);
    self->_updateTimerResumed = 1;
    dispatch_resume((dispatch_object_t)self->_updateTimer);
    -[_DKMonitor queue](self, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = v9;
    v11[1] = 3221225472;
    v11[2] = __30___DKWakeRequestMonitor_start__block_invoke_2;
    v11[3] = &unk_24DA670E8;
    v11[4] = self;
    notify_register_dispatch("com.apple.system.powermanagement.uservisiblepowerevent", &self->_wakeRequestToken, v10, v11);

  }
}

- (void)stop
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_DKWakeRequestMonitor;
  if (-[_DKMonitor instantMonitorNeedsDeactivation](&v3, sel_instantMonitorNeedsDeactivation))
  {
    self->_updateTimerResumed = 0;
    dispatch_suspend((dispatch_object_t)self->_updateTimer);
    -[_DKWakeRequestMonitor deactivate](self, "deactivate");
  }
}

- (void)deactivate
{
  int wakeRequestToken;

  wakeRequestToken = self->_wakeRequestToken;
  if (wakeRequestToken)
  {
    notify_cancel(wakeRequestToken);
    self->_wakeRequestToken = 0;
  }
}

- (void)synchronouslyReflectCurrentValue
{
  NSObject *v3;
  _QWORD block[5];

  -[_DKMonitor queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57___DKWakeRequestMonitor_synchronouslyReflectCurrentValue__block_invoke;
  block[3] = &unk_24DA66D10;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (NSDate)nextUserVisibleWakeRequestDate
{
  return self->_nextUserVisibleWakeRequestDate;
}

- (void)setNextUserVisibleWakeRequestDate:(id)a3
{
  objc_storeStrong((id *)&self->_nextUserVisibleWakeRequestDate, a3);
}

- (NSString)nextUserVisibleWakeRequestor
{
  return self->_nextUserVisibleWakeRequestor;
}

- (void)setNextUserVisibleWakeRequestor:(id)a3
{
  objc_storeStrong((id *)&self->_nextUserVisibleWakeRequestor, a3);
}

- (int)wakeRequestToken
{
  return self->_wakeRequestToken;
}

- (void)setWakeRequestToken:(int)a3
{
  self->_wakeRequestToken = a3;
}

- (OS_dispatch_source)updateTimer
{
  return self->_updateTimer;
}

- (void)setUpdateTimer:(id)a3
{
  objc_storeStrong((id *)&self->_updateTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateTimer, 0);
  objc_storeStrong((id *)&self->_nextUserVisibleWakeRequestor, 0);
  objc_storeStrong((id *)&self->_nextUserVisibleWakeRequestDate, 0);
}

@end
