@implementation GKPeerPickerController

- (id)delegate
{
  return 0;
}

- (GKPeerPickerConnectionType)connectionTypesMask
{
  return 0;
}

- (BOOL)isVisible
{
  return 0;
}

- (void)setConnectionTypesMask:(GKPeerPickerConnectionType)connectionTypesMask
{
  self->_connectionTypesMask = connectionTypesMask;
}

- (id)picker
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setPicker:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

@end
