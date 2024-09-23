@implementation SGNotificationListener

- (SGNotificationListener)initWithNotification:(__CFString *)a3 callback:(id)a4
{
  id v6;
  SGNotificationListener *v7;
  uint64_t v8;
  id callback;
  __CFNotificationCenter *DistributedCenter;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SGNotificationListener;
  v7 = -[SGNotificationListener init](&v12, sel_init);
  if (v7)
  {
    v8 = MEMORY[0x1A8583BFC](v6);
    callback = v7->_callback;
    v7->_callback = (id)v8;

    v7->_notification = (__CFString *)CFRetain(a3);
    pthread_mutex_init(&v7->_lock, 0);
    DistributedCenter = CFNotificationCenterGetDistributedCenter();
    CFNotificationCenterAddObserver(DistributedCenter, v7, (CFNotificationCallback)changeCallback, v7->_notification, v7->_notification, CFNotificationSuspensionBehaviorDeliverImmediately);
  }

  return v7;
}

- (void)_notify
{
  void *v3;
  void (**callback)(id, void *, void *);
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  +[SGRecordId recordIdWithNumericValue:](SGRecordId, "recordIdWithNumericValue:", -1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  callback = (void (**)(id, void *, void *))self->_callback;
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  callback[2](callback, v5, v6);

}

- (void)dealloc
{
  objc_super v3;

  -[SGNotificationListener unsubscribe](self, "unsubscribe");
  pthread_mutex_destroy(&self->_lock);
  v3.receiver = self;
  v3.super_class = (Class)SGNotificationListener;
  -[SGNotificationListener dealloc](&v3, sel_dealloc);
}

- (BOOL)unsubscribe
{
  _opaque_pthread_mutex_t *p_lock;
  __CFString *notification;
  __CFNotificationCenter *DistributedCenter;
  id callback;

  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  notification = self->_notification;
  if (notification)
  {
    DistributedCenter = CFNotificationCenterGetDistributedCenter();
    CFNotificationCenterRemoveObserver(DistributedCenter, self, self->_notification, self->_notification);
    CFRelease(self->_notification);
    callback = self->_callback;
    self->_callback = 0;
    self->_notification = 0;

  }
  pthread_mutex_unlock(p_lock);
  return notification != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
}

@end
