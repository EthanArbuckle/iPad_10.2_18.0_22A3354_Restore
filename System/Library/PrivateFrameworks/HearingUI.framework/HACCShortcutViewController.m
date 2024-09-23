@implementation HACCShortcutViewController

- (HACCShortcutViewController)initWithDelegate:(id)a3
{
  return -[HACCShortcutViewController initWithDelegate:andAvailableModules:](self, "initWithDelegate:andAvailableModules:", a3, 0);
}

- (HACCShortcutViewController)initWithDelegate:(id)a3 andAvailableModules:(id)a4
{
  id v6;
  id v7;
  HACCShortcutViewController *v8;
  HACCShortcutViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  AXDispatchTimer *noiseControlUpdateTimer;
  void *v20;
  void *v21;
  void *v22;
  AXDispatchTimer *v23;
  AXDispatchTimer *bluetoothAvailabilityTimer;
  id v25;
  uint64_t v26;
  NSIndexSet *mainStackIndexSet;
  uint64_t v28;
  NSArray *mainStackOrderArray;
  objc_super v31;

  v6 = a3;
  v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)HACCShortcutViewController;
  v8 = -[HACCShortcutViewController init](&v31, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_bluetoothAvailable = 1;
    -[HACCShortcutViewController setDelegate:](v8, "setDelegate:", v6);
    objc_msgSend(MEMORY[0x24BE4BE88], "sharedUtilities");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "requestCurrentRoutesWithCompletion:", 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v9, sel_bluetoothAvailabilityDidChange_, *MEMORY[0x24BE0F928], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v9, sel_bluetoothAvailabilityDidChange_, *MEMORY[0x24BE0F9C8], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v9, sel_updateRoutes, *MEMORY[0x24BE4BE00], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v9, sel_hearingStatusBarTapped_, CFSTR("SBStatusBarReturnToHearingAidNotification"), 0);

    v15 = objc_alloc(MEMORY[0x24BDFE490]);
    objc_msgSend(MEMORY[0x24BE4BE88], "sharedUtilities");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "routingQueue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v15, "initWithTargetSerialQueue:", v17);
    noiseControlUpdateTimer = v9->_noiseControlUpdateTimer;
    v9->_noiseControlUpdateTimer = (AXDispatchTimer *)v18;

    -[AXDispatchTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:](v9->_noiseControlUpdateTimer, "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:", 1);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:selector:name:object:", v9, sel_updateNoiseControl_, *MEMORY[0x24BE0F920], 0);

    -[HACCShortcutViewController registerNotifications](v9, "registerNotifications");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserver:selector:name:object:", v9, sel_contentCategoryDidChange_, *MEMORY[0x24BEBE088], 0);

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HACCShortcutViewController setModuleToViewControllerMap:](v9, "setModuleToViewControllerMap:", v22);

    v23 = (AXDispatchTimer *)objc_alloc_init(MEMORY[0x24BDFE490]);
    bluetoothAvailabilityTimer = v9->_bluetoothAvailabilityTimer;
    v9->_bluetoothAvailabilityTimer = v23;

    -[HACCShortcutViewController setAvailableModules:](v9, "setAvailableModules:", v7);
    v25 = objc_alloc_init(MEMORY[0x24BDD1698]);
    objc_msgSend(v25, "addIndex:", 0);
    objc_msgSend(v25, "addIndex:", 31);
    objc_msgSend(v25, "addIndex:", 24);
    objc_msgSend(v25, "addIndex:", 30);
    objc_msgSend(v25, "addIndex:", 23);
    objc_msgSend(v25, "addIndex:", 29);
    v26 = objc_msgSend(v25, "copy");
    mainStackIndexSet = v9->_mainStackIndexSet;
    v9->_mainStackIndexSet = (NSIndexSet *)v26;

    -[HACCShortcutViewController stackOrder](v9, "stackOrder");
    v28 = objc_claimAutoreleasedReturnValue();
    mainStackOrderArray = v9->_mainStackOrderArray;
    v9->_mainStackOrderArray = (NSArray *)v28;

  }
  return v9;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)HACCShortcutViewController;
  -[HACCShortcutViewController dealloc](&v4, sel_dealloc);
}

- (id)stackOrder
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v2 = (void *)MEMORY[0x24BDBCEB8];
  -[HACCShortcutViewController availableModules](self, "availableModules");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    v5 = v4;
  }
  else
  {
    v6 = (void *)MEMORY[0x24BDBCEB8];
    objc_msgSend(MEMORY[0x24BE4BE78], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hearingControlCenterOrder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrayWithArray:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v5, "indexOfObject:", &unk_24DD6AFA8);
    if ((objc_msgSend(v5, "containsObject:", &unk_24DD6AFC0) & 1) == 0 && v9 != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v5, "insertObject:atIndex:", &unk_24DD6AFC0, v9 + 1);
  }
  return v5;
}

- (void)registerNotifications
{
  void *v3;
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE64988], "sharedAVSystemController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (uint64_t *)MEMORY[0x24BE64870];
  v5 = (uint64_t *)MEMORY[0x24BE64908];
  v6 = *MEMORY[0x24BE64908];
  v14[0] = *MEMORY[0x24BE64870];
  v14[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAttribute:forKey:error:", v7, *MEMORY[0x24BE64930], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *v4;
  objc_msgSend(MEMORY[0x24BE64988], "sharedAVSystemController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_mediaPlaybackDidChange_, v9, v10);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *v5;
  objc_msgSend(MEMORY[0x24BE64988], "sharedAVSystemController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:object:", self, sel_mediaServerDied, v12, v13);

}

- (void)mediaServerDied
{
  dispatch_time_t v3;
  NSObject *v4;
  _QWORD block[5];

  v3 = dispatch_time(0, 2000000000);
  -[HACCShortcutViewController backgroundUpdateQueue](self, "backgroundUpdateQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__HACCShortcutViewController_mediaServerDied__block_invoke;
  block[3] = &unk_24DD60E68;
  block[4] = self;
  dispatch_after(v3, v4, block);

}

uint64_t __45__HACCShortcutViewController_mediaServerDied__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObserver:", *(_QWORD *)(a1 + 32));

  return objc_msgSend(*(id *)(a1 + 32), "registerNotifications");
}

- (void)mediaPlaybackDidChange:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Media playback did change %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HACCShortcutViewController mediaPlaybackDidChange:]", 214, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)*MEMORY[0x24BE4BD78];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE4BD78], OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_retainAutorelease(v5);
    v8 = v6;
    *(_DWORD *)buf = 136446210;
    v11 = objc_msgSend(v7, "UTF8String");
    _os_log_impl(&dword_21A95E000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  v9 = v3;
  AXPerformBlockOnMainThread();

}

uint64_t __53__HACCShortcutViewController_mediaPlaybackDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 40), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("State"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1048) = objc_msgSend(v3, "BOOLValue");

  return objc_msgSend(*(id *)(a1 + 32), "updateView");
}

- (id)backgroundUpdateQueue
{
  if (backgroundUpdateQueue_onceToken != -1)
    dispatch_once(&backgroundUpdateQueue_onceToken, &__block_literal_global_4);
  return (id)backgroundUpdateQueue_backgroundUpdateQueue;
}

void __51__HACCShortcutViewController_backgroundUpdateQueue__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *v3;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INTERACTIVE, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("hucc.background.queue", v0);
  v2 = (void *)backgroundUpdateQueue_backgroundUpdateQueue;
  backgroundUpdateQueue_backgroundUpdateQueue = (uint64_t)v1;

}

- (void)updateRoutes
{
  void *v3;
  _QWORD v4[5];

  objc_msgSend(MEMORY[0x24BE4BE88], "sharedUtilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __42__HACCShortcutViewController_updateRoutes__block_invoke;
  v4[3] = &unk_24DD61720;
  v4[4] = self;
  objc_msgSend(v3, "requestCurrentRoutesWithCompletion:", v4);

}

void __42__HACCShortcutViewController_updateRoutes__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  v9 = a2;
  objc_msgSend(*(id *)(a1 + 32), "previousListeningModeForAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(v9, "objectForKey:", CFSTR("AXSHARoutePicked"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BE4BE38]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsString:", v5);

    if ((v8 & 1) == 0)
      objc_msgSend(*(id *)(a1 + 32), "setPreviousListeningModeForAddress:", 0);
  }

}

