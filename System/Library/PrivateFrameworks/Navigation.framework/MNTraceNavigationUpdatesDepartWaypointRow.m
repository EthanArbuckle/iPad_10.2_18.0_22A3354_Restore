@implementation MNTraceNavigationUpdatesDepartWaypointRow

- (int64_t)navigationUpdateType
{
  return 2;
}

- (GEOComposedWaypoint)waypoint
{
  return self->_waypoint;
}

- (void)setWaypoint:(id)a3
{
  objc_storeStrong((id *)&self->_waypoint, a3);
}

- (unint64_t)legIndex
{
  return self->_legIndex;
}

- (void)setLegIndex:(unint64_t)a3
{
  self->_legIndex = a3;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (void)setReason:(unint64_t)a3
{
  self->_reason = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waypoint, 0);
}

@end
