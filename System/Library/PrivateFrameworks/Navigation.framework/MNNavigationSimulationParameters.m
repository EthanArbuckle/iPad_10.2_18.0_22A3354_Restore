@implementation MNNavigationSimulationParameters

- (int64_t)simulationType
{
  return self->_simulationType;
}

- (void)setSimulationType:(int64_t)a3
{
  self->_simulationType = a3;
}

- (MNActiveRouteInfo)initialRoute
{
  return self->_initialRoute;
}

- (void)setInitialRoute:(id)a3
{
  objc_storeStrong((id *)&self->_initialRoute, a3);
}

- (MNLocation)startingLocation
{
  return self->_startingLocation;
}

- (void)setStartingLocation:(id)a3
{
  objc_storeStrong((id *)&self->_startingLocation, a3);
}

- (GEOApplicationAuditToken)auditToken
{
  return self->_auditToken;
}

- (void)setAuditToken:(id)a3
{
  objc_storeStrong((id *)&self->_auditToken, a3);
}

- (NSString)requestingAppIdentifier
{
  return self->_requestingAppIdentifier;
}

- (void)setRequestingAppIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestingAppIdentifier, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_startingLocation, 0);
  objc_storeStrong((id *)&self->_initialRoute, 0);
}

@end