- (void)hearingStatusBarTapped:(id)a3
{
  -[HACCShortcutViewController updateContentViewListeners:](self, "updateContentViewListeners:", 1);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  UIStackView *v5;
  UIStackView *stackView;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HACCShortcutViewController;
  -[HACCShortcutViewController viewDidLoad](&v8, sel_viewDidLoad);
  v3 = objc_alloc_init(MEMORY[0x24BEBD918]);
  objc_msgSend(v3, "setShowsVerticalScrollIndicator:", 0);
  objc_msgSend(v3, "setShowsHorizontalScrollIndicator:", 0);
  objc_msgSend(v3, "setClipsToBounds:", 0);
  -[HACCShortcutViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v3);

  -[HACCShortcutViewController setScrollView:](self, "setScrollView:", v3);
  v5 = (UIStackView *)objc_alloc_init(MEMORY[0x24BEBD978]);
  stackView = self->_stackView;
  self->_stackView = v5;

  -[UIStackView setSpacing:](self->_stackView, "setSpacing:", 12.0);
  -[UIStackView setDistribution:](self->_stackView, "setDistribution:", 3);
  -[UIStackView setAxis:](self->_stackView, "setAxis:", 1);
  objc_msgSend(v3, "addSubview:", self->_stackView);
  objc_msgSend(MEMORY[0x24BE4BE48], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sendMessagesPriorityDefault");

}

- (void)listenForHearingAidUpdates
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id location;

  objc_msgSend(MEMORY[0x24BE4BE70], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pairedHearingAids");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HACCShortcutViewController listeningForHearingAidUpdates](self, "listeningForHearingAidUpdates") || !v4)
  {
    if (!v4)
      -[HACCShortcutViewController setCurrentHearingDevice:](self, "setCurrentHearingDevice:", 0);
  }
  else
  {
    -[HACCShortcutViewController setListeningForHearingAidUpdates:](self, "setListeningForHearingAidUpdates:", 1);
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x24BE4BE48], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x24BDAC760];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __56__HACCShortcutViewController_listenForHearingAidUpdates__block_invoke;
    v17[3] = &unk_24DD61748;
    objc_copyWeak(&v18, &location);
    objc_msgSend(v5, "registerListener:forAvailableDeviceHandler:", self, v17);

    objc_msgSend(MEMORY[0x24BE4BE48], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v6;
    v13 = 3221225472;
    v14 = __56__HACCShortcutViewController_listenForHearingAidUpdates__block_invoke_2;
    v15 = &unk_24DD617E8;
    objc_copyWeak(&v16, &location);
    objc_msgSend(v7, "registerListener:forPropertyUpdateHandler:", self, &v12);

    AXPerformBlockOnMainThreadAfterDelay();
    -[HACCShortcutViewController currentHearingDevice](self, "currentHearingDevice", v6, 3221225472, __56__HACCShortcutViewController_listenForHearingAidUpdates__block_invoke_3_53, &unk_24DD60E68, self, v12, v13, v14, v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setKeepInSync:", 1);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  -[HACCShortcutViewController currentHearingDevice](self, "currentHearingDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "didLoadRequiredProperties");

  if ((v10 & 1) == 0)
  {
    -[HACCShortcutViewController currentHearingDevice](self, "currentHearingDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "loadRequiredProperties");

  }
}

void __56__HACCShortcutViewController_listenForHearingAidUpdates__block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id WeakRetained;
  void *v5;
  id v6;
  id v7;
  id v8;

  objc_msgSend(a2, "lastObject");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "currentHearingDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = objc_loadWeakRetained(v3);
    objc_msgSend(v6, "setShouldDisplayOtherDevice:", 0);

  }
  v7 = objc_loadWeakRetained(v3);
  objc_msgSend(v7, "setCurrentHearingDevice:", v8);

  objc_msgSend(v8, "loadRequiredProperties");
}

void __56__HACCShortcutViewController_listenForHearingAidUpdates__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "currentHearingDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __56__HACCShortcutViewController_listenForHearingAidUpdates__block_invoke_3;
  v8[3] = &unk_24DD617C0;
  v7 = v6;
  v9 = v7;
  objc_copyWeak(&v10, v4);
  objc_msgSend(v3, "enumerateKeysAndObjectsInDependentOrderUsingBlock:", v8);
  objc_destroyWeak(&v10);

}

void __56__HACCShortcutViewController_listenForHearingAidUpdates__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "containsPeripheralWithUUID:", v5))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        HAInitializeLogging();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Update %@"), v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HACCShortcutViewController listenForHearingAidUpdates]_block_invoke_3", 304, v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)*MEMORY[0x24BE4BD78];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE4BD78], OS_LOG_TYPE_DEFAULT))
        {
          v10 = objc_retainAutorelease(v8);
          v11 = v9;
          *(_DWORD *)buf = 136446210;
          v17 = objc_msgSend(v10, "UTF8String");
          _os_log_impl(&dword_21A95E000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

        }
        v14[0] = MEMORY[0x24BDAC760];
        v14[1] = 3221225472;
        v14[2] = __56__HACCShortcutViewController_listenForHearingAidUpdates__block_invoke_49;
        v14[3] = &unk_24DD61770;
        v15 = *(id *)(a1 + 32);
        objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v14);
        objc_copyWeak(&v13, (id *)(a1 + 40));
        v12 = v6;
        AXPerformBlockOnMainThread();

        objc_destroyWeak(&v13);
      }
    }
  }

}

void __56__HACCShortcutViewController_listenForHearingAidUpdates__block_invoke_49(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "setValue:forProperty:", v5, objc_msgSend(a2, "unsignedLongLongValue"));

}

void __56__HACCShortcutViewController_listenForHearingAidUpdates__block_invoke_2_51(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "updateViewForProperties:", v2);

}

uint64_t __56__HACCShortcutViewController_listenForHearingAidUpdates__block_invoke_3_53(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateView");
}

- (void)startListeningForHeadphoneUpdates
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[8];
  id location;

  if (!-[HACCShortcutViewController listeningForHeadphoneUpdates](self, "listeningForHeadphoneUpdates"))
  {
    objc_msgSend(MEMORY[0x24BE4BE70], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "liveHeadphoneLevelEnabled");

    if (v4)
    {
      -[HACCShortcutViewController setListeningForHeadphoneUpdates:](self, "setListeningForHeadphoneUpdates:", 1);
      objc_initWeak(&location, self);
      HCLogSoundMeter();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21A95E000, v5, OS_LOG_TYPE_INFO, "Registering listener to start receiving headphone audio updates", buf, 2u);
      }

      if (-[HACCShortcutViewController _isStandaloneHeadphoneLevels](self, "_isStandaloneHeadphoneLevels"))
      {
        if (!-[HACCShortcutViewController headphoneAudioAvailable](self, "headphoneAudioAvailable"))
          -[HACCShortcutViewController resetHeadphoneLevelModule](self, "resetHeadphoneLevelModule");
      }
      objc_msgSend(MEMORY[0x24BE4BE48], "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = __63__HACCShortcutViewController_startListeningForHeadphoneUpdates__block_invoke;
      v7[3] = &unk_24DD617E8;
      objc_copyWeak(&v8, &location);
      objc_msgSend(v6, "registerListener:forLiveHeadphoneLevelHandler:", self, v7);

      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
  }
}

void __63__HACCShortcutViewController_startListeningForHeadphoneUpdates__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id *v6;
  id WeakRetained;
  int v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v3 = a2;
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BE4BE18]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  v6 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v6);
  v8 = objc_msgSend(WeakRetained, "headphoneAudioAvailable");

  if ((_DWORD)v5 != v8 && (!UIAccessibilityIsVoiceOverRunning() | v5) == 1)
  {
    v9 = objc_loadWeakRetained(v6);
    objc_msgSend(v9, "setHeadphoneAudioAvailable:", v5);

    objc_copyWeak(&v13, v6);
    AXPerformBlockOnMainThread();
    objc_destroyWeak(&v13);
  }
  v10 = objc_loadWeakRetained(v6);
  objc_msgSend(v10, "moduleToViewControllerMap");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", &unk_24DD6AFC0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "updateWithValue:", v3);
}

void __63__HACCShortcutViewController_startListeningForHeadphoneUpdates__block_invoke_2(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  int v3;
  id v4;
  id v5;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(WeakRetained, "_isStandaloneHeadphoneLevels");

  v4 = objc_loadWeakRetained(v1);
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "resetHeadphoneLevelModule");
  else
    objc_msgSend(v4, "updateView");

}

- (void)resetHeadphoneLevelModule
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[HACCShortcutViewController moduleToViewControllerMap](self, "moduleToViewControllerMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", &unk_24DD6AFC0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "removeFromParentViewController");
  objc_msgSend(v6, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

  -[HACCShortcutViewController moduleToViewControllerMap](self, "moduleToViewControllerMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", &unk_24DD6AFC0);

  -[HACCShortcutViewController updateView](self, "updateView");
}

