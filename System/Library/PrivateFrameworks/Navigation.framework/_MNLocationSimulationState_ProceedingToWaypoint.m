@implementation _MNLocationSimulationState_ProceedingToWaypoint

- (int64_t)type
{
  return 3;
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
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  unint64_t v43;
  void *v44;
  unint64_t v45;
  void *v46;
  int v47;
  _MNLocationSimulationState_End *v48;
  _MNLocationSimulationState_WaitingAtWaypoint *v49;
  void *v50;
  void *v51;
  void *v52;
  double v54;
  double v55;

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
    v52 = 0;
  }
  else
  {
    objc_msgSend(v6, "legs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MNLocationSimulationState data](self, "data");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v12, "currentLegIndex"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "destination");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "coordinate");
    v16 = v15;
    v18 = v17;
    v20 = v19;

    v54 = 0.0;
    v55 = -1.0;
    -[_MNLocationSimulationState data](self, "data");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "lastLocation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      -[_MNLocationSimulationState data](self, "data");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "lastLocation");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "_navigation_geoCoordinate3D");
      v26 = v25;
      v28 = v27;
      v30 = v29;

      -[_MNLocationSimulationState _projectedCoordinateOffRouteFrom:toCoordinate:overTimeDelta:outCourse:outSpeed:](self, "_projectedCoordinateOffRouteFrom:toCoordinate:overTimeDelta:outCourse:outSpeed:", &v55, &v54, v26, v28, v30, v16, v18, v20, a3);
      v32 = v31;
      v34 = v33;
      v36 = v35;
    }
    else
    {
      objc_msgSend(v6, "pointAt:", objc_msgSend(v13, "endPointIndex"));
      v32 = v37;
      v34 = v38;
      v36 = v39;
      objc_msgSend(v6, "courseAtRouteCoordinateIndex:", objc_msgSend(v13, "endPointIndex"));
      v55 = v40;
    }
    GEOCalculateDistance();
    if (v41 < 0.000001)
    {
      -[_MNLocationSimulationState data](self, "data");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "currentLegIndex");
      objc_msgSend(v6, "legs");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "count") - 1;

      if (v43 >= v45
        && (-[_MNLocationSimulationState data](self, "data"),
            v46 = (void *)objc_claimAutoreleasedReturnValue(),
            v47 = objc_msgSend(v46, "endAtFinalDestination"),
            v46,
            v47))
      {
        v48 = objc_alloc_init(_MNLocationSimulationState_End);
      }
      else
      {
        v49 = [_MNLocationSimulationState_WaitingAtWaypoint alloc];
        -[_MNLocationSimulationState data](self, "data");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "currentTime");
        v48 = -[_MNLocationSimulationState_WaitingAtWaypoint initWithStartTime:waitDuration:](v49, "initWithStartTime:waitDuration:");

      }
      -[_MNLocationSimulationState delegate](self, "delegate");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "changeState:", v48);

    }
    -[_MNLocationSimulationState _locationWithCoordinate:course:speed:](self, "_locationWithCoordinate:course:speed:", v32, v34, v36, v55, v54);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v52;
}

@end
