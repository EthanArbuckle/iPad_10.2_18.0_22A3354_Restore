@implementation HMDAnalyticsPresenceEventData

- (int)presenceEventGranularity
{
  return self->_presenceEventGranularity;
}

- (void)setPresenceEventGranularity:(int)a3
{
  self->_presenceEventGranularity = a3;
}

- (int)presenceEventType
{
  return self->_presenceEventType;
}

- (void)setPresenceEventType:(int)a3
{
  self->_presenceEventType = a3;
}

@end
