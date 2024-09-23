@implementation HMDUserActivityType6CoreLocationTracker

- (HMDUserActivityType6CoreLocationTracker)initWithDataSource:(id)a3 locationManager:(id)a4
{
  id v7;
  id v8;
  HMDUserActivityType6CoreLocationTracker *v9;
  HMDUserActivityType6CoreLocationTracker *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDUserActivityType6CoreLocationTracker;
  v9 = -[HMDUserActivityType6CoreLocationTracker init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_dataSource, a3);
    objc_storeStrong((id *)&v10->_locationManager, a4);
    v10->_locationAuthorization = 0;
    v10->_state = 1;
    v10->_lastReason = 0;
    v10->_closestDistance = -1.0;
  }

  return v10;
}

- (void)configureWithDelegate:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;

  v4 = a3;
  -[HMDUserActivityType6CoreLocationTracker dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  objc_storeWeak((id *)&self->_delegate, v4);
  -[HMDUserActivityType6CoreLocationTracker _registerForNotifications](self, "_registerForNotifications");
  -[HMDUserActivityType6CoreLocationTracker locationManager](self, "locationManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDUserActivityType6CoreLocationTracker _handleLocationAuthorization:](self, "_handleLocationAuthorization:", objc_msgSend(v7, "locationAuthorized"));

}

- (unint64_t)state
{
  os_unfair_lock_s *p_lock;
  unint64_t state;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  state = self->_state;
  os_unfair_lock_unlock(p_lock);
  return state;
}

- (void)setState:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_state = a3;
  os_unfair_lock_unlock(p_lock);
}

