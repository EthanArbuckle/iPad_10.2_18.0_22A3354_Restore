@implementation HMDAnalyticsLocationEventData

- (BOOL)notifyOnEntry
{
  return self->_notifyOnEntry;
}

- (void)setNotifyOnEntry:(BOOL)a3
{
  self->_notifyOnEntry = a3;
}

- (BOOL)notifyOnExit
{
  return self->_notifyOnExit;
}

- (void)setNotifyOnExit:(BOOL)a3
{
  self->_notifyOnExit = a3;
}

@end
