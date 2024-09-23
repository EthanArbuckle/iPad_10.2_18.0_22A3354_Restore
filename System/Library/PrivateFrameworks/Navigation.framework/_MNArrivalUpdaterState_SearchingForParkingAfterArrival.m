@implementation _MNArrivalUpdaterState_SearchingForParkingAfterArrival

- (int64_t)state
{
  return 6;
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

- (BOOL)_checkForArrival
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v11;
  char v12;
  objc_super v13;

  -[_MNArrivalUpdaterState details](self, "details");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationSessionState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "targetLeg");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrivalParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[_MNArrivalUpdaterState location](self, "location");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "containsLocation:arrivalRegionType:", v7, 7))
    goto LABEL_4;
  -[_MNArrivalUpdaterState location](self, "location");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "containsLocation:arrivalRegionType:", v8, 5))
  {

LABEL_4:
    goto LABEL_5;
  }
  -[_MNArrivalUpdaterState location](self, "location");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v6, "containsLocation:arrivalRegionType:", v11, 8);

  if ((v12 & 1) == 0)
  {
    v13.receiver = self;
    v13.super_class = (Class)_MNArrivalUpdaterState_SearchingForParkingAfterArrival;
    v9 = -[_MNArrivalUpdaterState _checkForArrival](&v13, sel__checkForArrival);
    goto LABEL_6;
  }
LABEL_5:
  v9 = 1;
LABEL_6:

  return v9;
}

@end
