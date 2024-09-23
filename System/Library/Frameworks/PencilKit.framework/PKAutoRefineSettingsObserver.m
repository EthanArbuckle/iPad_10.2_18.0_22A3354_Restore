@implementation PKAutoRefineSettingsObserver

- (_QWORD)initWithHandler:(_QWORD *)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v8;

  v3 = a2;
  if (a1)
  {
    v8.receiver = a1;
    v8.super_class = (Class)PKAutoRefineSettingsObserver;
    a1 = objc_msgSendSuper2(&v8, sel_init);
    if (a1)
    {
      v4 = objc_msgSend(v3, "copy");
      v5 = (void *)a1[1];
      a1[1] = v4;

      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, a1, (CFNotificationCallback)_PKHandleAutoRefineSettingsDidChange, CFSTR("PKRemoteAutoRefineSettingsDidChange"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
  }

  return a1;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("PKRemoteAutoRefineSettingsDidChange"), 0);
  v4.receiver = self;
  v4.super_class = (Class)PKAutoRefineSettingsObserver;
  -[PKAutoRefineSettingsObserver dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
}

@end
