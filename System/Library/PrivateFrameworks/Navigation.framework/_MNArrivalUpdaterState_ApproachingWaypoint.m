@implementation _MNArrivalUpdaterState_ApproachingWaypoint

- (int64_t)state
{
  return 2;
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
  objc_msgSend(v4, "arrivalUpdater:isApproachingEndOfLeg:", v5, objc_msgSend(v6, "legIndex"));

}

- (void)updateForLocation
{
  if (!-[_MNArrivalUpdaterState _updateForArrival](self, "_updateForArrival")
    && !-[_MNArrivalUpdaterState _updateForPreArrival](self, "_updateForPreArrival"))
  {
    -[_MNArrivalUpdaterState _updateForEVMonitoring](self, "_updateForEVMonitoring");
    -[_MNArrivalUpdaterState _updateForSearchingForParking](self, "_updateForSearchingForParking");
  }
}

@end
