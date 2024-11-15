@implementation _GEOMapFeatureAccessRequestParameters

- (GEOTileLoader)tileLoader
{
  return self->tileLoader;
}

- (void)setTileLoader:(id)a3
{
  objc_storeStrong((id *)&self->tileLoader, a3);
}

- (OS_dispatch_queue)queue
{
  return self->queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->queue, a3);
}

- (GEOApplicationAuditToken)auditToken
{
  return self->auditToken;
}

- (void)setAuditToken:(id)a3
{
  objc_storeStrong((id *)&self->auditToken, a3);
}

- (BOOL)allowNetworkTileLoad
{
  return self->allowNetworkTileLoad;
}

- (void)setAllowNetworkTileLoad:(BOOL)a3
{
  self->allowNetworkTileLoad = a3;
}

- (BOOL)flipNegativeTravelDirectionRoads
{
  return self->flipNegativeTravelDirectionRoads;
}

- (void)setFlipNegativeTravelDirectionRoads:(BOOL)a3
{
  self->flipNegativeTravelDirectionRoads = a3;
}

- (BOOL)visitDoubleTravelDirectionRoadsTwice
{
  return self->visitDoubleTravelDirectionRoadsTwice;
}

- (void)setVisitDoubleTravelDirectionRoadsTwice:(BOOL)a3
{
  self->visitDoubleTravelDirectionRoadsTwice = a3;
}

- (BOOL)allowStaleData
{
  return self->allowStaleData;
}

- (void)setAllowStaleData:(BOOL)a3
{
  self->allowStaleData = a3;
}

- (BOOL)preferStaleData
{
  return self->preferStaleData;
}

- (void)setPreferStaleData:(BOOL)a3
{
  self->preferStaleData = a3;
}

- (BOOL)allowOfflineData
{
  return self->allowOfflineData;
}

- (void)setAllowOfflineData:(BOOL)a3
{
  self->allowOfflineData = a3;
}

- (BOOL)joinAllRoadsByMuid
{
  return self->joinAllRoadsByMuid;
}

- (void)setJoinAllRoadsByMuid:(BOOL)a3
{
  self->joinAllRoadsByMuid = a3;
}

- (BOOL)cachedTilesCallbackImmediately
{
  return self->cachedTilesCallbackImmediately;
}

- (void)setCachedTilesCallbackImmediately:(BOOL)a3
{
  self->cachedTilesCallbackImmediately = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->auditToken, 0);
  objc_storeStrong((id *)&self->queue, 0);
  objc_storeStrong((id *)&self->tileLoader, 0);
}

@end
