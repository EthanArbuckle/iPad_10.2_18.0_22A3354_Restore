@implementation MPAVRoutingViewControllerUpdate

- (NSArray)pickedRoutes
{
  return self->_pickedRoutes;
}

- (void)setPickedRoutes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)pendingPickedRoutes
{
  return self->_pendingPickedRoutes;
}

- (void)setPendingPickedRoutes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)displayableAvailableRoutes
{
  return self->_displayableAvailableRoutes;
}

- (void)setDisplayableAvailableRoutes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)displayAsPickedRoutes
{
  return self->_displayAsPickedRoutes;
}

- (void)setDisplayAsPickedRoutes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)volumeCapableRoutes
{
  return self->_volumeCapableRoutes;
}

- (void)setVolumeCapableRoutes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDictionary)routeGrouping
{
  return self->_routeGrouping;
}

- (void)setRouteGrouping:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)canGroup
{
  return self->_canGroup;
}

- (void)setCanGroup:(BOOL)a3
{
  self->_canGroup = a3;
}

- (BOOL)hasPendingPickedRoutes
{
  return self->_hasPendingPickedRoutes;
}

- (void)setHasPendingPickedRoutes:(BOOL)a3
{
  self->_hasPendingPickedRoutes = a3;
}

- (BOOL)shouldReload
{
  return self->_shouldReload;
}

- (void)setShouldReload:(BOOL)a3
{
  self->_shouldReload = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeGrouping, 0);
  objc_storeStrong((id *)&self->_volumeCapableRoutes, 0);
  objc_storeStrong((id *)&self->_displayAsPickedRoutes, 0);
  objc_storeStrong((id *)&self->_displayableAvailableRoutes, 0);
  objc_storeStrong((id *)&self->_pendingPickedRoutes, 0);
  objc_storeStrong((id *)&self->_pickedRoutes, 0);
}

@end
