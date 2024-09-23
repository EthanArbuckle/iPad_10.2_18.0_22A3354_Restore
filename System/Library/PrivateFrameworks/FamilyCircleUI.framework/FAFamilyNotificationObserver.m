@implementation FAFamilyNotificationObserver

+ (void)initialize
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___FAFamilyNotificationObserver;
  objc_msgSendSuper2(&v2, sel_initialize);
  if (initialize_onceToken != -1)
    dispatch_once(&initialize_onceToken, &__block_literal_global_8);
}

CFMutableArrayRef __42__FAFamilyNotificationObserver_initialize__block_invoke()
{
  CFMutableArrayRef result;

  result = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, 0);
  s_knownObservers = (uint64_t)result;
  return result;
}

+ (id)familyNotificationObserverWithNotificationHandler:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithNotificationHandler:", v4);

  objc_msgSend(v5, "_startObserving");
  return v5;
}

- (FAFamilyNotificationObserver)init
{
  return (FAFamilyNotificationObserver *)-[FAFamilyNotificationObserver _initWithNotificationHandler:](self, "_initWithNotificationHandler:", 0);
}

- (id)_initWithNotificationHandler:(id)a3
{
  id v4;
  FAFamilyNotificationObserver *v5;
  uint64_t v6;
  id notificationHandler;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FAFamilyNotificationObserver;
  v5 = -[FAFamilyNotificationObserver init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    notificationHandler = v5->_notificationHandler;
    v5->_notificationHandler = (id)v6;

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[FAFamilyNotificationObserver stopObserving](self, "stopObserving");
  v3.receiver = self;
  v3.super_class = (Class)FAFamilyNotificationObserver;
  -[FAFamilyNotificationObserver dealloc](&v3, sel_dealloc);
}

- (void)_startObserving
{
  __CFNotificationCenter *DarwinNotifyCenter;
  const __CFString *v4;

  if (!self->_observing)
  {
    self->_observing = 1;
    CFArrayAppendValue((CFMutableArrayRef)s_knownObservers, self);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    v4 = (const __CFString *)getINFamilyDidChangeNotification();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_AAUIHandleFamilyDidChangeNotification, v4, 0, (CFNotificationSuspensionBehavior)0);
  }
}

- (void)stopObserving
{
  __CFNotificationCenter *DarwinNotifyCenter;
  const __CFString *v4;
  const __CFArray *v5;
  CFIndex FirstIndexOfValue;
  CFRange v7;

  if (self->_observing)
  {
    self->_observing = 0;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    v4 = (const __CFString *)getINFamilyDidChangeNotification();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, v4, 0);
    v5 = (const __CFArray *)s_knownObservers;
    v7.length = CFArrayGetCount((CFArrayRef)s_knownObservers);
    v7.location = 0;
    FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v5, v7, self);
    if (FirstIndexOfValue != -1)
      CFArrayRemoveValueAtIndex((CFMutableArrayRef)s_knownObservers, FirstIndexOfValue);
  }
}

- (void)_didReceiveNotification
{
  (*((void (**)(void))self->_notificationHandler + 2))();
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_notificationHandler, 0);
}

@end
