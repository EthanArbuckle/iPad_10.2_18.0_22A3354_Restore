@implementation CDPWebAccessNotificationHandler

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_5);
  return (id)sharedInstance_handler_0;
}

void __49__CDPWebAccessNotificationHandler_sharedInstance__block_invoke()
{
  CDPWebAccessNotificationHandler *v0;
  void *v1;

  v0 = objc_alloc_init(CDPWebAccessNotificationHandler);
  v1 = (void *)sharedInstance_handler_0;
  sharedInstance_handler_0 = (uint64_t)v0;

}

- (void)dealloc
{
  objc_super v3;

  -[CDPWebAccessNotificationHandler _stopObservingWebAccessStateChangeNotification](self, "_stopObservingWebAccessStateChangeNotification");
  v3.receiver = self;
  v3.super_class = (Class)CDPWebAccessNotificationHandler;
  -[CDPWebAccessNotificationHandler dealloc](&v3, sel_dealloc);
}

- (void)startObservingWebAccessStateChangeNotification
{
  _BOOL4 isObservingWebAccessStatus;
  NSObject *v4;
  _BOOL4 v5;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint8_t v7[16];
  uint8_t buf[16];

  isObservingWebAccessStatus = self->_isObservingWebAccessStatus;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (isObservingWebAccessStatus)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D7E6000, v4, OS_LOG_TYPE_DEFAULT, "\"Already observing web access state change notification.\", buf, 2u);
    }

  }
  else
  {
    if (v5)
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_20D7E6000, v4, OS_LOG_TYPE_DEFAULT, "\"Starting to observe web access state change notification.\", v7, 2u);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)HandleWebAccessStateChangedNotification, CFSTR("_CDPWebAccessStateChangeDarwinNotification"), 0, (CFNotificationSuspensionBehavior)0);
    self->_isObservingWebAccessStatus = 1;
  }
}

- (void)_stopObservingWebAccessStateChangeNotification
{
  _BOOL4 isObservingWebAccessStatus;
  NSObject *v4;
  _BOOL4 v5;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint8_t v7[16];
  uint8_t buf[16];

  isObservingWebAccessStatus = self->_isObservingWebAccessStatus;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (isObservingWebAccessStatus)
  {
    if (v5)
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_20D7E6000, v4, OS_LOG_TYPE_DEFAULT, "\"Stopping to observe web access state change notification.\", v7, 2u);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("_CDPWebAccessStateChangeDarwinNotification"), 0);
    self->_isObservingWebAccessStatus = 0;
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D7E6000, v4, OS_LOG_TYPE_DEFAULT, "\"Not yet started to observe web access state change notification.\", buf, 2u);
    }

  }
}

@end