- (NSDate)stateEnd
{
  os_unfair_lock_s *p_lock;
  NSDate *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_stateEnd;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setStateEnd:(id)a3
{
  NSDate *v4;
  NSDate *stateEnd;

  v4 = (NSDate *)a3;
  os_unfair_lock_lock_with_options();
  stateEnd = self->_stateEnd;
  self->_stateEnd = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSDate)changedTimestamp
{
  os_unfair_lock_s *p_lock;
  NSDate *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_changedTimestamp;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setChangedTimestamp:(id)a3
{
  NSDate *v4;
  NSDate *changedTimestamp;

  v4 = (NSDate *)a3;
  os_unfair_lock_lock_with_options();
  changedTimestamp = self->_changedTimestamp;
  self->_changedTimestamp = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (unint64_t)lastReason
{
  os_unfair_lock_s *p_lock;
  unint64_t lastReason;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  lastReason = self->_lastReason;
  os_unfair_lock_unlock(p_lock);
  return lastReason;
}

- (void)setLastReason:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_lastReason = a3;
  os_unfair_lock_unlock(p_lock);
}

- (HMDUserActivityType6StateEvent)currentStateEvent
{
  os_unfair_lock_s *p_lock;
  HMDUserActivityType6StateEvent *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = -[HMDUserActivityType6StateEvent initWithState:stateEnd:changedTimestamp:withReason:]([HMDUserActivityType6StateEvent alloc], "initWithState:stateEnd:changedTimestamp:withReason:", self->_state, self->_stateEnd, self->_changedTimestamp, self->_lastReason);
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)_stateUpdated
{
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;

  -[HMDUserActivityType6CoreLocationTracker dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[HMDUserActivityType6CoreLocationTracker delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, "stateUpdated");
    v5 = v6;
  }

}

- (void)_registerForNotifications
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[HMDUserActivityType6CoreLocationTracker dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[HMDUserActivityType6CoreLocationTracker dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[HMDUserActivityType6CoreLocationTracker dataSource](self, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "notificationCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_handleLocationAuthorizationChangedNotification_, CFSTR("HMDLocationAuthorizationChangedNotification"), 0);

    -[HMDUserActivityType6CoreLocationTracker dataSource](self, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "notificationCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "homeLocationHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", self, sel_handleLocationChangedNotification_, CFSTR("HMDLocationForHomeChanged"), v10);

    -[HMDUserActivityType6CoreLocationTracker dataSource](self, "dataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "notificationCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", self, sel_handleDidArriveNotification_, CFSTR("HMDHomeDidArriveHomeNotificationKey"), v13);

  }
}

- (void)handleLocationAuthorizationChangedNotification:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  HMDUserActivityType6CoreLocationTracker *v10;

  v4 = a3;
  -[HMDUserActivityType6CoreLocationTracker dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __90__HMDUserActivityType6CoreLocationTracker_handleLocationAuthorizationChangedNotification___block_invoke;
  v8[3] = &unk_24E79C268;
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_async(v6, v8);

}

- (void)_handleLocationAuthorization:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;

  -[HMDUserActivityType6CoreLocationTracker dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (-[HMDUserActivityType6CoreLocationTracker locationAuthorization](self, "locationAuthorization") != a3)
  {
    -[HMDUserActivityType6CoreLocationTracker setLocationAuthorization:](self, "setLocationAuthorization:", a3);
    if (a3 == 1)
    {
      -[HMDUserActivityType6CoreLocationTracker locationManager](self, "locationManager");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "registerForVisitMonitoring:", self);

    }
    else if (a3 == 2)
    {
      -[HMDUserActivityType6CoreLocationTracker locationManager](self, "locationManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "unregisterForVisitMonitoring:", self);

      -[HMDUserActivityType6CoreLocationTracker setState:](self, "setState:", 1);
      -[HMDUserActivityType6CoreLocationTracker setStateEnd:](self, "setStateEnd:", 0);
      -[HMDUserActivityType6CoreLocationTracker setChangedTimestamp:](self, "setChangedTimestamp:", 0);
      -[HMDUserActivityType6CoreLocationTracker setLastReason:](self, "setLastReason:", 4);
      -[HMDUserActivityType6CoreLocationTracker _stateUpdated](self, "_stateUpdated");
    }
  }
}

- (void)handleLocationChangedNotification:(id)a3
{
  void *v4;
  NSObject *v5;
  _QWORD block[5];

  -[HMDUserActivityType6CoreLocationTracker dataSource](self, "dataSource", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77__HMDUserActivityType6CoreLocationTracker_handleLocationChangedNotification___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v5, block);

}

- (void)handleDidArriveNotification:(id)a3
{
  void *v4;
  NSObject *v5;
  _QWORD block[5];

  -[HMDUserActivityType6CoreLocationTracker dataSource](self, "dataSource", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__HMDUserActivityType6CoreLocationTracker_handleDidArriveNotification___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v5, block);

}

- (void)_startWithPrediction:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v4 = a3;
  -[HMDUserActivityType6CoreLocationTracker dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[HMDUserActivityType6CoreLocationTracker setPrediction:](self, "setPrediction:", v4);
  objc_msgSend(v4, "visitExitLocation");
  v19 = (id)objc_claimAutoreleasedReturnValue();

  if (-[HMDUserActivityType6CoreLocationTracker state](self, "state") != 2)
  {
    -[HMDUserActivityType6CoreLocationTracker dataSource](self, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUserActivityType6CoreLocationTracker setChangedTimestamp:](self, "setChangedTimestamp:", v8);

  }
  -[HMDUserActivityType6CoreLocationTracker setState:](self, "setState:", 2);
  -[HMDUserActivityType6CoreLocationTracker prediction](self, "prediction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predictedLocationOfInterest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "nextEntryTime");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserActivityType6CoreLocationTracker setStateEnd:](self, "setStateEnd:", v11);

  -[HMDUserActivityType6CoreLocationTracker setLastReason:](self, "setLastReason:", 11);
  -[HMDUserActivityType6CoreLocationTracker dataSource](self, "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "homeLocationHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "location");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "distanceFromLocation:", v19);
  -[HMDUserActivityType6CoreLocationTracker setClosestDistance:](self, "setClosestDistance:");
  objc_msgSend(v19, "timestamp");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserActivityType6CoreLocationTracker setClosestDistanceTimestamp:](self, "setClosestDistanceTimestamp:", v16);

  -[HMDUserActivityType6CoreLocationTracker stateEnd](self, "stateEnd");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    -[HMDUserActivityType6CoreLocationTracker _stateUpdated](self, "_stateUpdated");
  else
    -[HMDUserActivityType6CoreLocationTracker _requestEstimatedStateEndForUpdateLocation:](self, "_requestEstimatedStateEndForUpdateLocation:", v19);
  -[HMDUserActivityType6CoreLocationTracker locationManager](self, "locationManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "registerForSignificantLocationChangeMonitoring:", self);

}

- (void)_cancel
{
  void *v3;
  NSObject *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;

  -[HMDUserActivityType6CoreLocationTracker dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[HMDUserActivityType6CoreLocationTracker locationManager](self, "locationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v5, "isVisitMonitoringAllowed");

  v6 = -[HMDUserActivityType6CoreLocationTracker state](self, "state");
  if ((_DWORD)v4)
  {
    if (v6 != 3)
    {
      v7 = 3;
LABEL_7:
      -[HMDUserActivityType6CoreLocationTracker setState:](self, "setState:", v7);
      -[HMDUserActivityType6CoreLocationTracker setPrediction:](self, "setPrediction:", 0);
      -[HMDUserActivityType6CoreLocationTracker setStateEnd:](self, "setStateEnd:", 0);
      -[HMDUserActivityType6CoreLocationTracker setChangedTimestamp:](self, "setChangedTimestamp:", 0);
      -[HMDUserActivityType6CoreLocationTracker setLastReason:](self, "setLastReason:", 11);
      -[HMDUserActivityType6CoreLocationTracker setClosestDistance:](self, "setClosestDistance:", -1.0);
      -[HMDUserActivityType6CoreLocationTracker setClosestDistanceTimestamp:](self, "setClosestDistanceTimestamp:", 0);
      -[HMDUserActivityType6CoreLocationTracker locationManager](self, "locationManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "unregisterForSignificantLocationChangeMonitoring:", self);

      -[HMDUserActivityType6CoreLocationTracker _stateUpdated](self, "_stateUpdated");
    }
  }
  else if (v6 != 1)
  {
    v7 = 1;
    goto LABEL_7;
  }
}

- (void)visitExit:(id)a3 nextPredictedLocations:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  _QWORD block[5];
  id v13;
  id v14;

  v8 = a3;
  v9 = a4;
  if (!a5)
  {
    -[HMDUserActivityType6CoreLocationTracker dataSource](self, "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "queue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __82__HMDUserActivityType6CoreLocationTracker_visitExit_nextPredictedLocations_error___block_invoke;
    block[3] = &unk_24E79BBD0;
    block[4] = self;
    v13 = v8;
    v14 = v9;
    dispatch_async(v11, block);

  }
}

- (void)visitEntry:(id)a3
{
  void *v4;
  NSObject *v5;
  _QWORD block[5];

  -[HMDUserActivityType6CoreLocationTracker dataSource](self, "dataSource", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__HMDUserActivityType6CoreLocationTracker_visitEntry___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v5, block);

}

- (void)_processSignificantLocationChange:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  id v18;

  v18 = a3;
  -[HMDUserActivityType6CoreLocationTracker dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v18, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserActivityType6CoreLocationTracker dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "homeLocationHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "location");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "distanceFromLocation:", v18);
  v12 = v11;
  if (v11 <= 0.0 && fabs(v11) >= 2.22044605e-16
    || (-[HMDUserActivityType6CoreLocationTracker closestDistance](self, "closestDistance"), v12 >= v13)
    || vabdd_f64(v12, v13) < 2.22044605e-16)
  {
    -[HMDUserActivityType6CoreLocationTracker closestDistance](self, "closestDistance");
    if (v12 > v14 && vabdd_f64(v12, v14) >= 2.22044605e-16)
    {
      -[HMDUserActivityType6CoreLocationTracker closestDistance](self, "closestDistance");
      v16 = v15 * 1.4;
      if (v12 <= v16 || vabdd_f64(v12, v16) < 2.22044605e-16)
      {
        -[HMDUserActivityType6CoreLocationTracker closestDistanceTimestamp](self, "closestDistanceTimestamp");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "timeIntervalSinceDate:", v17);

      }
    }
  }
  else
  {
    -[HMDUserActivityType6CoreLocationTracker setClosestDistance:](self, "setClosestDistance:", v12);
    -[HMDUserActivityType6CoreLocationTracker setClosestDistanceTimestamp:](self, "setClosestDistanceTimestamp:", v6);
  }
  -[HMDUserActivityType6CoreLocationTracker _requestEstimatedStateEndForUpdateLocation:](self, "_requestEstimatedStateEndForUpdateLocation:", v18);

}

- (void)updatedSignificantLocation:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[HMDUserActivityType6CoreLocationTracker dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __70__HMDUserActivityType6CoreLocationTracker_updatedSignificantLocation___block_invoke;
  v8[3] = &unk_24E79C268;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

- (void)_updateStateEnd:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  id v11;

  v11 = a3;
  -[HMDUserActivityType6CoreLocationTracker dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[HMDUserActivityType6CoreLocationTracker state](self, "state") == 2)
  {
    -[HMDUserActivityType6CoreLocationTracker stateEnd](self, "stateEnd");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6
      || (-[HMDUserActivityType6CoreLocationTracker stateEnd](self, "stateEnd"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v7, "timeIntervalSinceDate:", v11),
          v9 = v8,
          v7,
          v10 = fabs(v9),
          v10 >= 600.0)
      || fabs(v10 + -600.0) < 2.22044605e-16)
    {
      -[HMDUserActivityType6CoreLocationTracker setStateEnd:](self, "setStateEnd:", v11);
      -[HMDUserActivityType6CoreLocationTracker setLastReason:](self, "setLastReason:", 11);
      -[HMDUserActivityType6CoreLocationTracker _stateUpdated](self, "_stateUpdated");
    }
  }

}

- (void)_requestEstimatedStateEndForUpdateLocation:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id location;

  v4 = a3;
  -[HMDUserActivityType6CoreLocationTracker dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (!-[HMDUserActivityType6CoreLocationTracker estimateInProgress](self, "estimateInProgress"))
  {
    -[HMDUserActivityType6CoreLocationTracker dataSource](self, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "homeLocationHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "location");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[HMDUserActivityType6CoreLocationTracker setEstimateInProgress:](self, "setEstimateInProgress:", 1);
      objc_initWeak(&location, self);
      -[HMDUserActivityType6CoreLocationTracker locationManager](self, "locationManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __86__HMDUserActivityType6CoreLocationTracker__requestEstimatedStateEndForUpdateLocation___block_invoke;
      v12[3] = &unk_24E79A5F0;
      objc_copyWeak(&v13, &location);
      objc_msgSend(v11, "requestETAFromCurrentLocation:destination:completionHandler:", v4, v10, v12);

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }

  }
}

- (HMDUserActivityType6ListenerDelegate)delegate
{
  return (HMDUserActivityType6ListenerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HMDHomeActivityStateManagerDataSource)dataSource
{
  return self->_dataSource;
}

- (HMDLocation)locationManager
{
  return self->_locationManager;
}

- (int64_t)locationAuthorization
{
  return self->_locationAuthorization;
}

- (void)setLocationAuthorization:(int64_t)a3
{
  self->_locationAuthorization = a3;
}

- (HMDUserType6Prediction)prediction
{
  return self->_prediction;
}

- (void)setPrediction:(id)a3
{
  objc_storeStrong((id *)&self->_prediction, a3);
}

- (double)closestDistance
{
  return self->_closestDistance;
}

- (void)setClosestDistance:(double)a3
{
  self->_closestDistance = a3;
}

- (NSDate)closestDistanceTimestamp
{
  return self->_closestDistanceTimestamp;
}

- (void)setClosestDistanceTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_closestDistanceTimestamp, a3);
}

- (BOOL)estimateInProgress
{
  return self->_estimateInProgress;
}

- (void)setEstimateInProgress:(BOOL)a3
{
  self->_estimateInProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_closestDistanceTimestamp, 0);
  objc_storeStrong((id *)&self->_prediction, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_changedTimestamp, 0);
  objc_storeStrong((id *)&self->_stateEnd, 0);
}

void __86__HMDUserActivityType6CoreLocationTracker__requestEstimatedStateEndForUpdateLocation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD block[5];
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __86__HMDUserActivityType6CoreLocationTracker__requestEstimatedStateEndForUpdateLocation___block_invoke_2;
    block[3] = &unk_24E79BBD0;
    block[4] = v8;
    v12 = v6;
    v13 = v5;
    dispatch_async(v10, block);

  }
}

uint64_t __86__HMDUserActivityType6CoreLocationTracker__requestEstimatedStateEndForUpdateLocation___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "setEstimateInProgress:", 0);
  if (!*(_QWORD *)(a1 + 40))
  {
    if (*(_QWORD *)(a1 + 48))
      return objc_msgSend(*(id *)(a1 + 32), "_updateStateEnd:");
  }
  return result;
}

void __70__HMDUserActivityType6CoreLocationTracker_updatedSignificantLocation___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  if (objc_msgSend(*(id *)(a1 + 32), "state") == 2)
  {
    objc_msgSend(*(id *)(a1 + 40), "lastObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = v2;
      objc_msgSend(*(id *)(a1 + 32), "_processSignificantLocationChange:", v2);
      v2 = v3;
    }

  }
}