- (void)stopListeningForHeadphoneUpdates
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  HCLogSoundMeter();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21A95E000, v3, OS_LOG_TYPE_INFO, "Unregistering listener to stop receiving headphone audio updates", v5, 2u);
  }

  objc_msgSend(MEMORY[0x24BE4BE48], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unregisterLiveHeadphoneLevelHandler:", self);

  -[HACCShortcutViewController setListeningForHeadphoneUpdates:](self, "setListeningForHeadphoneUpdates:", 0);
  -[HACCShortcutViewController setHeadphoneAudioAvailable:](self, "setHeadphoneAudioAvailable:", 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HACCShortcutViewController;
  -[HACCShortcutViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[HACCShortcutViewController updateAvailableControls](self, "updateAvailableControls");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HACCShortcutViewController;
  -[HACCShortcutViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  objc_msgSend(MEMORY[0x24BE4BE88], "sharedUtilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearAudioRoutes");

  -[HACCShortcutViewController updateRoutes](self, "updateRoutes");
  -[HACCShortcutViewController listenForHearingAidUpdates](self, "listenForHearingAidUpdates");
  -[HACCShortcutViewController startListeningForHeadphoneUpdates](self, "startListeningForHeadphoneUpdates");
  objc_msgSend(MEMORY[0x24BE4BE48], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendMessagesPriorityHigh");

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HACCShortcutViewController;
  -[HACCShortcutViewController viewDidDisappear:](&v7, sel_viewDidDisappear_, a3);
  if (!-[HACCShortcutViewController isExpanded](self, "isExpanded"))
  {
    objc_msgSend(MEMORY[0x24BE4BE48], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unregisterUpdateListener:", self);

    -[HACCShortcutViewController currentHearingDevice](self, "currentHearingDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setKeepInSync:", 0);

    -[HACCShortcutViewController setListeningForHearingAidUpdates:](self, "setListeningForHearingAidUpdates:", 0);
    -[HACCShortcutViewController stopListeningForHeadphoneUpdates](self, "stopListeningForHeadphoneUpdates");
    objc_msgSend(MEMORY[0x24BE4BE48], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sendMessagesPriorityDefault");

  }
}

- (void)viewIsAppearing:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HACCShortcutViewController;
  -[HACCShortcutViewController viewIsAppearing:](&v5, sel_viewIsAppearing_, a3);
  -[HACCShortcutViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClipsToBounds:", 0);

  -[HACCShortcutViewController updateAvailableControls](self, "updateAvailableControls");
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  uint64_t v4;
  id v6;
  objc_super v7;

  v4 = a4;
  v7.receiver = self;
  v7.super_class = (Class)HACCShortcutViewController;
  v6 = a3;
  -[HACCShortcutViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v7, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, v6, v4);
  NSClassFromString(CFSTR("SBTransientOverlayWindow"));
  LOBYTE(v4) = objc_opt_isKindOfClass();

  if ((v4 & 1) != 0)
    -[HACCShortcutViewController updateAvailableControls](self, "updateAvailableControls", v7.receiver, v7.super_class);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;
  objc_super v14;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HACCShortcutViewController;
  -[HACCShortcutViewController viewWillTransitionToSize:withTransitionCoordinator:](&v14, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  objc_initWeak(&location, self);
  v8 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __81__HACCShortcutViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v11[3] = &unk_24DD61810;
  objc_copyWeak(&v12, &location);
  v9[0] = v8;
  v9[1] = 3221225472;
  v9[2] = __81__HACCShortcutViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v9[3] = &unk_24DD61810;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v11, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __81__HACCShortcutViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateAvailableControls");

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "updateHeight");

}

void __81__HACCShortcutViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  char v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v5 = objc_msgSend(WeakRetained, "isExpanded");

  if ((v5 & 1) == 0)
  {
    v6 = objc_loadWeakRetained(v2);
    objc_msgSend(v6, "updateHeight");

  }
  objc_msgSend(v3, "viewControllerForKey:", *MEMORY[0x24BEBE9A0]);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewControllerForKey:", *MEMORY[0x24BEBE9B0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  NSClassFromString(CFSTR("CCUIMainViewController"));
  NSClassFromString(CFSTR("CCUIContentModuleContainerViewController"));
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = objc_loadWeakRetained(v2);
    v9 = v8;
    v10 = 1;
LABEL_9:
    objc_msgSend(v8, "updateContentViewListeners:", v10);

    goto LABEL_10;
  }
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = objc_loadWeakRetained(v2);
    v9 = v8;
    v10 = 0;
    goto LABEL_9;
  }
LABEL_10:

}

- (void)bluetoothAvailabilityDidChange:(id)a3
{
  AXDispatchTimer *bluetoothAvailabilityTimer;
  _QWORD v5[5];

  -[AXDispatchTimer cancel](self->_bluetoothAvailabilityTimer, "cancel", a3);
  bluetoothAvailabilityTimer = self->_bluetoothAvailabilityTimer;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __61__HACCShortcutViewController_bluetoothAvailabilityDidChange___block_invoke;
  v5[3] = &unk_24DD60E68;
  v5[4] = self;
  -[AXDispatchTimer afterDelay:processBlock:](bluetoothAvailabilityTimer, "afterDelay:processBlock:", v5, 0.5);
}

void __61__HACCShortcutViewController_bluetoothAvailabilityDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  int v8;

  objc_msgSend(MEMORY[0x24BE0F9E0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "available") & 1) == 0)
  {

LABEL_6:
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(unsigned __int8 *)(v7 + 1050);
    *(_BYTE *)(v7 + 1050) = 0;
    if (!v8)
      return;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x24BE0F9E0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "powered");

  if ((v4 & 1) == 0)
    goto LABEL_6;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(unsigned __int8 *)(v5 + 1050);
  *(_BYTE *)(v5 + 1050) = 1;
  if (v6)
    return;
LABEL_7:
  AXPerformBlockOnMainThread();
}

uint64_t __61__HACCShortcutViewController_bluetoothAvailabilityDidChange___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateView");
}

- (void)updateNoiseControl:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HACCShortcutViewController backgroundUpdateQueue](self, "backgroundUpdateQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__HACCShortcutViewController_updateNoiseControl___block_invoke;
  block[3] = &unk_24DD60E68;
  block[4] = self;
  dispatch_async(v4, block);

}

void __49__HACCShortcutViewController_updateNoiseControl___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  paCurrentBluetoothDeviceSupportingTransparencyAccommodations();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "address");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "listeningMode");
  if (v3)
  {
    v5 = v4;
    objc_msgSend(*(id *)(a1 + 32), "previousListeningModeForAddress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = *(void **)(a1 + 32);
      v11 = v3;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = v9;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setPreviousListeningModeForAddress:", v10);

    }
  }

}

- (void)contentCategoryDidChange:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v6[5];

  -[HACCShortcutViewController moduleToViewControllerMap](self, "moduleToViewControllerMap", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __55__HACCShortcutViewController_contentCategoryDidChange___block_invoke;
  v6[3] = &unk_24DD61838;
  v6[4] = self;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v6);

  -[HACCShortcutViewController moduleToViewControllerMap](self, "moduleToViewControllerMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  -[HACCShortcutViewController updateAvailableControls](self, "updateAvailableControls");
}

void __55__HACCShortcutViewController_contentCategoryDidChange___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a3;
  objc_msgSend(v3, "stackView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeArrangedSubview:", v6);

  objc_msgSend(v4, "view");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "removeFromSuperview");
}

- (BOOL)shouldDisplayControlForModule:(unint64_t)a3
{
  void *v5;
  void *v6;

  -[HACCShortcutViewController mainStackOrderArray](self, "mainStackOrderArray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HACCShortcutViewController mainStackOrderArray](self, "mainStackOrderArray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = -[HACCShortcutViewController shouldDisplayControlForModule:fromModulesArray:mainStackOrderArrayCopy:](self, "shouldDisplayControlForModule:fromModulesArray:mainStackOrderArrayCopy:", a3, v5, v6);

  return a3;
}

- (BOOL)shouldDisplayControlForModule:(unint64_t)a3 fromModulesArray:(id)a4 mainStackOrderArrayCopy:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  _BOOL4 bluetoothAvailable;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  char v19;
  void *v20;
  char v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  char v26;
  char v27;
  void *v28;
  uint64_t v29;
  char v30;
  char v31;
  char v32;
  char v33;
  int v34;
  char v35;
  char v36;
  void *v37;
  uint64_t v38;
  char v39;
  char v40;
  void *v41;
  char v42;
  char v43;
  int v44;
  void *v45;
  char v46;
  void *v47;
  uint64_t v48;
  BOOL v49;
  void *v50;
  uint64_t v51;
  BOOL v52;
  void *v53;
  uint64_t v54;
  BOOL v55;
  void *v56;
  uint64_t v57;
  _BOOL4 v58;
  char v59;
  void *v60;
  uint64_t v61;
  _BOOL4 v62;
  void *v63;
  uint64_t v64;
  _BOOL4 v65;
  void *v66;
  char v67;
  void *v68;
  char v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  unsigned int v75;
  int v76;
  char v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  char v83;
  char v84;
  void *v85;
  char v86;
  char v88;
  void *v89;

  v8 = a4;
  v9 = a5;
  -[HACCShortcutViewController currentHearingDevice](self, "currentHearingDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BE4BE48], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "hearingAidReachable"))
      bluetoothAvailable = self->_bluetoothAvailable;
    else
      bluetoothAvailable = 0;

  }
  else
  {
    bluetoothAvailable = 0;
  }

  -[HACCShortcutViewController currentHearingDevice](self, "currentHearingDevice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  switch(a3)
  {
    case 0uLL:
      v20 = &unk_24DD6AFA8;
      goto LABEL_86;
    case 1uLL:
      v21 = objc_msgSend(v13, "propertyIsAvailable:forEar:", 0x4000000000, 2);
      v22 = v14;
      v23 = 0x4000000000;
      goto LABEL_23;
    case 2uLL:
      v21 = objc_msgSend(v13, "propertyIsAvailable:forEar:", 0x4000000000, 4);
      v24 = v14;
      v25 = 0x4000000000;
      goto LABEL_26;
    case 3uLL:
      v26 = objc_msgSend(v13, "propertyIsAvailable:forEar:", 0x4000000000, 2);
      v27 = objc_msgSend(v14, "propertyIsAvailable:forEar:", 0x4000000000, 4);
      v28 = v14;
      v29 = 0x4000000000;
      goto LABEL_30;
    case 4uLL:
      v21 = objc_msgSend(v13, "propertyIsAvailable:forEar:", 64, 2);
      v22 = v14;
      v23 = 64;
      goto LABEL_23;
    case 5uLL:
      v21 = objc_msgSend(v13, "propertyIsAvailable:forEar:", 64, 4);
      v24 = v14;
      v25 = 64;
      goto LABEL_26;
    case 6uLL:
      v26 = objc_msgSend(v13, "propertyIsAvailable:forEar:", 64, 2);
      v27 = objc_msgSend(v14, "propertyIsAvailable:forEar:", 64, 4);
      v28 = v14;
      v29 = 64;
      goto LABEL_30;
    case 7uLL:
      v21 = objc_msgSend(v13, "propertyIsAvailable:forEar:", 0x80000000, 2);
      v22 = v14;
      v23 = 0x80000000;
LABEL_23:
      v30 = objc_msgSend(v22, "shouldOnlyShowIndividualVolumesForProperty:", v23);
      if (!bluetoothAvailable)
        goto LABEL_129;
      v31 = v30;
      v32 = objc_msgSend(v14, "isLeftConnected");
      goto LABEL_28;
    case 8uLL:
      v21 = objc_msgSend(v13, "propertyIsAvailable:forEar:", 0x80000000, 4);
      v24 = v14;
      v25 = 0x80000000;
LABEL_26:
      v33 = objc_msgSend(v24, "shouldOnlyShowIndividualVolumesForProperty:", v25);
      if (!bluetoothAvailable)
        goto LABEL_129;
      v31 = v33;
      v32 = objc_msgSend(v14, "isRightConnected");
LABEL_28:
      LOBYTE(v34) = v32 & v21 & v31;
      goto LABEL_153;
    case 9uLL:
      v26 = objc_msgSend(v13, "propertyIsAvailable:forEar:", 0x80000000, 2);
      v27 = objc_msgSend(v14, "propertyIsAvailable:forEar:", 0x80000000, 4);
      v28 = v14;
      v29 = 0x80000000;
LABEL_30:
      v35 = objc_msgSend(v28, "shouldOnlyShowIndividualVolumesForProperty:", v29);
      if (!bluetoothAvailable)
        goto LABEL_129;
      v36 = v35;
      if (!objc_msgSend(v14, "isLeftConnected") || !objc_msgSend(v14, "isRightConnected"))
        goto LABEL_129;
      LOBYTE(v34) = (v26 | v27) & ~v36;
      goto LABEL_153;
    case 0xAuLL:
      if ((objc_msgSend(v13, "propertyIsAvailable:forEar:", 0x2000000000, 2) & 1) != 0)
        goto LABEL_37;
      v37 = v14;
      v38 = 0x2000000000;
      goto LABEL_107;
    case 0xBuLL:
      if ((objc_msgSend(v13, "propertyIsAvailable:forEar:", 0x1000000000, 2) & 1) != 0)
      {
LABEL_37:
        LOBYTE(v34) = 1;
        if (!bluetoothAvailable)
        {
LABEL_129:
          LOBYTE(v34) = 0;
          goto LABEL_153;
        }
      }
      else
      {
        v37 = v14;
        v38 = 0x1000000000;
LABEL_107:
        LOBYTE(v34) = objc_msgSend(v37, "propertyIsAvailable:forEar:", v38, 4);
        if (!bluetoothAvailable)
          goto LABEL_129;
      }
      if ((objc_msgSend(v14, "isLeftConnected") & 1) == 0 && !objc_msgSend(v14, "isRightConnected"))
        goto LABEL_129;
LABEL_153:

      return v34;
    case 0xCuLL:
      v39 = objc_msgSend(v13, "propertyIsAvailable:forEar:", 128, 2);
      v40 = objc_msgSend(v14, "shouldOnlyShowIndividualVolumesForProperty:", 128);
      objc_msgSend(v14, "leftSelectedStreamingProgram");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v41, "isSelected"))
        v42 = objc_msgSend(v41, "isStreamOrMixingStream");
      else
        v42 = 0;
      if (!bluetoothAvailable)
        goto LABEL_149;
      v83 = objc_msgSend(v14, "isLeftConnected");
      goto LABEL_117;
    case 0xDuLL:
      v39 = objc_msgSend(v13, "propertyIsAvailable:forEar:", 128, 4);
      v40 = objc_msgSend(v14, "shouldOnlyShowIndividualVolumesForProperty:", 128);
      objc_msgSend(v14, "rightSelectedStreamingProgram");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v41, "isSelected"))
        v42 = objc_msgSend(v41, "isStreamOrMixingStream");
      else
        v42 = 0;
      if (!bluetoothAvailable)
        goto LABEL_149;
      v83 = objc_msgSend(v14, "isRightConnected");
