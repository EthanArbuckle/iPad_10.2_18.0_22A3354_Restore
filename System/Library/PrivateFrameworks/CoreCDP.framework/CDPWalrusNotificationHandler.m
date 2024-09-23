@implementation CDPWalrusNotificationHandler

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_4);
  return (id)sharedInstance_handler;
}

void __46__CDPWalrusNotificationHandler_sharedInstance__block_invoke()
{
  CDPWalrusNotificationHandler *v0;
  void *v1;

  v0 = objc_alloc_init(CDPWalrusNotificationHandler);
  v1 = (void *)sharedInstance_handler;
  sharedInstance_handler = (uint64_t)v0;

}

- (CDPWalrusNotificationHandler)init
{
  CDPWalrusNotificationHandler *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CDPWalrusNotificationHandler;
  result = -[CDPWalrusNotificationHandler init](&v3, sel_init);
  if (result)
  {
    result->_observerLock._os_unfair_lock_opaque = 0;
    result->_isObservingWalrusStatus = 0;
  }
  return result;
}

- (BOOL)isObservingWalrusStatus
{
  CDPWalrusNotificationHandler *v2;
  os_unfair_lock_s *p_observerLock;

  v2 = self;
  p_observerLock = &self->_observerLock;
  os_unfair_lock_lock(&self->_observerLock);
  LOBYTE(v2) = v2->_isObservingWalrusStatus;
  os_unfair_lock_unlock(p_observerLock);
  return (char)v2;
}

- (void)startObservingWalrusStateChangeNotification
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_20D7E6000, log, OS_LOG_TYPE_DEBUG, "\"Already observing walrus state change notification.\", v1, 2u);
}

- (void)dealloc
{
  objc_super v3;

  -[CDPWalrusNotificationHandler _stopObservingWalrusStateChangeNotification](self, "_stopObservingWalrusStateChangeNotification");
  v3.receiver = self;
  v3.super_class = (Class)CDPWalrusNotificationHandler;
  -[CDPWalrusNotificationHandler dealloc](&v3, sel_dealloc);
}

- (void)_stopObservingWalrusStateChangeNotification
{
  os_unfair_lock_s *p_observerLock;
  _BOOL4 isObservingWalrusStatus;
  NSObject *v5;
  _BOOL4 v6;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v8;
  __CFNotificationCenter *v9;
  uint8_t v10[16];
  uint8_t buf[16];
  uint8_t v12[16];

  p_observerLock = &self->_observerLock;
  os_unfair_lock_lock(&self->_observerLock);
  isObservingWalrusStatus = self->_isObservingWalrusStatus;
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (isObservingWalrusStatus)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D7E6000, v5, OS_LOG_TYPE_DEFAULT, "\"Stopping to observe walrus state change notification.\", buf, 2u);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("_CDPWalrusStateChangeDarwinNotification"), 0);
    _CDPLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_20D7E6000, v8, OS_LOG_TYPE_DEFAULT, "\"Stopping to observe OT peer change notification.\", v10, 2u);
    }

    v9 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(v9, self, CFSTR("com.apple.security.octagon.peer-changed"), 0);
    self->_isObservingWalrusStatus = 0;
  }
  else
  {
    if (v6)
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_20D7E6000, v5, OS_LOG_TYPE_DEFAULT, "\"Not yet started to observe walrus state change notification.\", v12, 2u);
    }

  }
  os_unfair_lock_unlock(p_observerLock);
}

@end
