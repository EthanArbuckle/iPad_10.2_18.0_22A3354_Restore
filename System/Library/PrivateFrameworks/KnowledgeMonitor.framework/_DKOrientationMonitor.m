@implementation _DKOrientationMonitor

+ (id)_eventWithValue:(int64_t)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x24BE1B140], "landscape");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3)
      objc_msgSend(MEMORY[0x24BE1B140], "unknown");
    else
      objc_msgSend(MEMORY[0x24BE1B140], "portriat");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v4 = (void *)v3;
  v5 = (void *)MEMORY[0x24BE1B080];
  objc_msgSend(MEMORY[0x24BE1B130], "displayOrientationStream");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventWithStream:startDate:endDate:value:", v6, v7, v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_BMEventWithValue:(int64_t)a3
{
  uint64_t v3;

  if (a3)
    v3 = 2 * (a3 == 1);
  else
    v3 = 1;
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BE0C348]), "initWithCategory:", v3);
}

- (void)dealloc
{
  objc_super v3;

  -[_DKOrientationMonitor deactivate](self, "deactivate");
  v3.receiver = self;
  v3.super_class = (Class)_DKOrientationMonitor;
  -[_DKMonitor dealloc](&v3, sel_dealloc);
}

+ (id)eventStream
{
  return CFSTR("DeviceOrientation");
}

+ (id)entitlements
{
  return &unk_24DA70E50;
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
  FBSDisplayLayoutMonitor *v11;
  FBSDisplayLayoutMonitor *monitor;
  _QWORD v13[5];

  BiomeLibrary();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "Device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "Display");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "InterfaceOrientation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "source");
  v7 = (BMSource *)objc_claimAutoreleasedReturnValue();
  source = self->_source;
  self->_source = v7;

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __30___DKOrientationMonitor_start__block_invoke;
  v13[3] = &unk_24DA67310;
  v13[4] = self;
  v9 = (void *)MEMORY[0x219A29428](v13);
  objc_msgSend(MEMORY[0x24BE38448], "configurationForDefaultMainDisplayMonitor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNeedsUserInteractivePriority:", 0);
  objc_msgSend(v10, "setTransitionHandler:", v9);
  objc_msgSend(MEMORY[0x24BE38438], "monitorWithConfiguration:", v10);
  v11 = (FBSDisplayLayoutMonitor *)objc_claimAutoreleasedReturnValue();
  monitor = self->_monitor;
  self->_monitor = v11;

}

- (void)deactivate
{
  FBSDisplayLayoutMonitor *monitor;

  -[FBSDisplayLayoutMonitor invalidate](self->_monitor, "invalidate");
  monitor = self->_monitor;
  self->_monitor = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
}

@end