void __54__HMDUserActivityType6CoreLocationTracker_visitEntry___block_invoke(uint64_t a1)
{
  uint64_t v2;
  HMDUserActivityStateType6DetectorTransitionLogEvent *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  HMDUserActivityStateType6DetectorTransitionLogEvent *v7;

  v2 = objc_msgSend(*(id *)(a1 + 32), "state");
  v3 = [HMDUserActivityStateType6DetectorTransitionLogEvent alloc];
  if (v2 == 2)
    v4 = 3;
  else
    v4 = 10;
  v7 = -[HMDUserActivityStateType6DetectorTransitionLogEvent initWithTrackerType:reason:](v3, "initWithTrackerType:reason:", 2, v4);
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logEventSubmitter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "submitLogEvent:", v7);

  objc_msgSend(*(id *)(a1 + 32), "_cancel");
}

void __82__HMDUserActivityType6CoreLocationTracker_visitExit_nextPredictedLocations_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDUserActivityStateType6DetectorTransitionLogEvent *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  HMDUserActivityStateType6DetectorTransitionLogEvent *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;

  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeLocationHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "location");
  v15 = objc_claimAutoreleasedReturnValue();

  v5 = (void *)v15;
  if (v15)
  {
    +[HMDUserType6Prediction predictionToHomeLocation:visitExit:predictedLocations:](HMDUserType6Prediction, "predictionToHomeLocation:visitExit:predictedLocations:", v15, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "action") == 3)
    {
      v7 = -[HMDUserActivityStateType6DetectorTransitionLogEvent initWithTrackerType:reason:]([HMDUserActivityStateType6DetectorTransitionLogEvent alloc], "initWithTrackerType:reason:", 2, 1);
      objc_msgSend(*(id *)(a1 + 32), "dataSource");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logEventSubmitter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "submitLogEvent:", v7);

      objc_msgSend(*(id *)(a1 + 32), "_startWithPrediction:", v6);
    }
    else
    {
      v10 = objc_msgSend(*(id *)(a1 + 32), "state");
      v11 = [HMDUserActivityStateType6DetectorTransitionLogEvent alloc];
      if (v10 == 2)
        v12 = 3;
      else
        v12 = 9;
      v7 = -[HMDUserActivityStateType6DetectorTransitionLogEvent initWithTrackerType:reason:](v11, "initWithTrackerType:reason:", 2, v12);
      objc_msgSend(*(id *)(a1 + 32), "dataSource");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "logEventSubmitter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "submitLogEvent:", v7);

      objc_msgSend(*(id *)(a1 + 32), "_cancel");
    }

    v5 = (void *)v15;
  }

}

