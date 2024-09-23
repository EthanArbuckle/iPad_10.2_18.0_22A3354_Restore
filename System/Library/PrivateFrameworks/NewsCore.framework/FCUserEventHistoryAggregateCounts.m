@implementation FCUserEventHistoryAggregateCounts

+ (FCUserEventHistoryAggregateCounts)empty
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setTag:", -1);
  objc_msgSend(v2, "setChannelTopic:", -1);
  objc_msgSend(v2, "setGroup:", -1);
  return (FCUserEventHistoryAggregateCounts *)v2;
}

- (int64_t)tag
{
  return self->_tag;
}

- (void)setTag:(int64_t)a3
{
  self->_tag = a3;
}

- (int64_t)channelTopic
{
  return self->_channelTopic;
}

- (void)setChannelTopic:(int64_t)a3
{
  self->_channelTopic = a3;
}

- (int64_t)group
{
  return self->_group;
}

- (void)setGroup:(int64_t)a3
{
  self->_group = a3;
}

@end
