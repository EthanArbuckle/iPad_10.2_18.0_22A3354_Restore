@implementation _MNArrivalUpdaterState_Parked

- (int64_t)state
{
  return 1;
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
  objc_msgSend(v4, "arrivalUpdater:didUpdateVehicleParkingType:", v5, 1);

}

- (void)updateForResumeDriving
{
  _MNArrivalUpdaterState_None *v2;
  id v3;

  -[_MNArrivalUpdaterState arrivalUpdater](self, "arrivalUpdater");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc_init(_MNArrivalUpdaterState_None);
  objc_msgSend(v3, "changeState:", v2);

}

@end
