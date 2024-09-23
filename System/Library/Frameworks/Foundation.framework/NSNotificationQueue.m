@implementation NSNotificationQueue

+ (NSNotificationQueue)defaultQueue
{
  NSMutableDictionary *v3;
  uint64_t v4;
  NSNotificationQueue *v5;
  BOOL v6;

  v3 = -[NSThread threadDictionary](+[NSThread currentThread](NSThread, "currentThread"), "threadDictionary");
  v4 = -[NSMutableDictionary objectForKey:](v3, "objectForKey:", CFSTR("NSDefaultNotificationQueue"));
  v5 = (NSNotificationQueue *)v4;
  if (v3)
    v6 = v4 == 0;
  else
    v6 = 0;
  if (v6)
  {
    v5 = (NSNotificationQueue *)objc_msgSend(objc_allocWithZone((Class)a1), "init");
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v5, CFSTR("NSDefaultNotificationQueue"));

  }
  return v5;
}

- (NSNotificationQueue)init
{
  return -[NSNotificationQueue initWithNotificationCenter:](self, "initWithNotificationCenter:", +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
}

- (NSNotificationQueue)initWithNotificationCenter:(NSNotificationCenter *)notificationCenter
{
  NSNotificationQueue *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)NSNotificationQueue;
  v4 = -[NSNotificationQueue init](&v6, sel_init);
  if (v4)
  {
    v4->_notificationCenter = notificationCenter;
    v4->_asapQueue = (NSMutableArray *)(id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4->_idleQueue = (NSMutableArray *)(id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  }
  return v4;
}

- (void)enqueueNotification:(NSNotification *)notification postingStyle:(NSPostingStyle)postingStyle coalesceMask:(NSNotificationCoalescing)coalesceMask forModes:(NSArray *)modes
{
  NSNotificationQueue *v10;
  NSNotification *v11;
  NSArray *v12;
  int v13;

  if (postingStyle != NSPostWhenIdle)
  {
    if (postingStyle != NSPostASAP)
    {
      if (postingStyle == NSPostNow)
      {
        removeNotificationsFromQueue(self->_idleQueue, notification, 0, coalesceMask);
        removeNotificationsFromQueue(self->_asapQueue, notification, 0, coalesceMask);
        -[NSNotificationCenter postNotification:](self->_notificationCenter, "postNotification:", notification);
      }
      return;
    }
    removeNotificationsFromQueue(self->_idleQueue, notification, 0, coalesceMask);
    if (removeNotificationsFromQueue(self->_asapQueue, notification, 1, coalesceMask))
      return;
    v10 = self;
    v11 = notification;
    v12 = modes;
    v13 = 1;
LABEL_11:
    addNotificationToQueue(v10, (uint64_t)v11, v12, v13);
    return;
  }
  if (!removeNotificationsFromQueue(self->_asapQueue, notification, 1, coalesceMask)
    && !removeNotificationsFromQueue(self->_idleQueue, notification, 1, coalesceMask))
  {
    v10 = self;
    v11 = notification;
    v12 = modes;
    v13 = 0;
    goto LABEL_11;
  }
}

- (void)enqueueNotification:(NSNotification *)notification postingStyle:(NSPostingStyle)postingStyle
{
  -[NSNotificationQueue enqueueNotification:postingStyle:coalesceMask:forModes:](self, "enqueueNotification:postingStyle:coalesceMask:forModes:", notification, postingStyle, 3, 0);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[NSNotificationQueue _flushNotificationQueue](self, "_flushNotificationQueue");

  v3.receiver = self;
  v3.super_class = (Class)NSNotificationQueue;
  -[NSNotificationQueue dealloc](&v3, sel_dealloc);
}

- (void)_flushNotificationQueue
{
  NSMutableArray *asapQueue;
  NSMutableArray *idleQueue;

  asapQueue = self->_asapQueue;
  idleQueue = self->_idleQueue;
  self->_asapQueue = 0;
  self->_idleQueue = 0;

}

- (void)dequeueNotificationsMatching:(NSNotification *)notification coalesceMask:(NSUInteger)coalesceMask
{
  removeNotificationsFromQueue(self->_asapQueue, notification, 0, coalesceMask);
  removeNotificationsFromQueue(self->_idleQueue, notification, 0, coalesceMask);
}

@end
