@implementation CALNFakeNotificationSource

- (CALNFakeNotificationSource)initWithNotificationManager:(id)a3 iconIdentifierProvider:(id)a4 sourceIdentifierSuffix:(id)a5
{
  id v9;
  id v10;
  id v11;
  CALNFakeNotificationSource *v12;
  uint64_t v13;
  NSString *sourceIdentifier;
  NSObject *v15;
  _QWORD block[4];
  CALNFakeNotificationSource *v18;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CALNFakeNotificationSource;
  v12 = -[CALNFakeNotificationSource init](&v19, sel_init);
  if (v12)
  {
    if (initWithNotificationManager_iconIdentifierProvider_sourceIdentifierSuffix__onceToken != -1)
      dispatch_once(&initWithNotificationManager_iconIdentifierProvider_sourceIdentifierSuffix__onceToken, &__block_literal_global_20);
    objc_storeStrong((id *)&v12->_notificationManager, a3);
    objc_storeStrong((id *)&v12->_iconIdentifierProvider, a4);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.calendar.notifications.FakeNotification.%@"), v11);
    v13 = objc_claimAutoreleasedReturnValue();
    sourceIdentifier = v12->_sourceIdentifier;
    v12->_sourceIdentifier = (NSString *)v13;

    objc_msgSend((id)objc_opt_class(), "_activeSourcesQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __104__CALNFakeNotificationSource_initWithNotificationManager_iconIdentifierProvider_sourceIdentifierSuffix___block_invoke_2;
    block[3] = &unk_24D484738;
    v18 = v12;
    dispatch_sync(v15, block);

  }
  return v12;
}

void __104__CALNFakeNotificationSource_initWithNotificationManager_iconIdentifierProvider_sourceIdentifierSuffix___block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)HandleDarwinNotification, CFSTR("com.apple.calendar.notifications.postFakeNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

void __104__CALNFakeNotificationSource_initWithNotificationManager_iconIdentifierProvider_sourceIdentifierSuffix___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend((id)objc_opt_class(), "_activeSources");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 32));

}

+ (id)_activeSources
{
  if (_activeSources_onceToken != -1)
    dispatch_once(&_activeSources_onceToken, &__block_literal_global_4_0);
  return (id)_activeSources_activeSources;
}

void __44__CALNFakeNotificationSource__activeSources__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 5);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_activeSources_activeSources;
  _activeSources_activeSources = v0;

}

+ (id)_activeSourcesQueue
{
  if (_activeSourcesQueue_onceToken != -1)
    dispatch_once(&_activeSourcesQueue_onceToken, &__block_literal_global_6);
  return (id)_activeSourcesQueue_queue;
}

void __49__CALNFakeNotificationSource__activeSourcesQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.calendar.notifications.fakeNotificationSourceQ", v2);
  v1 = (void *)_activeSourcesQueue_queue;
  _activeSourcesQueue_queue = (uint64_t)v0;

}

- (void)postFakeNotification
{
  void *v3;
  CALNNotificationRecord *v4;
  void *v5;
  CALNNotificationRecord *v6;
  void *v7;
  id v8;

  CalGenerateUUID();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[CALNFakeNotificationSource contentForNotificationWithSourceClientIdentifier:](self, "contentForNotificationWithSourceClientIdentifier:", v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [CALNNotificationRecord alloc];
  -[CALNFakeNotificationSource sourceIdentifier](self, "sourceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CALNNotificationRecord initWithSourceIdentifier:sourceClientIdentifier:content:](v4, "initWithSourceIdentifier:sourceClientIdentifier:content:", v5, v8, v3);

  -[CALNFakeNotificationSource notificationManager](self, "notificationManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addRecord:", v6);

}

- (NSArray)categories
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__CALNFakeNotificationSource_categories__block_invoke;
  block[3] = &unk_24D484738;
  block[4] = self;
  if (categories_onceToken_5 != -1)
    dispatch_once(&categories_onceToken_5, block);
  return (NSArray *)(id)categories_categories_5;
}

void __40__CALNFakeNotificationSource_categories__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "sourceIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNNotificationCategory categoryWithIdentifier:actions:hiddenPreviewsBodyPlaceholder:options:](CALNNotificationCategory, "categoryWithIdentifier:actions:hiddenPreviewsBodyPlaceholder:options:", v1, MEMORY[0x24BDBD1A8], CFSTR("Discrete"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)categories_categories_5;
  categories_categories_5 = v3;

}

- (id)contentForNotificationWithSourceClientIdentifier:(id)a3
{
  id v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  if (objc_msgSend(MEMORY[0x24BE13F98], "hasBeenUnlockedSinceBoot"))
    v5 = (__CFString *)v4;
  else
    v5 = CFSTR("Private");
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setTitle:", CFSTR("Fake notification"));
  objc_msgSend(v6, "setBody:", v5);
  -[CALNFakeNotificationSource sourceIdentifier](self, "sourceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCategoryIdentifier:", v7);

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateByAddingDays:inCalendar:", 1, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExpirationDate:", v10);

  -[CALNFakeNotificationSource iconIdentifierProvider](self, "iconIdentifierProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifierForIconWithDate:inCalendar:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIconIdentifier:", v14);

  v15 = (void *)objc_msgSend(v6, "copy");
  return v15;
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (CALNNotificationManager)notificationManager
{
  return self->_notificationManager;
}

- (CALNCalendarIconIdentifierProvider)iconIdentifierProvider
{
  return self->_iconIdentifierProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconIdentifierProvider, 0);
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
}

@end
