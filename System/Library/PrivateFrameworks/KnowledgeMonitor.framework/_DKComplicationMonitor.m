@implementation _DKComplicationMonitor

+ (id)entitlements
{
  return &unk_24DA70DF0;
}

- (void)start
{
  NSObject *v3;
  OS_dispatch_source *v4;
  OS_dispatch_source *timer;
  NSObject *v6;
  uint64_t v7;
  dispatch_block_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  _QWORD v16[4];
  id v17;
  _QWORD block[4];
  id v19;
  id location;

  if (-[_DKMonitor instantMonitorNeedsActivation](self, "instantMonitorNeedsActivation"))
  {
    objc_initWeak(&location, self);
    -[_DKMonitor queue](self, "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v3);
    timer = self->_timer;
    self->_timer = v4;

    v6 = self->_timer;
    v7 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __31___DKComplicationMonitor_start__block_invoke;
    block[3] = &unk_24DA66E78;
    objc_copyWeak(&v19, &location);
    v8 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_INHERIT_QOS_CLASS, QOS_CLASS_UTILITY, 0, block);
    dispatch_source_set_event_handler(v6, v8);

    dispatch_resume((dispatch_object_t)self->_timer);
    v16[0] = v7;
    v16[1] = 3221225472;
    v16[2] = __31___DKComplicationMonitor_start__block_invoke_2;
    v16[3] = &unk_24DA66EA0;
    objc_copyWeak(&v17, &location);
    v9 = (void *)MEMORY[0x219A29428](v16);
    -[_DKMonitor queue](self, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    notify_register_dispatch("com.apple.ClockKit.activeComplicationsChangedNotification", self->_tokens, v10, v9);

    -[_DKMonitor queue](self, "queue");
    v11 = objc_claimAutoreleasedReturnValue();
    notify_register_dispatch("com.apple.sockpuppet.complications.updated", &self->_tokens[1], v11, v9);

    objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "getPairedDevices");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v13, "count"))
    {
      -[_DKMonitor lastUpdate](self, "lastUpdate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        v15[0] = v7;
        v15[1] = 3221225472;
        v15[2] = __31___DKComplicationMonitor_start__block_invoke_3;
        v15[3] = &unk_24DA66D10;
        v15[4] = self;
        objc_msgSend(MEMORY[0x24BE7A5D0], "runBlockWhenDeviceIsClassCUnlocked:", v15);
      }
    }

    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
}

- (void)stop
{
  if (-[_DKMonitor instantMonitorNeedsDeactivation](self, "instantMonitorNeedsDeactivation"))
  {
    notify_cancel(self->_tokens[0]);
    self->_tokens[0] = -1;
    notify_cancel(self->_tokens[1]);
    self->_tokens[1] = -1;
    dispatch_source_cancel((dispatch_source_t)self->_timer);
  }
}

- (void)fetchActiveComplications:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int IsGreaterThanOrEqual;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD *v18;
  _QWORD v19[5];
  id v20;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getActivePairedDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    NRWatchOSVersionForRemoteDevice();
    IsGreaterThanOrEqual = NRVersionIsGreaterThanOrEqual();
    if (IsGreaterThanOrEqual)
      v8 = CFSTR("CLKActiveComplications");
    else
      v8 = CFSTR("activeComplications");
    if (IsGreaterThanOrEqual)
      v9 = CFSTR("com.apple.ClockKit.activeComplications");
    else
      v9 = CFSTR("com.apple.sockpuppet.activeComplications");
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6B2C0]), "initWithDomain:pairedDevice:", v9, v6);
    v11 = (id)objc_msgSend(v10, "synchronize");
    objc_msgSend(v10, "objectForKey:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x3032000000;
    v19[3] = __Block_byref_object_copy__0;
    v19[4] = __Block_byref_object_dispose__0;
    v20 = (id)objc_opt_new();
    objc_msgSend(MEMORY[0x24BE03DE0], "sharedDeviceConnection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __51___DKComplicationMonitor_fetchActiveComplications___block_invoke;
    v15[3] = &unk_24DA66EC8;
    v15[4] = self;
    v18 = v19;
    v14 = v12;
    v16 = v14;
    v17 = v4;
    objc_msgSend(v13, "enumerateInstalledApplicationsOnPairedDevice:withBlock:", v6, v15);

    _Block_object_dispose(v19, 8);
  }
  else
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, MEMORY[0x24BDBD1A8]);
  }

}

- (void)asyncUpdateCurrentActiveComplicationsContext
{
  _QWORD v3[5];

  dispatch_suspend((dispatch_object_t)self->_timer);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __70___DKComplicationMonitor_asyncUpdateCurrentActiveComplicationsContext__block_invoke;
  v3[3] = &unk_24DA66EF0;
  v3[4] = self;
  -[_DKComplicationMonitor fetchActiveComplications:](self, "fetchActiveComplications:", v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
}

@end
