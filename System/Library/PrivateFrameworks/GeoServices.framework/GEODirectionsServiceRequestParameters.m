@implementation GEODirectionsServiceRequestParameters

- (GEODirectionsServiceRequestParameters)init
{
  GEODirectionsServiceRequestParameters *v2;
  GEODirectionsServiceRequestParameters *v3;
  void *v4;
  uint64_t v5;
  GEOMapServiceTraits *traits;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GEODirectionsServiceRequestParameters;
  v2 = -[GEODirectionsServiceRequestParameters init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_requestType = 0;
    v2->_maxRouteCount = 1;
    v2->_routeCoordinate = ($604ECB7A8067A7300F159AE8ED6889F8)0xBF80000000000000;
    v2->_requestPriority = GEOConfigGetInteger(GeoServicesConfig_DirectionsRequestDefaultPriority, (uint64_t)off_1EDF4D0F8);
    v3->_startingLegIndex = 0x7FFFFFFFFFFFFFFFLL;
    +[GEOMapService sharedService](GEOMapService, "sharedService");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "defaultTraits");
    v5 = objc_claimAutoreleasedReturnValue();
    traits = v3->_traits;
    v3->_traits = (GEOMapServiceTraits *)v5;

  }
  return v3;
}

- (unint64_t)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(unint64_t)a3
{
  self->_requestType = a3;
}

- (NSArray)waypoints
{
  return self->_waypoints;
}

- (void)setWaypoints:(id)a3
{
  objc_storeStrong((id *)&self->_waypoints, a3);
}

- (GEOComposedRouteAnchorPointList)anchorPoints
{
  return self->_anchorPoints;
}

- (void)setAnchorPoints:(id)a3
{
  objc_storeStrong((id *)&self->_anchorPoints, a3);
}

- (GEOComposedRoute)currentRoute
{
  return self->_currentRoute;
}

- (void)setCurrentRoute:(id)a3
{
  objc_storeStrong((id *)&self->_currentRoute, a3);
}

- (GEOResumeRouteHandle)resumeRouteHandle
{
  return self->_resumeRouteHandle;
}

- (void)setResumeRouteHandle:(id)a3
{
  objc_storeStrong((id *)&self->_resumeRouteHandle, a3);
}

- (unint64_t)waypointModificationType
{
  return self->_waypointModificationType;
}

- (void)setWaypointModificationType:(unint64_t)a3
{
  self->_waypointModificationType = a3;
}

- (GEOComposedWaypoint)waypointToInsert
{
  return self->_waypointToInsert;
}

- (void)setWaypointToInsert:(id)a3
{
  objc_storeStrong((id *)&self->_waypointToInsert, a3);
}

- (unint64_t)waypointIndexToRemove
{
  return self->_waypointIndexToRemove;
}

- (void)setWaypointIndexToRemove:(unint64_t)a3
{
  self->_waypointIndexToRemove = a3;
}

- ($212C09783140BCCD23384160D545CE0D)routeCoordinate
{
  return ($212C09783140BCCD23384160D545CE0D)self->_routeCoordinate;
}

- (void)setRouteCoordinate:(id)a3
{
  self->_routeCoordinate = ($604ECB7A8067A7300F159AE8ED6889F8)a3;
}

- (unint64_t)startingLegIndex
{
  return self->_startingLegIndex;
}

- (void)setStartingLegIndex:(unint64_t)a3
{
  self->_startingLegIndex = a3;
}

- (int)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(int)a3
{
  self->_transportType = a3;
}

- (GEORouteAttributes)routeAttributes
{
  return self->_routeAttributes;
}

- (void)setRouteAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_routeAttributes, a3);
}

- (GEOCommonOptions)commonOptions
{
  return self->_commonOptions;
}

- (void)setCommonOptions:(id)a3
{
  objc_storeStrong((id *)&self->_commonOptions, a3);
}

- (unint64_t)maxRouteCount
{
  return self->_maxRouteCount;
}

- (void)setMaxRouteCount:(unint64_t)a3
{
  self->_maxRouteCount = a3;
}

- (GEOLocation)currentLocation
{
  return self->_currentLocation;
}

- (void)setCurrentLocation:(id)a3
{
  objc_storeStrong((id *)&self->_currentLocation, a3);
}

- (GEOMapRegion)visibleRegion
{
  return self->_visibleRegion;
}

- (void)setVisibleRegion:(id)a3
{
  objc_storeStrong((id *)&self->_visibleRegion, a3);
}

- (GEODirectionsRequestFeedback)feedback
{
  return self->_feedback;
}

- (void)setFeedback:(id)a3
{
  objc_storeStrong((id *)&self->_feedback, a3);
}

- (BOOL)hasVisitedFirstStop
{
  return self->_hasVisitedFirstStop;
}

- (void)setHasVisitedFirstStop:(BOOL)a3
{
  self->_hasVisitedFirstStop = a3;
}

- (BOOL)returnToOriginalDestination
{
  return self->_returnToOriginalDestination;
}

- (void)setReturnToOriginalDestination:(BOOL)a3
{
  self->_returnToOriginalDestination = a3;
}

- (GEOMatchedPathSegment)pathSegment
{
  return self->_pathSegment;
}

- (void)setPathSegment:(id)a3
{
  objc_storeStrong((id *)&self->_pathSegment, a3);
}

- (int64_t)requestPriority
{
  return self->_requestPriority;
}

- (void)setRequestPriority:(int64_t)a3
{
  self->_requestPriority = a3;
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
  objc_storeStrong((id *)&self->_requestingAppIdentifier, a3);
}

- (GEOMapServiceTraits)traits
{
  return self->_traits;
}

- (void)setTraits:(id)a3
{
  objc_storeStrong((id *)&self->_traits, a3);
}

- (BOOL)hasArrived
{
  return self->_hasArrived;
}

- (void)setHasArrived:(BOOL)a3
{
  self->_hasArrived = a3;
}

- (double)displayRemainingTimeToDestination
{
  return self->_displayRemainingTimeToDestination;
}

- (void)setDisplayRemainingTimeToDestination:(double)a3
{
  self->_displayRemainingTimeToDestination = a3;
}

- (GEORecentLocationHistory)recentLocationHistory
{
  return self->_recentLocationHistory;
}

- (void)setRecentLocationHistory:(id)a3
{
  objc_storeStrong((id *)&self->_recentLocationHistory, a3);
}

- (id)requestCallback
{
  return self->_requestCallback;
}

- (void)setRequestCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_requestCallback, 0);
  objc_storeStrong((id *)&self->_recentLocationHistory, 0);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_requestingAppIdentifier, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_pathSegment, 0);
  objc_storeStrong((id *)&self->_feedback, 0);
  objc_storeStrong((id *)&self->_visibleRegion, 0);
  objc_storeStrong((id *)&self->_currentLocation, 0);
  objc_storeStrong((id *)&self->_commonOptions, 0);
  objc_storeStrong((id *)&self->_routeAttributes, 0);
  objc_storeStrong((id *)&self->_waypointToInsert, 0);
  objc_storeStrong((id *)&self->_resumeRouteHandle, 0);
  objc_storeStrong((id *)&self->_currentRoute, 0);
  objc_storeStrong((id *)&self->_anchorPoints, 0);
  objc_storeStrong((id *)&self->_waypoints, 0);
}

@end
