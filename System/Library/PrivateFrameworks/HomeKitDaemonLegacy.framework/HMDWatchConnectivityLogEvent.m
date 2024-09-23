@implementation HMDWatchConnectivityLogEvent

- (HMDWatchConnectivityLogEvent)init
{
  HMDWatchConnectivityLogEvent *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMDWatchConnectivityLogEvent;
  v2 = -[HMMLogEvent init](&v6, sel_init);
  if (v2)
  {
    +[HMDWatchConnectivityLogEventManager sharedInstance](HMDWatchConnectivityLogEventManager, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
      objc_msgSend(v3, "currentWatchConnectivitySnapshot");

    v2->_reportComplete = 0;
    v2->_watchAddedNotificationCount = 0;
    v2->_watchRemovedNotificationCount = 0;
  }
  return v2;
}

- (unint64_t)watchAddedNotificationCount
{
  return self->_watchAddedNotificationCount;
}

- (void)setWatchAddedNotificationCount:(unint64_t)a3
{
  self->_watchAddedNotificationCount = a3;
}

- (unint64_t)watchRemovedNotificationCount
{
  return self->_watchRemovedNotificationCount;
}

- (void)setWatchRemovedNotificationCount:(unint64_t)a3
{
  self->_watchRemovedNotificationCount = a3;
}

- (BOOL)isReportComplete
{
  return self->_reportComplete;
}

- (void)setReportComplete:(BOOL)a3
{
  self->_reportComplete = a3;
}

@end