void __71__HMDUserActivityType6CoreLocationTracker_handleDidArriveNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  HMDUserActivityStateType6DetectorTransitionLogEvent *v7;
  void *v8;
  void *v9;
  HMDUserActivityStateType6DetectorTransitionLogEvent *v10;

  if (objc_msgSend(*(id *)(a1 + 32), "state") == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "dataSource");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "currentDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "stateEnd");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeIntervalSinceDate:", v4);
    v6 = fabs(v5);

    v7 = -[HMDUserActivityStateType6DetectorTransitionLogEvent initWithTrackerType:reason:stateEndOffset:]([HMDUserActivityStateType6DetectorTransitionLogEvent alloc], "initWithTrackerType:reason:stateEndOffset:", 2, 2, (uint64_t)v6);
  }
  else
  {
    v7 = -[HMDUserActivityStateType6DetectorTransitionLogEvent initWithTrackerType:reason:]([HMDUserActivityStateType6DetectorTransitionLogEvent alloc], "initWithTrackerType:reason:", 1, 2);
  }
  v10 = v7;
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "logEventSubmitter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "submitLogEvent:", v10);

  objc_msgSend(*(id *)(a1 + 32), "_cancel");
}

void __77__HMDUserActivityType6CoreLocationTracker_handleLocationChangedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  HMDUserActivityStateType6DetectorTransitionLogEvent *v10;

  if (objc_msgSend(*(id *)(a1 + 32), "state") == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "prediction");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "dataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "home");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "homeLocationHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "location");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v2, "isValidWithNewLocation:", v6);

    if ((v7 & 1) == 0)
    {
      v10 = -[HMDUserActivityStateType6DetectorTransitionLogEvent initWithTrackerType:reason:]([HMDUserActivityStateType6DetectorTransitionLogEvent alloc], "initWithTrackerType:reason:", 1, 3);
      objc_msgSend(*(id *)(a1 + 32), "dataSource");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logEventSubmitter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "submitLogEvent:", v10);

      objc_msgSend(*(id *)(a1 + 32), "_cancel");
    }
  }
}

void __90__HMDUserActivityType6CoreLocationTracker_handleLocationAuthorizationChangedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hmf_numberForKey:", CFSTR("HMDLocationAuthorizationKey"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v3 = v4;
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "_handleLocationAuthorization:", objc_msgSend(v4, "integerValue"));
    v3 = v4;
  }

}

@end
