@implementation MRProtocolMessageOptions

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (BOOL)isWaking
{
  return self->_waking;
}

- (void)setWaking:(BOOL)a3
{
  self->_waking = a3;
}

@end
