@implementation _DKBacklightMonitor

- (_DKBacklightMonitor)init
{
  _DKBacklightMonitor *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BMSource *source;
  uint8_t v11[16];
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_DKBacklightMonitor;
  v2 = -[_DKMonitor init](&v12, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BE1AFC8], "knowledgeChannel");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_219056000, v3, OS_LOG_TYPE_DEFAULT, "Enabling Backlight monitor", v11, 2u);
    }

    BiomeLibrary();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "Device");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "Display");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "Backlight");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "source");
    v8 = objc_claimAutoreleasedReturnValue();
    source = v2->_source;
    v2->_source = (BMSource *)v8;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[_DKBacklightMonitor deactivate](self, "deactivate");
  v3.receiver = self;
  v3.super_class = (Class)_DKBacklightMonitor;
  -[_DKMonitor dealloc](&v3, sel_dealloc);
}

+ (id)eventStream
{
  return CFSTR("Backlight");
}

+ (id)entitlements
{
  return 0;
}

+ (BOOL)shouldMergeUnchangedEvents
{
  return 1;
}

+ (BOOL)indicatesScreenOnWithNotificationState:(id)a3
{
  return objc_msgSend(a3, "BOOLValue");
}

+ (void)setIsBacklit:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  id obj;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BE1B170], "userContext");
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B170], "userContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B180], "keyPathForBacklightOnStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, v6);

  objc_sync_exit(obj);
}

+ (id)_eventWithState:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = objc_msgSend((id)objc_opt_class(), "indicatesScreenOnWithNotificationState:", v3);

  if ((v4 & 1) != 0)
    objc_msgSend(MEMORY[0x24BE1B048], "yes");
  else
    objc_msgSend(MEMORY[0x24BE1B048], "no");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKBacklightMonitor setIsBacklit:](_DKBacklightMonitor, "setIsBacklit:", v4);
  v6 = (void *)MEMORY[0x24BE1B080];
  objc_msgSend(MEMORY[0x24BE1B130], "displayIsBacklit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "eventWithStream:startDate:endDate:value:", v7, v8, v9, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)obtainCurrentValue
{
  NSObject *v3;
  _QWORD block[5];

  -[_DKMonitor queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41___DKBacklightMonitor_obtainCurrentValue__block_invoke;
  block[3] = &unk_24DA66D10;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (void)start
{
  void *v3;
  const char *v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;
  id location;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_DKBacklightMonitor;
  if (-[_DKMonitor instantMonitorNeedsActivation](&v9, sel_instantMonitorNeedsActivation))
  {
    objc_initWeak(&location, self);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __28___DKBacklightMonitor_start__block_invoke;
    v6[3] = &unk_24DA66E50;
    objc_copyWeak(&v7, &location);
    v6[4] = self;
    v3 = (void *)MEMORY[0x219A29428](v6);
    v4 = (const char *)objc_msgSend(CFSTR("com.apple.iokit.hid.displayStatus"), "UTF8String");
    -[_DKMonitor queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    notify_register_dispatch(v4, &self->notifyToken, v5, v3);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  -[_DKBacklightMonitor obtainCurrentValue](self, "obtainCurrentValue");
}

- (void)stop
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_DKBacklightMonitor;
  if (-[_DKMonitor instantMonitorNeedsDeactivation](&v3, sel_instantMonitorNeedsDeactivation))
    -[_DKBacklightMonitor deactivate](self, "deactivate");
}

- (void)deactivate
{
  int notifyToken;

  notifyToken = self->notifyToken;
  if (notifyToken)
  {
    notify_cancel(notifyToken);
    self->notifyToken = 0;
  }
}

- (void)synchronouslyReflectCurrentValue
{
  void *v3;

  -[_DKMonitor currentEvent](self, "currentEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[_DKBacklightMonitor obtainCurrentValue](self, "obtainCurrentValue");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
}

@end
