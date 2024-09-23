@implementation _MNArrivalUpdaterState_None

- (_MNArrivalUpdaterState_None)init
{
  return -[_MNArrivalUpdaterState_None initWithDepartureReason:](self, "initWithDepartureReason:", 0);
}

- (_MNArrivalUpdaterState_None)initWithDepartureReason:(unint64_t)a3
{
  _MNArrivalUpdaterState_None *v4;
  _MNArrivalUpdaterState_None *v5;
  _MNArrivalUpdaterState_None *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_MNArrivalUpdaterState_None;
  v4 = -[_MNArrivalUpdaterState_None init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_departureReason = a3;
    v6 = v4;
  }

  return v5;
}

- (int64_t)state
{
  return 0;
}

- (void)onEnterState:(id)a3
{
  unint64_t departureReason;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[_MNArrivalUpdaterState sendArrivalInfo](self, "sendArrivalInfo", a3);
  departureReason = self->_departureReason;
  if (departureReason)
    v5 = departureReason == 6;
  else
    v5 = 1;
  if (!v5)
  {
    -[_MNArrivalUpdaterState arrivalUpdater](self, "arrivalUpdater");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MNArrivalUpdaterState arrivalUpdater](self, "arrivalUpdater");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MNArrivalUpdaterState targetLeg](self, "targetLeg");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrivalUpdater:didDepartFromLegIndex:withReason:", v8, objc_msgSend(v9, "legIndex"), self->_departureReason);

  }
  -[_MNArrivalUpdaterState arrivalUpdater](self, "arrivalUpdater");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stopMonitoringForEV");

}

- (void)updateForLocation
{
  if (!-[_MNArrivalUpdaterState _updateForArrival](self, "_updateForArrival")
    && !-[_MNArrivalUpdaterState _updateForPreArrival](self, "_updateForPreArrival")
    && !-[_MNArrivalUpdaterState _updateForEndOfDrivingSegment](self, "_updateForEndOfDrivingSegment")
    && !-[_MNArrivalUpdaterState _updateForApproachingWaypoint](self, "_updateForApproachingWaypoint"))
  {
    -[_MNArrivalUpdaterState _updateForEVMonitoring](self, "_updateForEVMonitoring");
  }
}

@end