LABEL_117:
      LOBYTE(v34) = v83 & v39 & v40 & v42;
      goto LABEL_152;
    case 0xEuLL:
      v88 = objc_msgSend(v13, "propertyIsAvailable:forEar:", 128, 2);
      v43 = objc_msgSend(v14, "propertyIsAvailable:forEar:", 128, 4);
      v44 = objc_msgSend(v14, "shouldOnlyShowIndividualVolumesForProperty:", 128);
      objc_msgSend(v14, "leftSelectedStreamingProgram");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "rightSelectedStreamingProgram");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v41, "isSelected"))
        v46 = objc_msgSend(v41, "isStreamOrMixingStream");
      else
        v46 = 0;
      if (objc_msgSend(v45, "isSelected"))
        v84 = objc_msgSend(v45, "isStreamOrMixingStream");
      else
        v84 = 0;
      if (!bluetoothAvailable
        || !objc_msgSend(v14, "isLeftConnected")
        || ((objc_msgSend(v14, "isRightConnected") ^ 1 | v44) & 1) != 0)
      {
        goto LABEL_135;
      }
      LOBYTE(v34) = v46 & v88 | v84 & v43;
      goto LABEL_136;
    case 0xFuLL:
      objc_msgSend(v13, "leftPrograms");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "count");

      v49 = v48 == 0;
      goto LABEL_49;
    case 0x10uLL:
      objc_msgSend(v13, "rightPrograms");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v50, "count");

      v52 = v51 == 0;
      goto LABEL_56;
    case 0x11uLL:
      objc_msgSend(v13, "programs");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v53, "count");

      v55 = v54 == 0;
      goto LABEL_63;
    case 0x12uLL:
      objc_msgSend(v13, "leftPrograms");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(v56, "indexOfObjectPassingTest:", &__block_literal_global_77);

      v49 = v57 == 0x7FFFFFFFFFFFFFFFLL;
LABEL_49:
      v58 = !v49 && bluetoothAvailable;
      if (!v58 || (objc_msgSend(v14, "showCombinedPrograms") & 1) != 0)
        goto LABEL_129;
      v59 = objc_msgSend(v14, "isLeftConnected");
      goto LABEL_105;
    case 0x13uLL:
      objc_msgSend(v13, "rightPrograms");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = objc_msgSend(v60, "indexOfObjectPassingTest:", &__block_literal_global_78);

      v52 = v61 == 0x7FFFFFFFFFFFFFFFLL;
LABEL_56:
      v62 = !v52 && bluetoothAvailable;
      if (!v62 || (objc_msgSend(v14, "showCombinedPrograms") & 1) != 0)
        goto LABEL_129;
      goto LABEL_69;
    case 0x14uLL:
      objc_msgSend(v13, "programs");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = objc_msgSend(v63, "indexOfObjectPassingTest:", &__block_literal_global_79);

      v55 = v64 == 0x7FFFFFFFFFFFFFFFLL;
LABEL_63:
      v65 = !v55 && bluetoothAvailable;
      if (!v65 || !objc_msgSend(v14, "showCombinedPrograms"))
        goto LABEL_129;
      if ((objc_msgSend(v14, "isLeftConnected") & 1) != 0)
        goto LABEL_74;
LABEL_69:
      v59 = objc_msgSend(v14, "isRightConnected");
      goto LABEL_105;
    case 0x15uLL:
      -[HACCShortcutViewController currentHearingDevice](self, "currentHearingDevice");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v66, "propertyIsAvailable:forEar:", 0x10000000000, 2) & 1) != 0)
      {
        v67 = 0;
      }
      else
      {
        -[HACCShortcutViewController currentHearingDevice](self, "currentHearingDevice");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        v86 = objc_msgSend(v85, "propertyIsAvailable:forEar:", 0x10000000000, 4);

        v67 = v86 ^ 1;
      }

      LOBYTE(v34) = 0;
      if (!bluetoothAvailable || (v67 & 1) != 0)
        goto LABEL_153;
      if (!objc_msgSend(v14, "availableInputEars"))
        goto LABEL_129;
      v34 = hearingAidReceivingAudio() ^ 1;
      goto LABEL_153;
    case 0x16uLL:
      LOBYTE(v34) = bluetoothAvailable;
      goto LABEL_153;
    case 0x17uLL:
      if (-[HACCShortcutViewController _isStandaloneHeadphoneLevelsFromMainStackOrderArray:](self, "_isStandaloneHeadphoneLevelsFromMainStackOrderArray:", v9))
      {
        goto LABEL_74;
      }
      if (!-[HACCShortcutViewController headphoneAudioAvailable](self, "headphoneAudioAvailable"))
        goto LABEL_129;
      objc_msgSend(MEMORY[0x24BE4BE70], "sharedInstance");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v41, "liveHeadphoneLevelEnabled"))
      {
        v68 = &unk_24DD6AFA8;
LABEL_80:
        v69 = objc_msgSend(v8, "containsObject:", v68);
LABEL_151:
        LOBYTE(v34) = v69;
      }
      else
      {
LABEL_149:
        LOBYTE(v34) = 0;
      }
      goto LABEL_152;
    case 0x18uLL:
      objc_msgSend(MEMORY[0x24BE4BE68], "sharedInstance");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v41, "comfortSoundsAvailable"))
        goto LABEL_149;
      goto LABEL_79;
    case 0x19uLL:
      objc_msgSend(MEMORY[0x24BE4BE68], "sharedInstance");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v41, "comfortSoundsAvailable") || self->_mediaIsPlaying)
        goto LABEL_149;
LABEL_79:
      v68 = &unk_24DD6B020;
      goto LABEL_80;
    case 0x1AuLL:
      objc_msgSend(MEMORY[0x24BE4BE68], "sharedInstance");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v41, "comfortSoundsAvailable"))
        goto LABEL_149;
      objc_msgSend(MEMORY[0x24BE4BE68], "sharedInstance");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v45, "mixesWithMedia") && self->_mediaIsPlaying)
      {
        v70 = &unk_24DD6B020;
LABEL_91:
        LOBYTE(v34) = objc_msgSend(v8, "containsObject:", v70);
      }
      else
      {
LABEL_135:
        LOBYTE(v34) = 0;
      }
LABEL_136:

LABEL_152:
      goto LABEL_153;
    case 0x1BuLL:
    case 0x1CuLL:
      if (!-[HACCShortcutViewController shouldDisplayControlForModule:fromModulesArray:mainStackOrderArrayCopy:](self, "shouldDisplayControlForModule:fromModulesArray:mainStackOrderArrayCopy:", 25, v8, v9)&& !-[HACCShortcutViewController shouldDisplayControlForModule:fromModulesArray:mainStackOrderArrayCopy:](self, "shouldDisplayControlForModule:fromModulesArray:mainStackOrderArrayCopy:", 26, v8, v9))
      {
        goto LABEL_129;
      }
      v20 = &unk_24DD6B020;
