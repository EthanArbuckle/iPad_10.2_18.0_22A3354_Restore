@implementation _MNArrivalUpdaterState_PreArrival

- (int64_t)state
{
  return 3;
}

- (void)onEnterState:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[_MNArrivalUpdaterState sendArrivalInfo](self, "sendArrivalInfo", a3);
  -[_MNArrivalUpdaterState arrivalUpdater](self, "arrivalUpdater");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MNArrivalUpdaterState arrivalUpdater](self, "arrivalUpdater");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MNArrivalUpdaterState targetLeg](self, "targetLeg");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrivalUpdater:didEnterPreArrivalStateForLegIndex:", v5, objc_msgSend(v6, "legIndex"));

}

- (void)updateForLocation
{
  if (!-[_MNArrivalUpdaterState _updateForArrival](self, "_updateForArrival"))
  {
    -[_MNArrivalUpdaterState _updateForEVMonitoring](self, "_updateForEVMonitoring");
    -[_MNArrivalUpdaterState _updateForSearchingForParking](self, "_updateForSearchingForParking");
  }
}

- (double)parkingDetectionExcludeRadius
{
  void *v2;
  double v3;
  double v4;

  -[_MNArrivalUpdaterState location](self, "location");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "horizontalAccuracy");
  v4 = v3 + 10.0;

  return v4;
}

@end
