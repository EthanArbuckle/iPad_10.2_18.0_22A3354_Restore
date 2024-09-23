@implementation MPPlayableContentManagerContext

- (NSInteger)enforcedContentItemsCount
{
  return self->_enforcedContentItemsCount;
}

- (void)setEnforcedContentItemsCount:(int64_t)a3
{
  self->_enforcedContentItemsCount = a3;
}

- (NSInteger)enforcedContentTreeDepth
{
  return self->_enforcedContentTreeDepth;
}

- (void)setEnforcedContentTreeDepth:(int64_t)a3
{
  self->_enforcedContentTreeDepth = a3;
}

- (BOOL)contentLimitsEnforced
{
  return self->_contentLimitsEnforced;
}

- (void)setContentLimitsEnforced:(BOOL)a3
{
  self->_contentLimitsEnforced = a3;
}

- (BOOL)endpointAvailable
{
  return self->_endpointAvailable;
}

- (void)setEndpointAvailable:(BOOL)a3
{
  self->_endpointAvailable = a3;
}

@end
