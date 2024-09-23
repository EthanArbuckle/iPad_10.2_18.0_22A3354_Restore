@implementation MSPRidesharingInformationSource

- (MSPRidesharingInformationSource)initWithStartWaypoint:(id)a3 endWaypoint:(id)a4
{
  id v6;
  id v7;
  MSPRidesharingInformationSource *v8;
  uint64_t v9;
  GEOComposedWaypoint *startWaypoint;
  uint64_t v11;
  GEOComposedWaypoint *endWaypoint;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MSPRidesharingInformationSource;
  v8 = -[MSPRidesharingInformationSource init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    startWaypoint = v8->_startWaypoint;
    v8->_startWaypoint = (GEOComposedWaypoint *)v9;

    v11 = objc_msgSend(v7, "copy");
    endWaypoint = v8->_endWaypoint;
    v8->_endWaypoint = (GEOComposedWaypoint *)v11;

  }
  return v8;
}

- (id)ifGEOStorageRouteRequestStorage
{
  return 0;
}

- (GEOComposedWaypoint)_startWaypoint
{
  return self->_startWaypoint;
}

- (GEOComposedWaypoint)_endWaypoint
{
  return self->_endWaypoint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endWaypoint, 0);
  objc_storeStrong((id *)&self->_startWaypoint, 0);
}

@end