LABEL_86:
      v59 = objc_msgSend(v8, "containsObject:", v20);
      goto LABEL_105;
    case 0x1DuLL:
      v20 = &unk_24DD6AFF0;
      goto LABEL_86;
    case 0x1EuLL:
      paCurrentBluetoothDeviceSupportingTransparencyAccommodations();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE71A98], "sharedInstance");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v45, "personalMediaEnabled") & 1) != 0
        || !paCurrentRouteSupportsTransparencyAccommodations()
        || !paBluetoothDeviceSupportsSSL())
      {
        goto LABEL_135;
      }
      v70 = &unk_24DD6B008;
      goto LABEL_91;
    case 0x1FuLL:
    case 0x20uLL:
    case 0x23uLL:
      objc_msgSend(MEMORY[0x24BE71A98], "sharedInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v15, "personalMediaEnabled"))
        goto LABEL_103;
      objc_msgSend(MEMORY[0x24BE71A98], "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "personalMediaConfiguration");
      v17 = objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v18 = (void *)v17;
        v19 = objc_msgSend(v8, "containsObject:", &unk_24DD6AFD8);

        if ((v19 & 1) != 0)
        {
LABEL_74:
          LOBYTE(v34) = 1;
          goto LABEL_153;
        }
      }
      else
      {

LABEL_103:
      }
      v59 = -[HACCShortcutViewController _isStandalonePMEModuleFromMainStackOrderArray:](self, "_isStandalonePMEModuleFromMainStackOrderArray:", v9);
LABEL_105:
      LOBYTE(v34) = v59;
      goto LABEL_153;
    case 0x21uLL:
      paCurrentBluetoothDeviceSupportingTransparencyAccommodations();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE71A98], "sharedInstance");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v45, "personalMediaEnabled"))
        goto LABEL_135;
      objc_msgSend(MEMORY[0x24BE71A98], "sharedInstance");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "personalMediaConfiguration");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      if (v72)
      {
        objc_msgSend(MEMORY[0x24BE71A98], "sharedInstance");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "address");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v73, "transparencyCustomizedForAddress:", v74))
          LOBYTE(v34) = objc_msgSend(v8, "containsObject:", &unk_24DD6AFD8);
        else
          LOBYTE(v34) = 0;

      }
      else
      {
        LOBYTE(v34) = 0;
      }

      goto LABEL_136;
    case 0x22uLL:
      paCurrentBluetoothDeviceSupportingTransparencyAccommodations();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = objc_msgSend(v41, "getAACPCapabilityInteger:", 6);
      v76 = paCurrentRouteSupportsTransparencyAccommodations();
      if (v76)
      {
        v77 = 0;
        if (_os_feature_enabled_impl() && v75 >= 2)
        {
          objc_msgSend(MEMORY[0x24BE71A98], "sharedInstance");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v78, "personalMediaEnabled"))
          {
            objc_msgSend(MEMORY[0x24BE71A98], "sharedInstance");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "personalMediaConfiguration");
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            if (v80)
            {
              objc_msgSend(MEMORY[0x24BE71A98], "sharedInstance");
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "address");
              v89 = v79;
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              v77 = objc_msgSend(v81, "transparencyCustomizedForAddress:", v82);

              v79 = v89;
            }
            else
            {
              v77 = 0;
            }

          }
          else
          {
            v77 = 0;
          }

        }
        v76 = paBluetoothDeviceSupportsSSL();
      }
      else
      {
        v77 = 0;
      }
      if ((v77 & 1) == 0 && !v76)
        goto LABEL_149;
      v69 = -[HACCShortcutViewController shouldDisplayControlForModule:fromModulesArray:mainStackOrderArrayCopy:](self, "shouldDisplayControlForModule:fromModulesArray:mainStackOrderArrayCopy:", 33, v8, v9);
      goto LABEL_151;
    default:
      goto LABEL_129;
  }
}

uint64_t __101__HACCShortcutViewController_shouldDisplayControlForModule_fromModulesArray_mainStackOrderArrayCopy___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isMixingStream");
}

uint64_t __101__HACCShortcutViewController_shouldDisplayControlForModule_fromModulesArray_mainStackOrderArrayCopy___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isMixingStream");
}

uint64_t __101__HACCShortcutViewController_shouldDisplayControlForModule_fromModulesArray_mainStackOrderArrayCopy___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isMixingStream");
}

- (BOOL)addSeparatorAboveModule:(unint64_t)a3
{
  return a3 != 0;
}

- (BOOL)addPartialSeparatorAboveModule:(unint64_t)a3
{
  return a3 == 34 || a3 - 25 < 2;
}

- (id)parentViewControllerForModule:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  HACCShortcutViewController *v6;

  switch(a3)
  {
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
    case 0x14uLL:
    case 0x15uLL:
    case 0x16uLL:
      -[HACCShortcutViewController moduleToViewControllerMap](self, "moduleToViewControllerMap");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = &unk_24DD6AFA8;
      goto LABEL_3;
    case 0x19uLL:
    case 0x1AuLL:
    case 0x1BuLL:
    case 0x1CuLL:
      -[HACCShortcutViewController moduleToViewControllerMap](self, "moduleToViewControllerMap");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = &unk_24DD6B020;
      goto LABEL_3;
    case 0x20uLL:
    case 0x21uLL:
    case 0x22uLL:
    case 0x23uLL:
      -[HACCShortcutViewController moduleToViewControllerMap](self, "moduleToViewControllerMap");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = &unk_24DD6AFD8;
LABEL_3:
      objc_msgSend(v3, "objectForKey:", v5);
      v6 = (HACCShortcutViewController *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v6 = self;
      break;
  }
  return v6;
}

- (BOOL)_isMainStackForModule:(unint64_t)a3
{
  void *v4;

  -[HACCShortcutViewController mainStackIndexSet](self, "mainStackIndexSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "containsIndex:", a3);

  return a3;
}

- (unint64_t)_mainStackIndexForModule:(unint64_t)a3
{
  void *v4;
  void *v5;
  unint64_t v6;

  -[HACCShortcutViewController mainStackOrderArray](self, "mainStackOrderArray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "indexOfObject:", v5);

  return v6;
}

- (id)contentControllerForModule:(unint64_t)a3
{
  return -[HACCContentViewController initWithContentModule:andDelegate:]([HACCContentViewController alloc], "initWithContentModule:andDelegate:", a3, self);
}

- (void)updateContentViewListeners:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v3 = a3;
  v20 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[HACCShortcutViewController moduleToViewControllerMap](self, "moduleToViewControllerMap", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "contentView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v3)
        {
          v12 = objc_opt_respondsToSelector();

          if ((v12 & 1) == 0)
            continue;
          objc_msgSend(v10, "contentView");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "subscribeListeners");
        }
        else
        {
          v14 = objc_opt_respondsToSelector();

          if ((v14 & 1) == 0)
            continue;
          objc_msgSend(v10, "contentView");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "unsubscribeListeners");
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

}

- (void)updateAvailableControls
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  _QWORD v19[5];
  id v20;

  -[HACCShortcutViewController listenForHearingAidUpdates](self, "listenForHearingAidUpdates");
  -[HACCShortcutViewController startListeningForHeadphoneUpdates](self, "startListeningForHeadphoneUpdates");
  -[HACCShortcutViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  -[HACCShortcutViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = v9;
  v12 = v11;

  -[HACCShortcutViewController scrollView](self, "scrollView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v5, v7, v10, v12);

  -[HACCShortcutViewController mainStackOrderArray](self, "mainStackOrderArray");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copy");

  objc_msgSend(MEMORY[0x24BE4BE48], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "connectionQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __53__HACCShortcutViewController_updateAvailableControls__block_invoke;
  v19[3] = &unk_24DD61050;
  v19[4] = self;
  v20 = v15;
  v18 = v15;
  dispatch_async(v17, v19);

}

void __53__HACCShortcutViewController_updateAvailableControls__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t i;
  id v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "stackOrder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 36; ++i)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "shouldDisplayControlForModule:fromModulesArray:mainStackOrderArrayCopy:", i, v3, *(_QWORD *)(a1 + 40)))objc_msgSend(v2, "addIndex:", i);
  }
  v7 = v2;
  v5 = v2;
  v6 = v3;
  AXPerformBlockOnMainThread();

}

uint64_t __53__HACCShortcutViewController_updateAvailableControls__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  unint64_t v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  __int128 v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "setMainStackOrderArray:", *(_QWORD *)(a1 + 40));
  v2 = 0;
  *(_QWORD *)&v3 = 138412802;
  v46 = v3;
  do
  {
    objc_msgSend(*(id *)(a1 + 32), "moduleToViewControllerMap", v46);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(*(id *)(a1 + 48), "containsIndex:", v2))
    {
      if (!v6)
      {
        objc_msgSend(*(id *)(a1 + 32), "contentControllerForModule:", v2);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "moduleToViewControllerMap");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v2);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKey:", v6, v8);

        objc_msgSend(*(id *)(a1 + 32), "parentViewControllerForModule:", v2);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addChildViewController:", v6);

        AXLogCommon();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v2);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(*(id *)(a1 + 32), "parentViewControllerForModule:", v2);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "childViewControllers");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v14, "count"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v46;
          v48 = v11;
          v49 = 2112;
          v50 = v6;
          v51 = 2112;
          v52 = v15;
          _os_log_impl(&dword_21A95E000, v10, OS_LOG_TYPE_DEFAULT, "HACCShortcutViewController module %@, add controller %@, children %@", buf, 0x20u);

        }
      }
      v16 = objc_msgSend(*(id *)(a1 + 32), "_isMainStackForModule:", v2);
      v17 = *(void **)(a1 + 32);
      if (v16)
      {
        v18 = objc_msgSend(v17, "_mainStackIndexForModule:", v2);
        if (v18 == 0x7FFFFFFFFFFFFFFFLL)
        {
LABEL_22:
          objc_msgSend(v6, "updateValue");
          goto LABEL_31;
        }
        v19 = v18;
        objc_msgSend(v6, "view");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "superview");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          objc_msgSend(*(id *)(a1 + 32), "stackView");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "view");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "removeArrangedSubview:", v23);

        }
        objc_msgSend(*(id *)(a1 + 32), "stackView");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "arrangedSubviews");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "count");

        if (v19 >= v26)
          v27 = v26;
        else
          v27 = v19;
        objc_msgSend(*(id *)(a1 + 32), "stackView");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "view");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "insertArrangedSubview:atIndex:", v29, v27);
      }
      else
      {
        objc_msgSend(v17, "parentViewControllerForModule:", v2);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v28)
          goto LABEL_21;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_21;
        objc_msgSend(v6, "view");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "superview");
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (v35)
          goto LABEL_21;
        objc_msgSend(v6, "view");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "addExpandedView:shouldAlwaysExpand:", v29, objc_msgSend(*(id *)(a1 + 32), "prefersContentToAlwaysExpand"));
      }

