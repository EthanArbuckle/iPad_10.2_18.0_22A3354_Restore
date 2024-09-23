@implementation HMDAnalyticsSignificantTimeEventData

- (NSString)significantEvent
{
  return self->_significantEvent;
}

- (void)setSignificantEvent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)offsetPresent
{
  return self->_offsetPresent;
}

- (void)setOffsetPresent:(BOOL)a3
{
  self->_offsetPresent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_significantEvent, 0);
}

@end
