@implementation MNTraceNavigationUpdatesChangeRouteRow

- (int64_t)navigationUpdateType
{
  return 1;
}

- (NSData)directionsResponseID
{
  return self->_directionsResponseID;
}

- (void)setDirectionsResponseID:(id)a3
{
  objc_storeStrong((id *)&self->_directionsResponseID, a3);
}

- (NSData)etauResponseID
{
  return self->_etauResponseID;
}

- (void)setEtauResponseID:(id)a3
{
  objc_storeStrong((id *)&self->_etauResponseID, a3);
}

- (unint64_t)routeIndex
{
  return self->_routeIndex;
}

- (void)setRouteIndex:(unint64_t)a3
{
  self->_routeIndex = a3;
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
  objc_storeStrong((id *)&self->_etauResponseID, 0);
  objc_storeStrong((id *)&self->_directionsResponseID, 0);
}

@end
