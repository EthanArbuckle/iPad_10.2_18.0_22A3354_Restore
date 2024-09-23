@implementation _DKCalendarMonitor

+ (id)eventStream
{
  return CFSTR("NextCalendarEvent");
}

+ (id)entitlements
{
  return &unk_24DA70E98;
}

- (_DKCalendarMonitor)init
{
  _DKCalendarMonitor *v2;
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_DKCalendarMonitor;
  v2 = -[_DKMonitor init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDC74E8]);
    objc_msgSend(v3, "requestAccessToEntityType:completion:", 0, &__block_literal_global_9);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel__receiveDatabaseChangeNotification_, *MEMORY[0x24BDC7420], 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[_DKCalendarMonitor deactivate](self, "deactivate");
  v4.receiver = self;
  v4.super_class = (Class)_DKCalendarMonitor;
  -[_DKMonitor dealloc](&v4, sel_dealloc);
}

- (void)start
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)_DKCalendarMonitor;
  -[_DKMonitor instantMonitorNeedsActivation](&v2, sel_instantMonitorNeedsActivation);
}

- (void)stop
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_DKCalendarMonitor;
  if (-[_DKMonitor instantMonitorNeedsDeactivation](&v3, sel_instantMonitorNeedsDeactivation))
    -[_DKCalendarMonitor deactivate](self, "deactivate");
}

+ (id)_eventWithTitle:(id)a3 interaction:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BE1B058];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "interaction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v8;
  v18[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BE1B080];
  objc_msgSend(MEMORY[0x24BE1B130], "calendarEventStream");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B138], "withTitle:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "eventWithStream:startDate:endDate:value:metadata:", v11, v12, v13, v14, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)update
{
  NSObject *v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  _QWORD block[4];
  id v10;
  id v11;

  -[_DKMonitor queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __28___DKCalendarMonitor_update__block_invoke;
  v8[3] = &unk_24DA66D10;
  v8[4] = self;
  v5 = v8;
  v6 = (void *)os_transaction_create();
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke_8;
  block[3] = &unk_24DA66E28;
  v10 = v6;
  v11 = v5;
  v7 = v6;
  dispatch_async(v3, block);

}

@end
