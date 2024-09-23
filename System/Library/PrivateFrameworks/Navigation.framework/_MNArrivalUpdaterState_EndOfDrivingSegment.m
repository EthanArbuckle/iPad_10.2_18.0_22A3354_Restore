@implementation _MNArrivalUpdaterState_EndOfDrivingSegment

- (int64_t)state
{
  return 5;
}

- (void)onEnterState:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[_MNArrivalUpdaterState sendArrivalInfo](self, "sendArrivalInfo", a3);
  -[_MNArrivalUpdaterState arrivalUpdater](self, "arrivalUpdater");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MNArrivalUpdaterState arrivalUpdater](self, "arrivalUpdater");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrivalUpdater:didUpdateVehicleParkingType:", v5, 2);

}

@end
