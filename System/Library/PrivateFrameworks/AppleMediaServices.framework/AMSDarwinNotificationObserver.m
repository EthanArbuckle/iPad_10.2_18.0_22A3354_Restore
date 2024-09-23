@implementation AMSDarwinNotificationObserver

- (void)setObserverBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (AMSDarwinNotificationObserver)initWithNotificationName:(__CFString *)a3 additionalBehavior:(int64_t)a4
{
  AMSDarwinNotificationObserver *v6;
  AMSDarwinNotificationObserver *v7;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AMSDarwinNotificationObserver;
  v6 = -[AMSDarwinNotificationObserver init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_notificationName = a3;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v7, (CFNotificationCallback)_handleNotification, a3, 0, (CFNotificationSuspensionBehavior)(a4 | 0x400));
  }
  return v7;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, -[AMSDarwinNotificationObserver notificationName](self, "notificationName"), 0);
  v4.receiver = self;
  v4.super_class = (Class)AMSDarwinNotificationObserver;
  -[AMSDarwinNotificationObserver dealloc](&v4, sel_dealloc);
}

- (id)observerBlock
{
  return objc_getProperty(self, a2, 8, 1);
}

- (__CFString)notificationName
{
  return self->_notificationName;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_observerBlock, 0);
}

@end
