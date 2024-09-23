@implementation _MNLocationSimulationState_ReturnToDestination

- (int64_t)type
{
  return 8;
}

- (void)_findParkingLocation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void (**v10)(id, void *, BOOL);

  v10 = (void (**)(id, void *, BOOL))a3;
  -[_MNLocationSimulationState data](self, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "routeInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "route");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && objc_msgSend(v6, "pointCount") >= 2)
  {
    objc_msgSend(v6, "pointAt:", objc_msgSend(v6, "pointCount") - 1);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27168]), "initWithGEOCoordinate:", v7, v8);
  }
  else
  {
    v9 = 0;
  }
  v10[2](v10, v9, v9 != 0);

}

- (void)_handleReachedParkingLocation
{
  _MNLocationSimulationState_WaitingAtWaypoint *v3;
  void *v4;
  _MNLocationSimulationState_WaitingAtWaypoint *v5;
  id v6;

  -[_MNLocationSimulationState delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = [_MNLocationSimulationState_WaitingAtWaypoint alloc];
  -[_MNLocationSimulationState data](self, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentTime");
  v5 = -[_MNLocationSimulationState_WaitingAtWaypoint initWithStartTime:waitDuration:](v3, "initWithStartTime:waitDuration:");
  objc_msgSend(v6, "changeState:", v5);

}

@end
