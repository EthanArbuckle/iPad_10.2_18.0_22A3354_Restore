@implementation _MNLocationSimulationState_ProceedingToStartOfLeg

- (int64_t)type
{
  return 1;
}

- (void)onEnterState
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  MNGetMNNavigationSimulationLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[_MNLocationSimulationState data](self, "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 67109120;
    LODWORD(v10) = objc_msgSend(v4, "currentLegIndex");

  }
  -[_MNLocationSimulationState data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    MNGetMNNavigationSimulationLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v9) = 0;
    }

    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315650;
      v10 = "-[_MNLocationSimulationState_ProceedingToStartOfLeg onEnterState]";
      v11 = 2080;
      v12 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Simulation/MNSimulatedLocationGenerator.m";
      v13 = 1024;
      v14 = 538;
      _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: Hit an unreachable code path", (uint8_t *)&v9, 0x1Cu);
    }

  }
}

- (id)nextSimulatedLocationWithElapsedTime:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  double v41;
  double v42;

  -[_MNLocationSimulationState data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "routeToFollow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[_MNLocationSimulationState data](self, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "currentLegIndex");
  objc_msgSend(v6, "legs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v8 >= v10)
  {
    v39 = 0;
  }
  else
  {
    objc_msgSend(v6, "legs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MNLocationSimulationState data](self, "data");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v12, "currentLegIndex"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "pointAt:", objc_msgSend(v13, "startPointIndex"));
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v41 = 0.0;
    v42 = -1.0;
    -[_MNLocationSimulationState data](self, "data");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "lastLocation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "_navigation_geoCoordinate3D");
    v23 = v22;
    v25 = v24;

    -[_MNLocationSimulationState data](self, "data");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "lastLocation");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "altitude");
    v29 = v28;

    -[_MNLocationSimulationState _projectedCoordinateOffRouteFrom:toCoordinate:overTimeDelta:outCourse:outSpeed:](self, "_projectedCoordinateOffRouteFrom:toCoordinate:overTimeDelta:outCourse:outSpeed:", &v42, &v41, v23, v25, v29, v15, v17, v19, a3);
    v31 = v30;
    v33 = v32;
    v35 = v34;
    GEOCalculateDistance();
    if (v36 < 0.000001)
    {
      -[_MNLocationSimulationState delegate](self, "delegate");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MNLocationSimulationState _followRouteStateWithStartRouteCoordinate:](self, "_followRouteStateWithStartRouteCoordinate:", objc_msgSend(v13, "startRouteCoordinate"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "changeState:", v38);

    }
    -[_MNLocationSimulationState _locationWithCoordinate:course:speed:](self, "_locationWithCoordinate:course:speed:", v31, v33, v35, v42, v41);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v39;
}

@end
