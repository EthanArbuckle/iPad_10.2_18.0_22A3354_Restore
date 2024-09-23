@implementation _MNLocationSimulationState_WaitingForParkingSignal

- (int64_t)type
{
  return 9;
}

- (id)nextSimulatedLocationWithElapsedTime:(double)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;

  -[_MNLocationSimulationState data](self, "data", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_navigation_geoCoordinate3D");
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[_MNLocationSimulationState data](self, "data");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lastLocation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "course");
  -[_MNLocationSimulationState _locationWithCoordinate:course:speed:](self, "_locationWithCoordinate:course:speed:", v7, v9, v11, v14, 0.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)updateWithRouteInfo:(id)a3 rerouteReason:(unint64_t)a4
{
  void *v5;
  int v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "route");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "transportType");

  if (v6 == 2)
  {
    -[_MNLocationSimulationState delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[_MNLocationSimulationState _followRouteStateWithStartRouteCoordinate:](self, "_followRouteStateWithStartRouteCoordinate:", *MEMORY[0x1E0D26AA8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "changeState:", v7);

  }
}

@end
