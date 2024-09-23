@implementation _MNLocationSimulationState_SearchingForParkingAfterArrival

- (int64_t)type
{
  return 7;
}

- (double)_scoreForRoad:(id)a3 coordinate:(id)a4
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v4 = a3;
  objc_msgSend(v4, "internalRoadName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = 0.0;
  if (v5)
  {
    if (objc_msgSend(v4, "roadClass") != 9)
    {
      objc_msgSend(v4, "coordinates3d");
      objc_msgSend(v4, "coordinateCount");
      GEOCalculateDistance();
      v8 = v7;
      if (v7 <= 300.0)
      {
        if (objc_msgSend(v4, "travelDirection") != 1
          || (objc_msgSend(v4, "coordinates3d"), GEOCalculateDistance(), v9 < v8))
        {
          v6 = v8;
        }
      }
    }
  }

  return v6;
}

- (void)_handleReachedParkingLocation
{
  _MNLocationSimulationState_WaitingAtWaypoint *v3;
  void *v4;
  void *v5;
  _MNLocationSimulationState_ReturnToDestination *v6;

  if (GEOConfigGetInteger() == 3)
  {
    v6 = objc_alloc_init(_MNLocationSimulationState_ReturnToDestination);
  }
  else
  {
    v3 = [_MNLocationSimulationState_WaitingAtWaypoint alloc];
    -[_MNLocationSimulationState data](self, "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentTime");
    v6 = -[_MNLocationSimulationState_WaitingAtWaypoint initWithStartTime:waitDuration:](v3, "initWithStartTime:waitDuration:");

  }
  -[_MNLocationSimulationState delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "changeState:", v6);

}

@end