LABEL_21:
      goto LABEL_22;
    }
    v30 = objc_msgSend(*(id *)(a1 + 32), "_isMainStackForModule:", v2);
    v31 = *(void **)(a1 + 32);
    if (v30)
    {
      objc_msgSend(v31, "stackView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "view");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "removeArrangedSubview:", v33);
    }
    else
    {
      objc_msgSend(v31, "parentViewControllerForModule:", v2);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v32)
        goto LABEL_27;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_27;
      objc_msgSend(v6, "view");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "removeExpandedView:", v33);
    }

LABEL_27:
    objc_msgSend(v6, "removeFromParentViewController");
    objc_msgSend(v6, "view");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "removeFromSuperview");

    objc_msgSend(*(id *)(a1 + 32), "moduleToViewControllerMap");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v2);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "removeObjectForKey:", v38);

    if (!v6)
      goto LABEL_32;
    AXLogCommon();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v2);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(*(id *)(a1 + 32), "parentViewControllerForModule:", v2);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "childViewControllers");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "numberWithUnsignedInteger:", objc_msgSend(v43, "count"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = v46;
      v48 = v40;
      v49 = 2112;
      v50 = v6;
      v51 = 2112;
      v52 = v44;
      _os_log_impl(&dword_21A95E000, v39, OS_LOG_TYPE_DEFAULT, "HACCShortcutViewController module %@, remove controller %@, children %@", buf, 0x20u);

    }
LABEL_31:

LABEL_32:
    ++v2;
  }
  while (v2 != 36);
  return objc_msgSend(*(id *)(a1 + 32), "updateHeight");
}

- (void)updateHeight
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  _QWORD v18[6];
  uint64_t v19;
  double *v20;
  uint64_t v21;
  uint64_t v22;

  v19 = 0;
  v20 = (double *)&v19;
  v21 = 0x2020000000;
  v22 = 0;
  -[HACCShortcutViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  -[HACCShortcutViewController mainStackIndexSet](self, "mainStackIndexSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __42__HACCShortcutViewController_updateHeight__block_invoke;
  v18[3] = &unk_24DD618C0;
  v18[4] = self;
  v18[5] = &v19;
  objc_msgSend(v6, "enumerateIndexesUsingBlock:", v18);

  self->_moduleHeight = v20[3];
  -[HACCShortcutViewController stackView](self, "stackView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = v8;
  v11 = v10;

  v12 = v20[3];
  -[HACCShortcutViewController stackView](self, "stackView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v9, v11, v5, v12);

  -[HACCShortcutViewController scrollView](self, "scrollView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HACCShortcutViewController moduleHeight](self, "moduleHeight");
  objc_msgSend(v14, "setFrame:", 0.0, 0.0, v5, v15);

  -[HACCShortcutViewController scrollView](self, "scrollView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setContentSize:", v5, v20[3]);

  -[HACCShortcutViewController delegate](self, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "shortcutDidChangeSize:", self);

  _Block_object_dispose(&v19, 8);
}

void __42__HACCShortcutViewController_updateHeight__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "moduleToViewControllerMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v9;
  if (v9)
  {
    if (a2)
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                              + 24)
                                                                  + 12.0;
    objc_msgSend(v9, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "systemLayoutSizeFittingSize:", *MEMORY[0x24BEBE588], *(double *)(MEMORY[0x24BEBE588] + 8));
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v8
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 24);

    v6 = v9;
  }

}

- (double)moduleHeight
{
  double moduleHeight;
  void *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  CGRect v11;
  CGRect v12;

  moduleHeight = self->_moduleHeight;
  -[HACCShortcutViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = CGRectGetMidY(v11) - moduleHeight * 0.5;

  v6 = MEMORY[0x22074CA8C]() * 0.5;
  if (v5 >= v6)
    v7 = v5;
  else
    v7 = v6;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v9 = CGRectGetHeight(v12) + v7 * -2.0;

  self->_mainModuleOrigin.x = 0.0;
  self->_mainModuleOrigin.y = v7;
  if (v9 >= moduleHeight)
    return moduleHeight;
  else
    return v9;
}

- (double)preferredContentWidth
{
  void *v2;
  double Width;
  CGRect v5;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  Width = CGRectGetWidth(v5);

  return Width;
}

- (BOOL)providesOwnPlatter
{
  return 1;
}

- (HACCContentViewController)expandedController
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__1;
  v11 = 0;
  -[HACCShortcutViewController moduleToViewControllerMap](self, "moduleToViewControllerMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __48__HACCShortcutViewController_expandedController__block_invoke;
  v5[3] = &unk_24DD618E8;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v5);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (HACCContentViewController *)v3;
}

void __48__HACCShortcutViewController_expandedController__block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v7;
  char isKindOfClass;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "presentedViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    *a4 = 1;
  }

}

- (BOOL)isExpanded
{
  void *v2;
  BOOL v3;

  -[HACCShortcutViewController expandedController](self, "expandedController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)updateView
{
  void *v3;
  double v4;
  double v5;
  _QWORD v6[5];

  -[HACCShortcutViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alpha");
  v5 = v4;

  if (v5 > 0.0)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __40__HACCShortcutViewController_updateView__block_invoke;
    v6[3] = &unk_24DD60E68;
    v6[4] = self;
    objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:delay:options:animations:completion:", 0, v6, &__block_literal_global_98, 0.35, 0.0);
  }
}

uint64_t __40__HACCShortcutViewController_updateView__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateAvailableControls");
}

- (void)updateViewForModule:(unint64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  -[HACCShortcutViewController moduleToViewControllerMap](self, "moduleToViewControllerMap");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateValue");

}

- (void)updateViewForProperties:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;
  _QWORD v8[5];

  v7 = a3;
  objc_msgSend(MEMORY[0x24BE4BE48], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hearingAidReachable");

  if ((v5 & 1) != 0)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __54__HACCShortcutViewController_updateViewForProperties___block_invoke_2;
    v8[3] = &unk_24DD61990;
    v8[4] = self;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);
  }
  else if (-[HACCShortcutViewController isExpanded](self, "isExpanded"))
  {
    -[HACCShortcutViewController moduleToViewControllerMap](self, "moduleToViewControllerMap");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_99);

  }
}

uint64_t __54__HACCShortcutViewController_updateViewForProperties___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "updateViewConstraints");
}

void __54__HACCShortcutViewController_updateViewForProperties___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  id v40;

  v6 = objc_msgSend(a2, "integerValue");
  if (v6 > 0xFFFFFFFFLL)
  {
    if (v6 > 0xFFFFFFFFFLL)
    {
      if (v6 > 0x3FFFFFFFFFLL)
      {
        if (v6 == 0x4000000000 || v6 == 0x8000000000)
        {
          objc_msgSend(*(id *)(a1 + 32), "moduleToViewControllerMap");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKey:", &unk_24DD6B110);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "updateValue");

          objc_msgSend(*(id *)(a1 + 32), "moduleToViewControllerMap");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKey:", &unk_24DD6B128);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "updateValue");

          objc_msgSend(*(id *)(a1 + 32), "moduleToViewControllerMap");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = v7;
          v8 = &unk_24DD6B140;
          goto LABEL_28;
        }
      }
      else
      {
        if (v6 == 0x1000000000)
        {
          objc_msgSend(*(id *)(a1 + 32), "moduleToViewControllerMap");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = v7;
          v8 = &unk_24DD6B170;
          goto LABEL_28;
        }
        if (v6 == 0x2000000000)
        {
          objc_msgSend(*(id *)(a1 + 32), "moduleToViewControllerMap");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = v7;
          v8 = &unk_24DD6B158;
LABEL_28:
          objc_msgSend(v7, "objectForKey:", v8);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "updateValue");

          return;
        }
      }
      goto LABEL_29;
    }
    if (v6 != 0x100000000)
    {
      if (v6 != 0x200000000)
      {
        v9 = 0x400000000;
        goto LABEL_18;
      }
LABEL_24:
      objc_msgSend(*(id *)(a1 + 32), "moduleToViewControllerMap");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectForKey:", &unk_24DD6B0C8);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "updateValue");

      objc_msgSend(*(id *)(a1 + 32), "moduleToViewControllerMap");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKey:", &unk_24DD6B0E0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "updateValue");

      objc_msgSend(*(id *)(a1 + 32), "moduleToViewControllerMap");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v7;
      v8 = &unk_24DD6B0F8;
      goto LABEL_28;
    }
    goto LABEL_23;
  }
  if (v6 <= 255)
  {
    if (v6 != 4)
    {
      if (v6 != 64)
      {
        if (v6 != 128)
          goto LABEL_29;
        goto LABEL_24;
      }
LABEL_23:
      objc_msgSend(*(id *)(a1 + 32), "moduleToViewControllerMap");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKey:", &unk_24DD6B038);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "updateValue");

      objc_msgSend(*(id *)(a1 + 32), "moduleToViewControllerMap");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKey:", &unk_24DD6B050);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "updateValue");

      objc_msgSend(*(id *)(a1 + 32), "moduleToViewControllerMap");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v7;
      v8 = &unk_24DD6B068;
      goto LABEL_28;
    }
LABEL_25:
    objc_msgSend(*(id *)(a1 + 32), "moduleToViewControllerMap");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v7;
    v8 = &unk_24DD6AFA8;
    goto LABEL_28;
  }
  if (v6 == 256)
  {
    objc_msgSend(*(id *)(a1 + 32), "moduleToViewControllerMap");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKey:", &unk_24DD6B188);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "updateValue");

    objc_msgSend(*(id *)(a1 + 32), "moduleToViewControllerMap");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKey:", &unk_24DD6B1A0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "updateValue");

    objc_msgSend(*(id *)(a1 + 32), "moduleToViewControllerMap");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectForKey:", &unk_24DD6B1B8);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "updateValue");

    objc_msgSend(*(id *)(a1 + 32), "moduleToViewControllerMap");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectForKey:", &unk_24DD6B1D0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "updateValue");

    objc_msgSend(*(id *)(a1 + 32), "moduleToViewControllerMap");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "objectForKey:", &unk_24DD6B1E8);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "updateValue");

    objc_msgSend(*(id *)(a1 + 32), "moduleToViewControllerMap");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v7;
    v8 = &unk_24DD6B200;
    goto LABEL_28;
  }
  if (v6 == 0x40000)
    goto LABEL_25;
  v9 = 0x80000000;
