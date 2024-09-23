@implementation _MNLocationSimulationState_WaitingAtWaypoint

- (_MNLocationSimulationState_WaitingAtWaypoint)initWithStartTime:(double)a3 waitDuration:(double)a4
{
  _MNLocationSimulationState_WaitingAtWaypoint *v6;
  _MNLocationSimulationState_WaitingAtWaypoint *v7;
  _MNLocationSimulationState_WaitingAtWaypoint *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_MNLocationSimulationState_WaitingAtWaypoint;
  v6 = -[_MNLocationSimulationState_WaitingAtWaypoint init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_startTime = a3;
    v6->_waitDuration = a4;
    v8 = v6;
  }

  return v7;
}

- (int64_t)type
{
  return 4;
}

- (id)nextSimulatedLocationWithElapsedTime:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  __objc2_class *v22;
  int v23;
  id v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;

  -[_MNLocationSimulationState data](self, "data", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v36 = 0;
    return v36;
  }
  if (self->_startTime <= 0.0)
  {
    -[_MNLocationSimulationState data](self, "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentTime");
    self->_startTime = v7;

  }
  -[_MNLocationSimulationState data](self, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "currentLegIndex");
  -[_MNLocationSimulationState data](self, "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "routeToFollow");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "legs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count") - 1;

  -[_MNLocationSimulationState data](self, "data");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v9 >= v13)
  {
    v23 = objc_msgSend(v14, "endAtFinalDestination");

    if (v23)
    {
      -[_MNLocationSimulationState delegate](self, "delegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = _MNLocationSimulationState_End;
      goto LABEL_9;
    }
  }
  else
  {
    objc_msgSend(v14, "currentTime");
    v17 = v16 - self->_startTime;

    if (v17 > self->_waitDuration)
    {
      -[_MNLocationSimulationState data](self, "data");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "currentLegIndex") + 1;
      -[_MNLocationSimulationState data](self, "data");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setCurrentLegIndex:", v19);

      -[_MNLocationSimulationState delegate](self, "delegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = _MNLocationSimulationState_ProceedingToStartOfLeg;
LABEL_9:
      v24 = objc_alloc_init(v22);
      objc_msgSend(v21, "changeState:", v24);

    }
  }
  -[_MNLocationSimulationState data](self, "data");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "lastLocation");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "_navigation_geoCoordinate3D");
  v28 = v27;
  v30 = v29;
  v32 = v31;

  -[_MNLocationSimulationState data](self, "data");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "lastLocation");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "course");
  -[_MNLocationSimulationState _locationWithCoordinate:course:speed:](self, "_locationWithCoordinate:course:speed:", v28, v30, v32, v35, 0.0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  return v36;
}

@end
