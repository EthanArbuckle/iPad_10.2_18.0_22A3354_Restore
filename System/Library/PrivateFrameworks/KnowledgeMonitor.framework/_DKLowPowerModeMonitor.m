@implementation _DKLowPowerModeMonitor

+ (id)eventStream
{
  return CFSTR("LowPowerMode");
}

+ (BOOL)shouldMergeUnchangedEvents
{
  return 1;
}

+ (id)_eventWithLowPowerModeState:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3)
    objc_msgSend(MEMORY[0x24BE1B048], "on");
  else
    objc_msgSend(MEMORY[0x24BE1B048], "off");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BE1B080];
  objc_msgSend(MEMORY[0x24BE1B130], "deviceLowPowerModeStream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventWithStream:startDate:endDate:value:", v5, v6, v7, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_BMEventWithLowPowerModeState:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc(MEMORY[0x24BE0C358]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithStarting:", v5);

  return v6;
}

+ (void)setLowPowerMode:(BOOL)a3
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B170], "userContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B180], "keyPathForLowPowerModeStatus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, v4);

}

- (void)start
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BMSource *v7;
  BMSource *source;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)_DKLowPowerModeMonitor;
  if (-[_DKMonitor instantMonitorNeedsActivation](&v15, sel_instantMonitorNeedsActivation))
  {
    BiomeLibrary();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "Device");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "Power");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "LowPowerMode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "source");
    v7 = (BMSource *)objc_claimAutoreleasedReturnValue();
    source = self->_source;
    self->_source = v7;

    objc_msgSend(MEMORY[0x24BE1B170], "userContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B180], "keyPathForLowPowerModeStatus");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DKLowPowerModeMonitor setLowPowerModeStatus:](self, "setLowPowerModeStatus:", v11);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x24BDD1160];
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", self, sel_lowPowerModeStateChanged_, v13, v14);

    -[_DKLowPowerModeMonitor updateLowPowerMode](self, "updateLowPowerMode");
  }
}

- (void)stop
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_DKLowPowerModeMonitor;
  if (-[_DKMonitor instantMonitorNeedsDeactivation](&v6, sel_instantMonitorNeedsDeactivation))
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *MEMORY[0x24BDD1160];
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", self, v4, v5);

  }
}

- (void)synchronouslyReflectCurrentValue
{
  void *v3;

  -[_DKMonitor currentEvent](self, "currentEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[_DKLowPowerModeMonitor updateLowPowerMode](self, "updateLowPowerMode");
}

- (void)updateLowPowerMode
{
  NSObject *v3;
  _QWORD block[5];

  -[_DKMonitor queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44___DKLowPowerModeMonitor_updateLowPowerMode__block_invoke;
  block[3] = &unk_24DA66D10;
  block[4] = self;
  dispatch_async(v3, block);

}

- (NSNumber)lowPowerModeStatus
{
  return self->_lowPowerModeStatus;
}

- (void)setLowPowerModeStatus:(id)a3
{
  objc_storeStrong((id *)&self->_lowPowerModeStatus, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lowPowerModeStatus, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

@end
