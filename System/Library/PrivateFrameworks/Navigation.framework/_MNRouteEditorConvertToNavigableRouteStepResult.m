@implementation _MNRouteEditorConvertToNavigableRouteStepResult

- (NSArray)waypoints
{
  return self->_waypoints;
}

- (void)setWaypoints:(id)a3
{
  objc_storeStrong((id *)&self->_waypoints, a3);
}

- (GEOAddressObject)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
  objc_storeStrong((id *)&self->_address, a3);
}

- (GEOComposedRoute)finalizedRoute
{
  return self->_finalizedRoute;
}

- (void)setFinalizedRoute:(id)a3
{
  objc_storeStrong((id *)&self->_finalizedRoute, a3);
}

- (NSError)stepError
{
  return self->_stepError;
}

- (void)setStepError:(id)a3
{
  objc_storeStrong((id *)&self->_stepError, a3);
}

- (GEODirectionsError)directionsError
{
  return self->_directionsError;
}

- (void)setDirectionsError:(id)a3
{
  objc_storeStrong((id *)&self->_directionsError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directionsError, 0);
  objc_storeStrong((id *)&self->_stepError, 0);
  objc_storeStrong((id *)&self->_finalizedRoute, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_waypoints, 0);
}

@end