LABEL_18:
  if (v6 == v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "moduleToViewControllerMap");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", &unk_24DD6B080);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "updateValue");

    objc_msgSend(*(id *)(a1 + 32), "moduleToViewControllerMap");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", &unk_24DD6B098);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "updateValue");

    objc_msgSend(*(id *)(a1 + 32), "moduleToViewControllerMap");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v7;
    v8 = &unk_24DD6B0B0;
    goto LABEL_28;
  }
LABEL_29:
  v37 = objc_msgSend(*(id *)(a1 + 32), "isExpanded");
  v38 = *(void **)(a1 + 32);
  if (v37)
  {
    objc_msgSend(v38, "moduleToViewControllerMap");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_121);

  }
  else
  {
    objc_msgSend(v38, "updateAvailableControls");
  }
  *a4 = 1;
}

uint64_t __54__HACCShortcutViewController_updateViewForProperties___block_invoke_120(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "updateValue");
}

- (BOOL)_isStandaloneHeadphoneLevels
{
  void *v3;
  void *v4;
  char v5;

  -[HACCShortcutViewController mainStackOrderArray](self, "mainStackOrderArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 1)
  {
    -[HACCShortcutViewController mainStackOrderArray](self, "mainStackOrderArray");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "containsObject:", &unk_24DD6AFC0);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_isStandaloneHeadphoneLevelsFromMainStackOrderArray:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if (objc_msgSend(v3, "count") == 1)
    v4 = objc_msgSend(v3, "containsObject:", &unk_24DD6AFC0);
  else
    v4 = 0;

  return v4;
}

- (BOOL)shouldShowHeadphoneLevelUnavailable
{
  BOOL v3;
  void *v4;
  int v5;

  v3 = -[HACCShortcutViewController _isStandaloneHeadphoneLevels](self, "_isStandaloneHeadphoneLevels");
  if (-[HACCShortcutViewController headphoneAudioAvailable](self, "headphoneAudioAvailable"))
  {
    objc_msgSend(MEMORY[0x24BE4BE70], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "liveHeadphoneLevelEnabled") ^ 1;

  }
  else
  {
    LOBYTE(v5) = 1;
  }
  return v3 & v5;
}

- (BOOL)_isStandalonePMEModule
{
  void *v3;
  void *v4;
  char v5;

  -[HACCShortcutViewController mainStackOrderArray](self, "mainStackOrderArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 1)
  {
    -[HACCShortcutViewController mainStackOrderArray](self, "mainStackOrderArray");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "containsObject:", &unk_24DD6AFD8);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_isStandalonePMEModuleFromMainStackOrderArray:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if (objc_msgSend(v3, "count") == 1)
    v4 = objc_msgSend(v3, "containsObject:", &unk_24DD6AFD8);
  else
    v4 = 0;

  return v4;
}

- (BOOL)showPMEExpandedOptions
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend(MEMORY[0x24BE71A98], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "personalMediaEnabled"))
  {
    objc_msgSend(MEMORY[0x24BE71A98], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "personalMediaConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)viewController:(id)a3 didExpand:(BOOL)a4
{
  if (!a4)
    a3 = 0;
  -[HACCShortcutViewController setExpandedController:](self, "setExpandedController:", a3);
}

- (void)controlDidActivate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  uint64_t v20;
  void *v21;
  double v22;
  uint64_t v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  int v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _BOOL8 v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  unsigned int v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  NSObject *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  void *v53;
  unsigned int v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  NSObject *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  unsigned int v64;
  void *v65;
  int v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  NSObject *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  NSObject *v83;
  uint64_t v84;
  void *v85;
  int v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  uint8_t buf[4];
  uint64_t v92;
  uint64_t v93;

  v93 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HAInitializeLogging();
  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = objc_msgSend(v4, "module");
  objc_msgSend(v4, "contentValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("Activated %ld - %@"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HACCShortcutViewController controlDidActivate:]", 1380, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)*MEMORY[0x24BE4BD78];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE4BD78], OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_retainAutorelease(v9);
    v12 = v10;
    *(_DWORD *)buf = 136446210;
    v92 = objc_msgSend(v11, "UTF8String");
    _os_log_impl(&dword_21A95E000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  -[HACCShortcutViewController currentHearingDevice](self, "currentHearingDevice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend(v4, "module"))
  {
    case 1:
      objc_msgSend(v4, "contentValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "doubleValue");
      objc_msgSend(v13, "setLeftMixedVolume:");
      goto LABEL_23;
    case 2:
      goto LABEL_6;
    case 3:
      objc_msgSend(v4, "contentValue");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "doubleValue");
      objc_msgSend(v13, "setLeftMixedVolume:");

LABEL_6:
      objc_msgSend(v4, "contentValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "doubleValue");
      objc_msgSend(v13, "setRightMixedVolume:");
      goto LABEL_23;
    case 4:
      objc_msgSend(v4, "contentValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "doubleValue");
      objc_msgSend(v13, "setLeftMicrophoneVolume:");
      goto LABEL_23;
    case 5:
      goto LABEL_9;
    case 6:
      objc_msgSend(v4, "contentValue");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "doubleValue");
      objc_msgSend(v13, "setLeftMicrophoneVolume:");

LABEL_9:
      objc_msgSend(v4, "contentValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "doubleValue");
      objc_msgSend(v13, "setRightMicrophoneVolume:");
      goto LABEL_23;
    case 7:
      objc_msgSend(v4, "contentValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "doubleValue");
      objc_msgSend(v13, "setLeftSensitivity:");
      goto LABEL_23;
    case 8:
      goto LABEL_12;
    case 9:
      objc_msgSend(v4, "contentValue");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "doubleValue");
      objc_msgSend(v13, "setLeftSensitivity:");

LABEL_12:
      objc_msgSend(v4, "contentValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "doubleValue");
      objc_msgSend(v13, "setRightSensitivity:");
      goto LABEL_23;
    case 10:
      objc_msgSend(v4, "contentValue");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "doubleValue");
      v20 = (int)((v19 + -0.5) * 255.0);

      objc_msgSend(v13, "setLeftTreble:", v20);
      objc_msgSend(v13, "setRightTreble:", v20);
      break;
    case 11:
      objc_msgSend(v4, "contentValue");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "doubleValue");
      v23 = (int)((v22 + -0.5) * 255.0);

      objc_msgSend(v13, "setLeftBass:", v23);
      objc_msgSend(v13, "setRightBass:", v23);
      break;
    case 12:
      objc_msgSend(v4, "contentValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "doubleValue");
      objc_msgSend(v13, "setLeftStreamVolume:");
      goto LABEL_23;
    case 13:
      goto LABEL_17;
    case 14:
      objc_msgSend(v4, "contentValue");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "doubleValue");
      objc_msgSend(v13, "setLeftStreamVolume:");

LABEL_17:
      objc_msgSend(v4, "contentValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "doubleValue");
      objc_msgSend(v13, "setRightStreamVolume:");
      goto LABEL_23;
    case 24:
      objc_msgSend(MEMORY[0x24BE4BE68], "sharedInstance");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "comfortSoundsAvailable");

      if (!v26)
        break;
      objc_msgSend(MEMORY[0x24BE4BE68], "sharedInstance");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "comfortSoundsEnabled");

      objc_msgSend(MEMORY[0x24BE4BE68], "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setComfortSoundsEnabled:", v28 ^ 1u);
      goto LABEL_23;
    case 25:
      objc_msgSend(MEMORY[0x24BE4BE68], "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "contentValue");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "doubleValue");
      objc_msgSend(v14, "setRelativeVolume:");
      goto LABEL_22;
    case 26:
      objc_msgSend(MEMORY[0x24BE4BE68], "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "contentValue");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "doubleValue");
      objc_msgSend(v14, "setMediaVolume:");
LABEL_22:

LABEL_23:
      break;
    case 29:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v30 = v4;
      else
        v30 = 0;
      objc_msgSend(v4, "contentValue");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v50, "BOOLValue");

      hearingLocString();
      if (v51)
      {
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setAccessibilityValueString:", v52);

        objc_msgSend(MEMORY[0x24BE4BE48], "sharedInstance");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "stopLiveListen");

      }
      else
      {
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setAccessibilityValueString:", v61);

        objc_msgSend(MEMORY[0x24BE4BE48], "sharedInstance");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "startLiveListen");

        -[HACCShortcutViewController _logLiveListenAnalytics](self, "_logLiveListenAnalytics");
      }
      goto LABEL_42;
    case 30:
      paCurrentBluetoothDeviceSupportingTransparencyAccommodations();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "address");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v32, "length"))
      {
        objc_msgSend(MEMORY[0x24BE71A98], "sharedInstance");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v33, "personalMediaEnabled"))
        {
          objc_msgSend(MEMORY[0x24BE71A98], "sharedInstance");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "personalMediaConfiguration");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = v35 != 0;

        }
        else
        {
          v36 = 0;
        }

        objc_msgSend(MEMORY[0x24BE71A98], "sharedInstance");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = objc_msgSend(v63, "transparencyCustomizedForAddress:", v32);

        objc_msgSend(MEMORY[0x24BE71A98], "sharedInstance");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = v32;
        v66 = objc_msgSend(v65, "sslEnabledForAddress:", v32);

        paCurrentBluetoothDeviceSupportingTransparencyAccommodations();
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v86 = objc_msgSend(v67, "listeningMode");

        PAInitializeLogging();
        v87 = v66 ^ 1u;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SSL toggled-%i, headphoneAcc-%i, transparencySettings-%i"), v87, v36, v64);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HACCShortcutViewController controlDidActivate:]", 1509, v68);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = (void *)*MEMORY[0x24BE4BDA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE4BDA8], OS_LOG_TYPE_DEFAULT))
        {
          v71 = objc_retainAutorelease(v69);
          v72 = v70;
          v73 = objc_msgSend(v71, "UTF8String");
          *(_DWORD *)buf = 136446210;
          v92 = v73;
          _os_log_impl(&dword_21A95E000, v72, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

        }
        v32 = v88;
        if ((v66 & 1) == 0)
        {
          v89 = v88;
          v74 = (void *)MEMORY[0x24BDD16E0];
          paCurrentBluetoothDeviceSupportingTransparencyAccommodations();
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "numberWithUnsignedInt:", objc_msgSend(v75, "listeningMode"));
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          v90 = v76;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v90, &v89, 1);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          -[HACCShortcutViewController setPreviousListeningModeForAddress:](self, "setPreviousListeningModeForAddress:", v77);

          if (v86 != 3)
          {
            paCurrentBluetoothDeviceSupportingTransparencyAccommodations();
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v78, "setListeningMode:", 3);

            PAInitializeLogging();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SSL force turning on transparency mode"));
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HACCShortcutViewController controlDidActivate:]", 1520, v79);
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            v81 = (void *)*MEMORY[0x24BE4BDA8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE4BDA8], OS_LOG_TYPE_DEFAULT))
            {
              v82 = objc_retainAutorelease(v80);
              v83 = v81;
              v84 = objc_msgSend(v82, "UTF8String");
              *(_DWORD *)buf = 136446210;
              v92 = v84;
              _os_log_impl(&dword_21A95E000, v83, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

            }
          }
        }
        objc_msgSend(MEMORY[0x24BE71A98], "sharedInstance");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "setSslEnabled:forAddress:", v87, v88);

        objc_msgSend(v4, "updateValue");
      }

      break;
    case 34:
      paCurrentBluetoothDeviceSupportingTransparencyAccommodations();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "address");
      v30 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BE71A98], "sharedInstance");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "transparencyCustomizedForAddress:", v30);

      objc_msgSend(MEMORY[0x24BE71A98], "sharedInstance");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v40;
      if (v39)
      {
        v42 = objc_msgSend(v40, "transparencyBeamformingForAddress:", v30);

        PAInitializeLogging();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Beamformer toggled %d"), v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HACCShortcutViewController controlDidActivate:]", 1548, v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = (void *)*MEMORY[0x24BE4BDA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE4BDA8], OS_LOG_TYPE_DEFAULT))
        {
          v46 = objc_retainAutorelease(v44);
          v47 = v45;
          v48 = objc_msgSend(v46, "UTF8String");
          *(_DWORD *)buf = 136446210;
          v92 = v48;
          _os_log_impl(&dword_21A95E000, v47, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

        }
        objc_msgSend(MEMORY[0x24BE71A98], "sharedInstance");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "setTransparencyBeamforming:forAddress:", v42 ^ 1, v30);
      }
      else
      {
        v54 = objc_msgSend(v40, "sslEnabledForAddress:", v30);

        PAInitializeLogging();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SSL toggled %d"), v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HACCShortcutViewController controlDidActivate:]", 1556, v55);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = (void *)*MEMORY[0x24BE4BDA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE4BDA8], OS_LOG_TYPE_DEFAULT))
        {
          v58 = objc_retainAutorelease(v56);
          v59 = v57;
          v60 = objc_msgSend(v58, "UTF8String");
          *(_DWORD *)buf = 136446210;
          v92 = v60;
          _os_log_impl(&dword_21A95E000, v59, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

        }
        objc_msgSend(MEMORY[0x24BE71A98], "sharedInstance");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "setSslEnabled:forAddress:", v54 ^ 1, v30);
      }

      -[HACCShortcutViewController updateViewForModule:](self, "updateViewForModule:", 34);
LABEL_42:

      break;
    default:
      break;
  }

}

- (void)_logLiveListenAnalytics
{
  void *v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  -[HACCShortcutViewController currentOtherDeviceType](self, "currentOtherDeviceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[HACCShortcutViewController currentOtherDeviceName](self, "currentOtherDeviceName");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  v14[0] = CFSTR("enabled");
  v14[1] = CFSTR("headset_model");
  v7 = CFSTR("Unknown");
  if (v6)
    v7 = v6;
  v15[0] = MEMORY[0x24BDBD1C8];
  v15[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  AXLogAggregate();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v8;
    _os_log_impl(&dword_21A95E000, v9, OS_LOG_TYPE_INFO, "Live listen enabled: %@", buf, 0xCu);
  }

  v11 = v8;
  v10 = v8;
  AnalyticsSendEventLazy();

}

id __53__HACCShortcutViewController__logLiveListenAnalytics__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (AXHAShortcutUpdateProtocol)delegate
{
  return (AXHAShortcutUpdateProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setExpandedController:(id)a3
{
  objc_storeStrong((id *)&self->_expandedController, a3);
}

- (CCUIContentModuleContext)contentModuleContext
{
  return self->_contentModuleContext;
}

- (void)setContentModuleContext:(id)a3
{
  objc_storeStrong((id *)&self->_contentModuleContext, a3);
}

- (NSArray)availableModules
{
  return self->_availableModules;
}

- (void)setAvailableModules:(id)a3
{
  objc_storeStrong((id *)&self->_availableModules, a3);
}

- (BOOL)prefersContentToAlwaysExpand
{
  return self->_prefersContentToAlwaysExpand;
}

- (void)setPrefersContentToAlwaysExpand:(BOOL)a3
{
  self->_prefersContentToAlwaysExpand = a3;
}

- (NSMutableDictionary)moduleToViewControllerMap
{
  return self->_moduleToViewControllerMap;
}

- (void)setModuleToViewControllerMap:(id)a3
{
  objc_storeStrong((id *)&self->_moduleToViewControllerMap, a3);
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (NSIndexSet)mainStackIndexSet
{
  return self->_mainStackIndexSet;
}

- (void)setMainStackIndexSet:(id)a3
{
  objc_storeStrong((id *)&self->_mainStackIndexSet, a3);
}

- (NSArray)mainStackOrderArray
{
  return self->_mainStackOrderArray;
}

- (void)setMainStackOrderArray:(id)a3
{
  objc_storeStrong((id *)&self->_mainStackOrderArray, a3);
}

- (UIView)platterView
{
  return self->_platterView;
}

- (void)setPlatterView:(id)a3
{
  objc_storeStrong((id *)&self->_platterView, a3);
}

- (CCUILabeledRoundButtonViewController)otherDevicesButtonViewController
{
  return self->_otherDevicesButtonViewController;
}

- (void)setOtherDevicesButtonViewController:(id)a3
{
  objc_storeStrong((id *)&self->_otherDevicesButtonViewController, a3);
}

- (AXRemoteHearingAidDevice)currentHearingDevice
{
  return self->_currentHearingDevice;
}

- (void)setCurrentHearingDevice:(id)a3
{
  objc_storeStrong((id *)&self->_currentHearingDevice, a3);
}

- (NSString)currentOtherDeviceName
{
  return self->_currentOtherDeviceName;
}

- (void)setCurrentOtherDeviceName:(id)a3
{
  objc_storeStrong((id *)&self->_currentOtherDeviceName, a3);
}

- (NSString)currentOtherDeviceType
{
  return self->_currentOtherDeviceType;
}

- (void)setCurrentOtherDeviceType:(id)a3
{
  objc_storeStrong((id *)&self->_currentOtherDeviceType, a3);
}

- (BOOL)bluetoothAvailable
{
  return self->_bluetoothAvailable;
}

- (void)setBluetoothAvailable:(BOOL)a3
{
  self->_bluetoothAvailable = a3;
}

- (BOOL)listeningForHearingAidUpdates
{
  return self->_listeningForHearingAidUpdates;
}

- (void)setListeningForHearingAidUpdates:(BOOL)a3
{
  self->_listeningForHearingAidUpdates = a3;
}

- (BOOL)listeningForHeadphoneUpdates
{
  return self->_listeningForHeadphoneUpdates;
}

- (void)setListeningForHeadphoneUpdates:(BOOL)a3
{
  self->_listeningForHeadphoneUpdates = a3;
}

- (BOOL)headphoneAudioAvailable
{
  return self->_headphoneAudioAvailable;
}

- (void)setHeadphoneAudioAvailable:(BOOL)a3
{
  self->_headphoneAudioAvailable = a3;
}

- (BOOL)shouldDisplayOtherDevice
{
  return self->_shouldDisplayOtherDevice;
}

- (void)setShouldDisplayOtherDevice:(BOOL)a3
{
  self->_shouldDisplayOtherDevice = a3;
}

- (NSDictionary)previousListeningModeForAddress
{
  return (NSDictionary *)objc_getProperty(self, a2, 1168, 1);
}

- (void)setPreviousListeningModeForAddress:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 1168);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousListeningModeForAddress, 0);
  objc_storeStrong((id *)&self->_currentOtherDeviceType, 0);
  objc_storeStrong((id *)&self->_currentOtherDeviceName, 0);
  objc_storeStrong((id *)&self->_currentHearingDevice, 0);
  objc_storeStrong((id *)&self->_otherDevicesButtonViewController, 0);
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_storeStrong((id *)&self->_mainStackOrderArray, 0);
  objc_storeStrong((id *)&self->_mainStackIndexSet, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_moduleToViewControllerMap, 0);
  objc_storeStrong((id *)&self->_availableModules, 0);
  objc_storeStrong((id *)&self->_contentModuleContext, 0);
  objc_storeStrong((id *)&self->_expandedController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_listeningModeButton, 0);
  objc_storeStrong((id *)&self->_noiseControlUpdateTimer, 0);
  objc_storeStrong((id *)&self->_bluetoothAvailabilityTimer, 0);
  objc_storeStrong((id *)&self->_detailTransitioningDelegate, 0);
}

@end
